clc
% What is the regression of nodes for the STS30, which achieved a near-circular orbit with the following characteristics
h_p = 270; % periapsis altitude [km]
h_a = 279; % apoapsis altitude [km]
i = 28.5; % inclination [deg]

% Additional constants
R0 = 6378.14; % equatorial radius [km]
mu = 398600.4; % gravitational parameter [km]
J2 = 1.08263 * 10.^(-3);
e = 0.00068;

% FIND THE SEMI MAJOR AXIS, a
a = ((h_a + R0) + (h_p + R0))/2;
fprintf('Semi-major Axis, a = %.1f km\n', a);

% FIND THE MEAN MOTION, n
n = sqrt(mu/a.^3);
fprintf('Mean motion, n = %.6f\n', n);

% FIND THE NODE REGRESSION RATE, Omega_dot
Omega_dot = (-3 * n * J2 * R0.^2 * cos(deg2rad(i)))/(2 * a.^2 * (1 - e.^2).^2);
fprintf('Nodal regression rate = %.9f rad/s = %.4f deg/day\n', Omega_dot, rad2deg(Omega_dot) * 60 * 60 * 24);
