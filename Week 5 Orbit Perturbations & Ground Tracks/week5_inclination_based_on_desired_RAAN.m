clc
% !IMPORTANT, Omega_dot CALCULATION ASSUMES THE PLANET IS EARTH
e = 0;
a = 7078; % km

degrees = 360;
days = 365;

%% Desired Omega_dot
desired_Omega_dot = degrees / days;
fprintf('Desired Omega_dot = %.4f °/day\n', desired_Omega_dot);

%% Inclination, i
i = acosd(desired_Omega_dot/(-2.06474 * 10.^14 * a.^(-7/2)));
fprintf('i = %.4f°\n', i);
