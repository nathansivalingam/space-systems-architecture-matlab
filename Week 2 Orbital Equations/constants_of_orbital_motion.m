% Position and velocity of a satellite in a geocentric-equatorial coordinate system
r = [7000, 0, 0]; % Position vector [km]
v = [0, -7.063, 0]; % Velocity vector [km/s]

% Specific angular momentum
fprintf('The specific angular momentum, h:\n');
fprintf('%.4f I   %.4f J   %.4f K\n', cross(r, v));
