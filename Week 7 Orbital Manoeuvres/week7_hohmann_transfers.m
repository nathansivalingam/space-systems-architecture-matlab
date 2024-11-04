% Planetary Characteristics
mu = 398600;
R_0 = 6378; % km

% Initial Orbit Characteristics (assumed circular orbit)
h_i = 300; % km
r_i = h_i + R_0; % km

% Final Orbit Characteristics (assumed circular orbit)
h_f = 3000; % km
r_f = h_f + R_0; % km

% STEP 1: Find the semi-majro axis of the transfer orbit
a_t = (r_i + r_f)/2; % km
r_pt = r_i;
r_at = r_f;

% STEP 2: Find deltaV_1
V_pt = sqrt(2*mu/r_pt - mu/a_t); % km/s
V_i = sqrt(mu/r_pt); % km/s
deltaV_1 = abs(V_pt - V_i); % km/s

% STEP 3: Find deltaV_2
V_at = sqrt(2*mu/r_at - mu/a_t); % km/s
V_f = sqrt(mu/r_at); % km/s
deltaV_2 = abs(V_at - V_f); % km/s

% STEP 4: Find deltaV
deltaV = deltaV_1 + deltaV_2; % km/s
fprintf('Total deltaV required for a Hohmanns transfer between to coplanar circular orbits = %.4f km/s\n', deltaV);

% STEP 5: Transfer orbit time
TOF = 1/2 * 2 * pi * sqrt(((a_t).^3)/mu); % seconds
fprintf('Transfer orbit time = %.0f seconds\n', TOF);