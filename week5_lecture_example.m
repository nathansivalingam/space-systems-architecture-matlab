% Constants
mu = 398600.4418; % km^3/s^2
J2 = 0.0010826266;
R_E = 6378; % km

% Given values
r_p = 6700; % km
r_a = 10000; % km
theta = deg2rad(230); % radians
Omega = deg2rad(270); % radians
i = deg2rad(60); % radians
omega = deg2rad(45); % radians

fprintf('theta = %.3f deg\n', rad2deg(theta));
fprintf('Omega = %.3f deg\n', rad2deg(Omega));
fprintf('i = %.3f deg\n', rad2deg(i));
fprintf('omega = %.3f deg\n', rad2deg(omega));


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
fprintf('h = %.2f km^2/s\n', h);
fprintf('T = %.1f s\n', T);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 2: Calculate nodal regression rate and apsidal rotation rate
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Write your code here



% % Display the results
% fprintf('Nodal regression rate: %.10f °/s\n', rad2deg(Omega_dot));
% fprintf('Apsidal rotation rate: %.10f °/s\n', rad2deg(omega_dot));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 3: Calculate the initial mean anomaly and time until perigee
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Additional calculations for initial mean anomaly and time until perigee
% %% Write your code here



% % Display the results
% fprintf('E_0 = %.4f rad\n', E_0);
% fprintf('M_0 = %.4f rad\n', M_0);
% fprintf('t_0 = %.1f s (%.1f s until perigee)\n', t_0, abs(t_0));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 4: Calculate the orbital elements at the given time
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Write your code here




% % Display the results
% fprintf('M = %.5f rad\n', M);
% fprintf('E = %.5f rad\n', E);
% fprintf('theta = %.3f deg\n', rad2deg(theta));
% fprintf('Omega = %.3f deg\n', rad2deg(Omega));
% fprintf('omega = %.3f deg\n', rad2deg(omega));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 5: Calculate the position vector in the geocentric equatorial frame
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Write your code here



% % Displaying the result
% fprintf('r_x = [%f, %f, %f] km\n', r_X_geocentric);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 6: Calculate the position vector in the geocentric ECEF frame
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Write your code here




% fprintf('theta_E = %.3f deg\n', rad2deg(theta_E));
% %% Write your code here



% % Displaying the result
% fprintf('r_x'' = [%f, %f, %f] km\n', r_X_ECEF);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Step 7: Calculate the geodetic latitude and longitude
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Write your code here




% % Printing the result
% fprintf('Latitude: phi = %.2f deg\n', rad2deg(phi));
% fprintf('Longitude: lambda = %.2f deg\n', rad2deg(lambda_));