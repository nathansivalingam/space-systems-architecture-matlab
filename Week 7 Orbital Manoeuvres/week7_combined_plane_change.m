%%% IMPORTANT NOTE!!! THIS PROGRAM ONLY WORKS FOR CIRCULAR ORBITS %%%
% Planetary Characteristics
mu = 398600.4; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378; % km [Input]

% Initial Orbit Characteristics
i_i = 28; % deg [Input]
h_ai = 150; % km [Input]
h_pi = 150; % km [Input]
r_ai = h_ai + R_0; % km
r_pi = h_pi + R_0; % km
a_i = (r_ai + r_pi)/2; % km
fprintf('a_i = %.0f km\n', a_i);

% Final Orbit Characteristics
i_f = 45; % deg [Input]
h_af = 20000; % deg [Input]
h_pf = 20000; % km [Input]
r_af = h_af + R_0; % km
r_pf = h_pf + R_0; % km
a_f = (r_af + r_pf)/2; % km
fprintf('a_f = %.0f km\n', a_f);

% Tranfer orbit characteritics
r_pt = r_pi;
r_at = r_af;
a_t = (r_at + r_pt)/2; % km
fprintf('a_t = %.1f km\n', a_t);

% (a) What is the energy of the transfer orbit
varEpsilon = - mu / (2 * a_t);
fprintf('ε = %.4f km^2/s^2\n', varEpsilon);

% (b) What is the velocity change needed to go from the initial orbit to the transfer orbit? (E.g., DeltaV_1)
V_pt = sqrt(2*mu/r_pt - mu/a_t); % km/s
V_i = sqrt(2*mu/r_pi - mu/a_i); % km/s
DeltaV_1 = abs(V_pt - V_i); % km/s
fprintf('ΔV_1 = %.4f km/s\n', DeltaV_1);

% (c) What is the combined plane change ΔV to go from the transfer orbit to the final orbit and change the inclination?
% DeltaV_2
V_i = sqrt(2 * mu / r_at - mu / a_t);
V_f = sqrt(2 * mu / r_af - mu / a_f);
alpha = abs(i_f - i_i);
DeltaV_2 = sqrt((V_i).^2 + (V_f).^2 - 2 * V_i * V_f * cosd(alpha));
fprintf('ΔV_2 = %.4f km/s\n', DeltaV_2);

% The total change in velocity DeltaV
DeltaV = DeltaV_1 + DeltaV_2;
fprintf('ΔV = %.3f km/s\n', DeltaV);