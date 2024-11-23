clc
% Constants
mu = 398600.4418; % km^3/s^2
J2 = 0.0010826266;
R_E = 6371; % km
delta_t = 45 * 60; % seconds
omega_earth = 7.2921159e-5; % Earth's rotation rate in rad/s

% Given values
r_p = 6700; % km
r_a = 10000; % km
theta_0 = deg2rad(230); % radians
Omega_0 = deg2rad(270); % radians
i_0 = deg2rad(60); % radians
omega_0 = deg2rad(45); % radians
chosenTolerance = 10.^-8; % [Only needed for Kepler's equation]

% Display the results
fprintf('theta_0 = %.4f rad\n', theta_0);
fprintf('Omega_0 = %.4f rad\n', Omega_0);
fprintf('i_0 = %.4f rad\n', i_0);
fprintf('omega_0 = %.4f rad\n\n', omega_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Step 1: Calculate the orbital parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate semi-major axis, eccentricity, specific angular momentum, and orbital period
a = (r_p + r_a) / 2;
e = (r_a - r_p) / (r_p + r_a);
T = 2 * pi * sqrt(a^3 / mu);

% Display the results
fprintf('a = %.4f km\n', a);
fprintf('e = %.6f\n', e);
fprintf('T = %.4f s\n\n', T);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 2: Calculate nodal regression rate and apsidal rotation rate
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nodal Regression Rate
Omega_dot = -(3 * sqrt(mu) * J2 * (R_E).^2 * cos(i_0))/(2 * a.^(7/2) * (1-e.^2).^2);
omega_dot = (3 * sqrt(mu) * J2 * (R_E).^2 * (4 - 5 * (sin(i_0)).^2))/(4 * a.^(3.5) * (1 - e.^2).^2);

% % Display the results
fprintf('Nodal regression rate: %.10f °/s\n', rad2deg(Omega_dot));
fprintf('Apsidal rotation rate: %.10f °/s\n\n', rad2deg(omega_dot));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 3: Calculate the initial mean anomaly and time until perigee
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eccentric anomaly at theta_0
E_0 = 2 * atan(sqrt((1 - e) / (1 + e)) * tan(theta_0 / 2));
% Mean anomaly at time t_0
M_0 = E_0 - e * sin(E_0);
% Time since perigee passage (t_0) calculated from M_0
t_0 = (M_0 / (2 * pi)) * T;

% % Display the results
fprintf('E_0 = %.4f rad\n', E_0);
fprintf('M_0 = %.4f rad\n', M_0);
fprintf('t_0 = %.4f s (%.1f s until perigee)\n\n', t_0, abs(t_0));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 4: Calculate the orbital elements at the given time
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = 2 * pi * ((t_0 + delta_t) / T);
% Solve Kepler's equation for Eccentric anomaly (E)
E = week3_kepler_equation(e, M, chosenTolerance);
% New true anomaly from eccentric anomaly
theta_new = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(E / 2));

% Display the results
fprintf('M = %.5f rad\n', M);
fprintf('E = %.5f rad\n', E);
fprintf('theta = %.4f rad = %.4f°\n', theta_new, rad2deg(theta_new));
fprintf('Omega = %.4f°\n', rad2deg(Omega_0) + Omega_dot * delta_t);
fprintf('omega = %.4f°\n\n', rad2deg(omega_0) + omega_dot * delta_t);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 5: Calculate the position vector in the geocentric equatorial frame
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = sqrt(a * mu * (1 - e.^2));
% Cartesian Coordinate in PQW (r_x = r_PQW)
r_x = h^2/mu/(1+e*cos(theta_new))*[cos(theta_new);sin(theta_new);0];

% IJK -> PQW (R_313(Omega, i, -omega))
Q1 = [[cos(omega_0);-sin(omega_0);0], [sin(omega_0);cos(omega_0);0],[0;0;1]];
Q2 = [[1;0;0], [0;cos(i_0);-sin(i_0)], [0;sin(i_0);cos(i_0)]];
Q3 = [[cos(Omega_0);-sin(Omega_0);0], [sin(Omega_0);cos(Omega_0);0], [0;0;1]];
Q = Q1 * Q2 * Q3;

% Transposing converts the R_313(Omega, i, omega) to R_313(-omega, -i, -Omega) which means that we get the R_313 required to convert from PQW to IJK
Q_T = transpose(Q);

% Multiplying r_PQW by R_313(-omega, -i, -Omega) = r_IJK (aka the state vector in the geocentric equatorial frame)
r = Q_T * r_x;

% Displaying the result
fprintf('h = %.4f\n', h);
fprintf('PQW->IJK Transformation Matrix (Q_T):\n');
fprintf('[%.3f, %.3f, %.3f]\n', Q_T);
fprintf('Geocentric Equatorial Coordinates:\n');
fprintf('r = [%.3f, %.3f, %.3f] km\n\n', r);

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
r_X_ECEF = R_geo_to_ECEF * r;

% Displaying the result
fprintf('Geocentric ECEF Coordinates:\n');
fprintf('theta_E = %.4f rad = %.4f°\n', theta_E, rad2deg(theta_E));
fprintf('R_3(theta_3):\n');
fprintf('[%.3f, %.3f, %.3f]\n', R_geo_to_ECEF);
fprintf('r_x'' = [%.3f, %.3f, %.3f] km\n', r_X_ECEF);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 7: Calculate the geodetic latitude and longitude
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geodetic latitude and longitude
r_x_dash = sqrt(r_X_ECEF(1)^2 + r_X_ECEF(2)^2 + r_X_ECEF(3)^2);
l = r_X_ECEF(1) / r_x_dash;
m = r_X_ECEF(2) / r_x_dash;
n = r_X_ECEF(3) / r_x_dash;

phi = asin(n);

lambda = acos(l/cos(phi));
if m <= 0
    lambda = deg2rad(360) - lambda;
end

% Printing the result
fprintf('l = %.4f\n', l);
fprintf('m = %.4f\n', m);
fprintf('n = %.4f\n', n);
fprintf('phi = %.4f rad = %.4f°\n', phi, rad2deg(phi));
fprintf('Latitude: phi = %.4f°\n', rad2deg(phi));
fprintf('Longitude: lambda = %.4f°\n', rad2deg(lambda));

%% Kepler Equation Method
function [eccentricAnomaly] = week3_kepler_equation(eccentricity, meanAnomaly, chosenTolerance)
    if meanAnomaly <= pi
        eccentricAnomaly = meanAnomaly + (eccentricity/2); % Radians
    elseif meanAnomaly > pi
        eccentricAnomaly = meanAnomaly - (eccentricity/2); % Radians
    end

    i = 0;
    while true
        % Step 2
        eccentricAnomalyF = eccentricAnomaly - eccentricity * sin(eccentricAnomaly) - meanAnomaly;
        eccentricAnomalyFDash = 1 - eccentricity * cos(eccentricAnomaly);

        % Step 3
        eta = eccentricAnomalyF / eccentricAnomalyFDash;

        % Step 4
        if abs(eta) > chosenTolerance
            eccentricAnomaly = eccentricAnomaly - eta;
            fprintf('Iteration %d: deltaE = %.17f\n', i, eta);
        elseif abs(eta) < chosenTolerance
            fprintf('Iteration %d: deltaE = %.17f\n', i, eta);
            break
        end
        i = i + 1;
    end

    % Final Output
    fprintf('E = %.5f rad = %.4f°\n\n', eccentricAnomaly, rad2deg(eccentricAnomaly));
end