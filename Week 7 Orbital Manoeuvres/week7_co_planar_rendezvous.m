clc
% Planetary Characteristics
mu = 398600; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378.14; % km [Input]

% t = target, i = interceptor
% (assumed initial and final circular orbit)
h_t = 410; % km [Input of the radius of the final orbit]
h_i = 200; % km [Input of the radius of the initial orbit]
r_t = R_0 + h_t; % km
r_i = R_0 + h_i; % km

% Additional characteristics
Phi_i = deg2rad(30); % rad [Input]

% TOF of the transfer orbit
a_t = (r_t + r_i)/2; % km
fprintf('a_t = %.4f km\n', a_t);
TOF = pi * sqrt(a_t.^3 / mu); % seconds
fprintf('TOF = %.4f seconds\n', TOF);

% Angular velocities of the shuttle and satellite
omega_t = sqrt(mu / r_t.^3); % rad/s
omega_i = sqrt(mu / r_i.^3); % rad/s
fprintf('ω_t = %.8f rad/s\n', omega_t);
fprintf('ω_i = %.8f rad/s\n', omega_i);

% Lead angle
alpha = omega_t * TOF; % rad
fprintf('α = %.4f rad\n', alpha);

% Final phase angle
Phi_f = pi - alpha; % rad
fprintf('Phi_f = %.4f rad\n', Phi_f);

% Wait time
WT = (Phi_f - Phi_i)/(omega_t - omega_i);
fprintf('Wait time = %.4f seconds\n', WT);
