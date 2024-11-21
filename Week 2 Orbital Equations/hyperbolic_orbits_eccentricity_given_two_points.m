clc
%
r_1 = 10000; % km
theta_1 = 30; % deg

r_2 = 30000; % km
theta_2 = 105; % deg

%% Eccentricity, e 
e = (r_2 - r_1)/(r_1 * cosd(theta_1) - r_2 * cosd(theta_2));
fprintf('e = %.6f\n', e);
