clc
% Planetary Characteristics
mu = 398600; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378.14; % km [Input]

% Initial Orbit Characteristics (for circular orbit: h_ai = h_pi)
h_ai = 300; % km [Input]
h_pi = 300; % km [Input]
r_ai = h_ai + R_0; % km
r_pi = h_pi + R_0; % km
a_i = (r_ai + r_pi)/2; % km
fprintf('a_i = %.4f km\n', a_i);

% Final Orbit Characteristics (for circular orbit: h_af = h_pf)
h_af = 35779.86; % km [Input]
h_pf = 35779.86; % km [Input]
r_af = h_af + R_0; % km
r_pf = h_pf + R_0; % km
a_f = (r_af + r_pf)/2; % km
fprintf('a_f = %.4f km\n', a_f);

% STEP 1: Find the semi-major axis of the transfer orbit
r_at = r_af; % [Only change if transfer orbit characteristics are given]
r_pt = r_pi; % [Only change if transfer orbit characteristics are given]
a_t = (r_at + r_pt)/2; % km
fprintf('a_t = %.4f km\n', a_t);

% STEP 2: Find deltaV_1
V_pt = sqrt(2*mu/r_pt - mu/a_t); % km/s
fprintf('-> ΔV_pt = %.4f km/s\n', V_pt); % km/s
V_i = sqrt(2*mu/r_pi - mu/a_i); % km/s
fprintf('-> ΔV_i = %.4f km/s\n', V_i); % km/s
DeltaV_1 = abs(V_pt - V_i); % km/spt
fprintf('ΔV_1 = %.4f km/s\n', DeltaV_1);

% STEP 3: Find deltaV_2
V_f = sqrt(2*mu/r_af - mu/a_f); % km/s
fprintf('-> ΔV_f = %.4f km/s\n', V_f); % km/s
V_at = sqrt(2*mu/r_at - mu/a_t); % km/s
fprintf('-> ΔV_at = %.4f km/s\n', V_at); % km/s
DeltaV_2 = abs(V_f - V_at); % km/s
fprintf('ΔV_2 = %.4f km/s\n', DeltaV_2);

% STEP 4: Find deltaV
DeltaV = DeltaV_1 + DeltaV_2; % km/s
fprintf('ΔV = %.4f km/s\n', DeltaV);

% STEP 5: Transfer orbit time
TOF = 1/2 * 2 * pi * sqrt(((a_t).^3)/mu); % seconds
fprintf('TOF = %.0f seconds = %.1f days\n', TOF, TOF / 86400);

img = imread(fullfile('hohmann_transfer_diagram.png'));
imshow(img);