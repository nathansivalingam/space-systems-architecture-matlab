clc
%
R_0 = 6378.14; % km

h_1 = 1700; % km
r_1 = R_0 + h_1; % km
theta_1 = 130; % deg

h_2 = 500; % km
r_2 = R_0 + h_2; % km
theta_2 = 50; % deg

%% Eccentricity, e 
e = (r_2 - r_1)/(r_1 * cosd(theta_1) - r_2 * cosd(theta_2));
fprintf('e = %.6f\n', e);

%% Perigee altitude, h_a
r_p = r_1 * (1 + e * cosd(theta_1))/(1 + e);
fprintf('r_p = %.4f km\n', r_p);
h_p = r_p - R_0;
fprintf('h_p = %.4f km\n', h_p);

%% Semi-major axis, a
a = r_p / (1 - e);
fprintf('a = %.4f km\n', a);