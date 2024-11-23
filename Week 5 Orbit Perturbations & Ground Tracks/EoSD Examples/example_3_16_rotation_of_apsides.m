clc
% What is the rotation of apsides for an Earth orbit with the following characteristics
mu = 398600; % km
h_p = 185; % km (periapsis altitude) 
h_a = 555; % km (apoapsis altitude)
i = 30; % deg (inclination)

% Additional constants
J2 = 1.08263 * 10.^(-3); % perturbation
R0 = 6378.14; % km (gravitational parameter)

% FIND THE SEMI-MAJOR AXIS, a
a = ((h_a + R0) + (h_p + R0))/2;
fprintf('Semi-major Axis, a = %.1f km\n', a);

% FIND THE ECCENTRICITY, e
r_a = h_a + R0;
r_p = h_p + R0;
e = (r_a - r_p)/(r_a + r_p);
fprintf('Eccentricity, e = %.6f\n', e);

% FIND THE MEAN MOTION, n
n = sqrt(mu/a.^3);
fprintf('Mean motion, n = %.7f\n', n);

% FIND THE ROTATION OF APSIDES, omega_dot
omega_dot = (3 * n * J2 * R0.^2 * (4 - 5 * (sin(deg2rad(i))).^2))/(4 * a.^2 * (1 - e.^2).^2);
fprintf('Rotation of apsides, omega_dot = %.10f rad/s = %.2f deg/day\n', omega_dot, rad2deg(omega_dot) * 60 * 60 * 24);