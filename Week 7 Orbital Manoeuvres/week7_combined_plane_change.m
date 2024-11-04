%%% IMPORTANT NOTE!!! THIS PROGRAM ONLY WORKS FOR CIRCULAR ORBITS %%%
% Planetary Characteristics
mu = 398600; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378; % km [Input]

% Initial Orbit Characteristics
i_i = 28; % deg [Input]
h_i = 150; % km [Input]
r_i = h_i + R_0; % km
a_i = r_i; % km
fprintf('a_i = %.0f km\n', a_i);

% Final Orbit Characteristics
i_f = 45; % deg [Input]
h_f = 20000; % km [Input]
r_f = h_f + R_0; % km
a_f = r_f; % km
fprintf('a_f = %.0f km\n', a_f);

% Tranfer orbit characteritics
r_pt = r_i;
r_at = r_f;
a_t = (r_at + r_pt)/2; % km
fprintf('a_t = %.0f km\n', a_t);

% (a) What is the energy of the transfer orbit
varEpsilon = - mu / (2 * a_t);
fprintf('ε = %.4f km^2/s^2\n', varEpsilon);

% (b) What is the velocity change needed to go from the initial orbit to the transfer orbit? (E.g., DeltaV_1)
% PLUG THE VALUES INTO THE HOHMANN TRANSFER PROGRAM
DeltaV_1 = 2.0800; % km/s
fprintf('ΔV_1 = %.4f km/s\n', DeltaV_1);

% (c) What is the combined plane change ΔV to go from the transfer orbit to the final orbit and change the inclination?
V_i = sqrt(2 * mu / r_at - mu / a_t);
V_f = sqrt(2 * mu / r_f - mu / a_f);
alpha = abs(i_f - i_i);
DeltaV_2 = sqrt((V_i).^2 + (V_f).^2 - 2 * V_i * V_f * cosd(alpha));
fprintf('ΔV_2 = %.4f km/s\n', DeltaV_2);