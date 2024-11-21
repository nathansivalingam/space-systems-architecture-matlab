clc
%
mu = 398600; % km
r = 25000; % km

% velocity of the orbiting object (assumed circular orbit)
v = sqrt(mu / r);
fprintf('v = %.4f km/s\n', v);

% escape velocity
v_esc = sqrt(2 * mu / r);
fprintf('v_esc = %.4f km/s\n', v_esc);

% additional velocity
deltav = v_esc - v;
fprintf('Δv = %.4f km/s\n', deltav);