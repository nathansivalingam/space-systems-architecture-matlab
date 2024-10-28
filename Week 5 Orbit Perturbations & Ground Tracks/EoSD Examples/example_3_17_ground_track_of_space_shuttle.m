h_p = 270; % km
h_a = 279; % km
e = 0.000676;
a = 6652.64; % km
T = 90; % min
omega = 25; % deg
i = 28.5; % deg
longitude_of_the_ascending_node = 167; % deg east (third orbit)

% Additional constants
mu = 398600.4;

% Find the latitude and longitude of Atlantis for a true anomaly of 20 deg

% True anomaly at the ascending node
theta = 360 - 25; % 335 deg

% Find the eccentric anomaly, E
E = acos((e + cos(deg2rad(theta)))/(1 + e * cos(deg2rad(theta))));
fprintf('Eccentric anomaly, E = %.4f rad\n', E);

% Calculate the mean motion, n
n = sqrt(mu/a.^3);
fprintf('Mean motion, n = %.7f\n', n);

% Calculate the time since passing the ascending node
t = (E - e * sin(E))/n;
fprintf('Time since passing the ascending node = %.1f seconds\n', t);
% Equation above also calculates the shortest time since periapsis

% Repeat the equations above for a true anomaly, theta = 20 degrees, yields 299.6 seconds
% Therefore, time from the ascending node to the current position = 674.1 seconds
A_La = 20 + 25;
t = 674.1;

% Current latitude of Atlantis
La = asin(sin(deg2rad(i)) * sin(deg2rad(A_La)));
fprintf('Current latitude of Atlantis, La = %.2f deg North\n', rad2deg(La));
% Latitude is north because A_La is between 0 and 180 deg

% The longitudinal angle
Lo = asin(tan(La) / tan(deg2rad(i)));
fprintf('Longitudinal angle, Lo = %.2f deg\n', rad2deg(Lo));

% The rotation of the Earth since passing the ascending node
Re =  0.004178 * t;
fprintf('Longitudinal adjustment, Re = %.2f deg\n', Re);

% The regression of nodes since passing the ascending node
Omega_dot = (-2.06474 * 10.^14 * cos(deg2rad(i)) / (a.^3.5 * (1 - e.^2).^2)) / 24 / 60 / 60;
fprintf('Nodal regression rate = %.10f deg/s\n', Omega_dot);

% Regression since passing the ascending node
deltaOmega = Omega_dot * t;
fprintf('Regression since passing the ascending node = %.4f deg\n', deltaOmega);

% Calculate the east longitude
Lo = longitude_of_the_ascending_node + rad2deg(Lo) - deltaOmega - Re;
fprintf('Lo = %.2f deg east\n', Lo);

% Convert east longitude to east-west convention
Lo = 360 - Lo;
fprintf('Lo = %.1f deg west\n', Lo);

% If we were proceeding to calculate additional positions, we would now calculate
% the rotation of apsides to reposition the perigee for the next point.