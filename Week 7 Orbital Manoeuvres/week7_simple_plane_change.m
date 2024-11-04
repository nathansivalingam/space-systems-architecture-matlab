%%% IMPORTANT NOTE!!! THIS PROGRAM ONLY WORKS FOR CIRCULAR ORBITS %%%
% Planetary Characteristics
mu = 398600; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378; % km [Input]

% Initial Orbit Characteristics
i_i = 28.5; % deg [Input]
h_i = 300; % km [Input]
r_i = h_i + R_0; % km
a_i = r_i; % km
fprintf('a_i = %.0f km\n', a_i);

% Final Orbit Characteristics
i_f = 0; % deg [Input]
h_f = 300; % km [Input]
r_f = h_f + R_0; % km
a_f = r_f; % km
fprintf('a_f = %.0f km\n', a_f);

% Find the minimal velocity (V_i) (for circular orbits, V_i = V = const)
V_i = sqrt((2 * mu / r_i) - mu / a_i);
fprintf('V_i = %.4f km/s\n', V_i);

% Find the change in velocity required for simple plane change
alpha = abs(i_f - i_i);
DeltaV = 2 * V_i * sind(alpha/2);
fprintf('ΔV = %.4f km/s\n', DeltaV);

% Spacecraft now needs to change RAAN by 35 deg, find required DeltaV (Q3 Specific)
alpha = 35; % deg [Input]
DeltaV = 2 * V_i * sind(alpha/2);
fprintf('ΔV_RAAN = %.4f km/s\n', DeltaV);
