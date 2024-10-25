% Constants
mu = 398600.4418; % km^3/s^2
J2 = 0.0010826266;
R_E = 6378; % km
omega_earth = 7.2921159e-5; % Earth's rotation rate in rad/s

% Given values
r_p = 6700; % km
r_a = 10000; % km
theta = deg2rad(230); % radians
Omega = deg2rad(270); % radians
i = deg2rad(60); % radians
omega = deg2rad(45); % radians

%fprintf('theta = %.3f deg\n', rad2deg(theta));
%fprintf('Omega = %.3f deg\n', rad2deg(Omega));
%fprintf('i = %.3f deg\n', rad2deg(i));
%fprintf('omega = %.3f deg\n', rad2deg(omega));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Step 1: Calculate the orbital parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate semi-major axis, eccentricity, specific angular momentum, and orbital period
a = (r_p + r_a) / 2;
e = (r_a - r_p) / (r_p + r_a);
h = sqrt(mu * r_p * (1 + e));
T = 2 * pi * sqrt(a^3 / mu);

% Display the results
fprintf('a = %.2f km\n', a);
fprintf('e = %.5f\n', e);
%fprintf('h = %.2f km^2/s\n', h);
fprintf('T = %.1f s\n', T);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 2: Calculate nodal regression rate and apsidal rotation rate
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nodal Regression Rate
Omega_dot = - (3/2) * J2 * (R_E^2 / a^2) * sqrt(mu / a^3) * cos(i);
omega_dot = (3/4) * J2 * (R_E^2 / a^2) * sqrt(mu / a^3) * (5 * cos(i)^2 - 1);

% % Display the results
fprintf('Nodal regression rate: %.10f °/s\n', rad2deg(Omega_dot));
fprintf('Apsidal rotation rate: %.10f °/s\n', rad2deg(omega_dot));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 3: Calculate the initial mean anomaly and time until perigee
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eccentric anomaly at theta_0
E_0 = 2 * atan(sqrt((1 - e) / (1 + e)) * tan(theta / 2));
% Mean anomaly at time t_0
M_0 = E_0 - e * sin(E_0);
% Time since perigee passage (t_0) calculated from M_0
t_0 = M_0 * sqrt(a^3 / mu);

% % Display the results
fprintf('E_0 = %.4f rad\n', E_0);
fprintf('M_0 = %.4f rad\n', M_0);
fprintf('t_0 = %.1f s (%.1f s until perigee)\n', t_0, abs(t_0));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 4: Calculate the orbital elements at the given time
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User inputs the time delta_t in minutes
delta_t_minutes = 45; % MUST CHANGE FOR EACH QN
delta_t = delta_t_minutes * 60; % Convert minutes to seconds
% New mean anomaly at time t_0 + delta_t
M = M_0 + sqrt(mu / a^3) * delta_t;
% Solve Kepler's equation for Eccentric anomaly (E)
E = M;
for j = 1:100
    E = M + e * sin(E);  % Iterative method for solving E
end
% New true anomaly from eccentric anomaly
theta_new = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(E / 2));

% Display the results
fprintf('M = %.5f rad\n', M);
fprintf('E = %.5f rad\n', E);
fprintf('theta = %.3f deg\n', rad2deg(theta_new));
fprintf('Omega = %.3f deg\n', rad2deg(Omega) + Omega_dot * delta_t);
fprintf('omega = %.3f deg\n', rad2deg(omega) + omega_dot * delta_t);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 5: Calculate the position vector in the geocentric equatorial frame
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Radial distance (r)
r = a * (1 - e * cos(E));
% Position vector in the perifocal coordinate system
r_pf = [r * cos(theta_new); r * sin(theta_new); 0];
% Rotation matrix to transform from perifocal to geocentric equatorial frame
R_pf_to_geo = [cos(Omega) * cos(omega) - sin(Omega) * sin(omega) * cos(i), -cos(Omega) * sin(omega) - sin(Omega) * cos(omega) * cos(i), sin(Omega) * sin(i);
    sin(Omega) * cos(omega) + cos(Omega) * sin(omega) * cos(i), -sin(Omega) * sin(omega) + cos(Omega) * cos(omega) * cos(i), -cos(Omega) * sin(i);
    sin(omega) * sin(i), cos(omega) * sin(i), cos(i)];
% Position vector in the geocentric equatorial frame
r_X_geocentric = R_pf_to_geo * r_pf;

% Displaying the result
fprintf('Geocentric Equatorial Coordinates:\n');
fprintf('r_x = [%.3f, %.3f, %.3f] km\n', r_X_geocentric);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 6: Calculate the position vector in the geocentric ECEF frame
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Earth's rotation over delta_t
theta_E = omega_earth * delta_t;
% Rotation matrix for Earth’s rotation
R_geo_to_ECEF = [cos(theta_E), sin(theta_E), 0;
    -sin(theta_E), cos(theta_E), 0;
    0, 0, 1];
% Position vector in the ECEF frame
r_X_ECEF = R_geo_to_ECEF * r_X_geocentric;
% Displaying the result
fprintf('Geocentric ECEF Coordinates:\n');
fprintf('theta_E = %.3f deg\n', rad2deg(theta_E));
fprintf('r_x'' = [%.3f, %.3f, %.3f] km\n', r_X_ECEF);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 7: Calculate the geodetic latitude and longitude
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geodetic latitude and longitude
rho = sqrt(r_X_ECEF(1)^2 + r_X_ECEF(2)^2);
delta = atan2(r_X_ECEF(2), r_X_ECEF(1));

if r_X_geocentric(2) <= 0
    delta = 360 + rad2deg(delta);
end

alpha = atan2(r_X_ECEF(3), rho);
% Printing the result
fprintf('Latitude: alpha = %.2f deg\n', rad2deg(alpha));
fprintf('Longitude: delta = %.2f deg\n', delta);