% Input
ra = 6878; % km
rp = 6838; % km
i = 30; % deg
Omega = 40; % deg
omega = 60; %deg
theta = 30; %deg

% Find the state vector r in the geocentric equatorial frame (Geocentric equatorial fram = IJK)
e = (ra - rp)/(ra + rp);
mu = 398600;
a = (ra + rp)/2;
h = sqrt(a * mu * (1 - e.^2));

% IJK -> PQW (R_313(Omega, i, -omega))
Q1 = [[cosd(omega);-sind(omega);0], [sind(omega);cosd(omega);0],[0;0;1]];
Q2 = [[1;0;0], [0;cosd(i);-sind(i)], [0;sind(i);cosd(i)]];
Q3 = [[cosd(Omega);-sind(Omega);0], [sind(Omega);cosd(Omega);0], [0;0;1]];
Q = Q1 * Q2 * Q3;

% Transposing converts the R_313(Omega, i, omega) to R_313(-omega, -i, -Omega) which means that we get the R_313 required to convert from PQW to IJK
Q_T = transpose(Q);

% Cartesian Coordinate in PQW (r_x = r_PQW)
r_x = h^2/mu/(1+e*cosd(theta))*[cosd(theta);sind(theta);0];

% Multiplying r_PQW by R_313(-omega, -i, -Omega) = r_IJK (aka the state vector in the geocentric equatorial frame)
r = Q_T * r_x;

% Need to figure out how to find v (this was my guess)
% v_x = mu/h*[-sind(theta);e + cosd(theta);0];

% Output
fprintf('Geocentric equatorial position vector = [%f, %f, %f] km\n', r(1), r(2), r(3));