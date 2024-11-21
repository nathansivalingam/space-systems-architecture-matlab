clc
%
mu = 398600; % km^3/s^2
r = 6378.14 + 350;
a = r;

%% Velocity of a satellite in circular orbit
v = sqrt(mu/r);
fprintf('v = %.4f km/s\n', v);

%% Period of a satellite in circular orbit
T = 2 * pi * sqrt(a.^3 / mu);
fprintf('T = %.4f seconds\n', T);