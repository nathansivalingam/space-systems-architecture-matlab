clc
%
r_a = 42000 + 6378.14; % km
r_p = 250 + 6378.14; % km
mu = 398600; % km
altitudePoint = 1000; % km (To evaluate true anomaly at a specific point of the orbit)
altitudeRadius = 6378.14 + altitudePoint;

%% eccentricity, e
e = (r_a - r_p)/(r_a + r_p);
fprintf('e = %.6f\n', e);

%% semi major axis, a
a = (r_a + r_p) / 2;
fprintf('a = %.4f km\n', a);

%% period, T
T = 2 * pi * sqrt(a.^3 / mu);
fprintf('T = %.4f s = %.4f min = %.4f hr\n', T, T / 60, T / 60 / 60);

%% specific energy of the orbit, varepsilon
varepsilon = - mu / (2 * a);
fprintf('ε = %.4f km^2/s^2\n', varepsilon);

%% true anomaly (r = altitudeRadius)
cos_theta = ((r_p * (1 + e)) / (altitudeRadius * e)) - 1 / e;
theta = acosd(cos_theta);
fprintf('θ = %.4f°\n', theta);

%% tangential velocity (r = altitudeRadius)
H = sqrt(mu * a * (1 - e.^2));
fprintf('H = %.4f km^2/s^2\n', H);

v_r = mu / H * e * sind(theta);
fprintf('v_r = %.4f km/s\n', v_r);

%% perpendicular velocity (r = altitudeRadius)
v_perp = H / altitudeRadius;
fprintf('v_⊥ = %.4f km/s\n', v_perp);

%% speed at perigee
V_p = sqrt((2 * mu) / r_p - mu / a);
fprintf('V_p = %.4f km/s\n', V_p);

%% speed at apogee
V_a = sqrt((2 * mu) / r_a - mu / a);
fprintf('V_a = %.4f km/s\n', V_a);