% ===============================================================================
% Orbital Period Comparison (Sentinel vs Garbage Gyre Tracking System (GGTS))
% ===============================================================================
%% Input
% Constants
G = 6.67430 * 10.^-11; % N * m.^2 / kg
M = 5.972 * 10.^24; % kg
mu = G * M; % m^3/s^2
R_E = 6378.14 * 10.^3; % m
h_Sentinel1 = 693 * 10.^3; % m (Sentinel-1A and Sentinel-1B have the same altitude)
h_GGTS = 500 * 10.^3; % k
a_Sentinel1 = R_E + h_Sentinel1; % m
a_GGTS = R_E + h_GGTS; % m

% Function
T_Sentinel1 = 2 * pi * sqrt((a_Sentinel1).^3 / mu);
T_GGTS = 2 * pi * sqrt((a_GGTS).^3 / mu);

% Output
fprintf('Orbital Period (Sentinel), T = %.4f sec = %.4f min\n', T_Sentinel1, T_Sentinel1 / 60);
fprintf('Orbital Period (GGTS), T = %.4f sec = %.4f min\n', T_GGTS, T_GGTS / 60);
