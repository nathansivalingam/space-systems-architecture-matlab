% Planetary Characteristics
mu = 398600; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378.14; % km [Input]

% Initial Orbit Characteristics (for circular orbit: h_ai = h_pi)
a_i = 7378.14; % R_0 + 600;
e_i = 0.001; % 0.001;
r_ai = a_i * (1 + e_i); % km
r_pi = a_i * (1 + e_i); % km
fprintf('r_ai = %.6f km\n', r_ai);
fprintf('r_pi = %.6f km\n', r_pi);

% Final Orbit Characteristics (for circular orbit: h_af = h_pf)
a_f = 6878.14; % R_0 + 500;
e_f = 0.001; % 0.001;
r_af = a_f * (1 + e_f); % km
r_pf = a_f * (1 + e_f); % km
fprintf('r_af = %.6f km\n', r_af);
fprintf('r_pf = %.6f km\n', r_pf);

% STEP 1: Find the semi-major axis of the transfer orbit
r_pt = r_pf;
r_at = r_ai;
a_t = (r_at + r_pt)/2; % km
fprintf('a_t = %.6f km\n', a_t);

% STEP 2: Find deltaV_1
V_at = sqrt(2*mu/r_at - mu/a_t); % km/s
V_i = sqrt(2*mu/r_pi - mu/a_i); % km/s
DeltaV_1 = abs(V_at - V_i); % km/s
fprintf('ΔV_1 = %.6f m/s\n', DeltaV_1 * 10.^3);

% STEP 3: Find deltaV_2
V_pt = sqrt(2*mu/r_pt - mu/a_t); % km/s
V_f = sqrt(2*mu/r_af - mu/a_f); % km/s
DeltaV_2 = abs(V_pt - V_f); % km/s
fprintf('ΔV_2 = %.6f m/s\n', DeltaV_2 * 10.^3);

% STEP 4: Find deltaV
DeltaV = DeltaV_1 + DeltaV_2; % km/s
fprintf('ΔV = %.6f km/s\n', DeltaV);

% STEP 5: Transfer orbit time
TOF = 1/2 * 2 * pi * sqrt(((a_t).^3)/mu); % seconds
fprintf('TOF = %.6f seconds = %.6f days\n', TOF, TOF / 86400);