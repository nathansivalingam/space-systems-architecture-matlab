clc
% Input (Assumed UT, What should I code if it changes?)
day = 10;
mon = 09;
year = 2022;
hr = 04;
min = 30;
sec = 00;

eastLongitude = 151.2093; % degrees
westLongitude = 0; % degrees

% [STEP 1] Julian Day (Date Component)
J_0 = 367 * year - fix(7 * (year + fix((mon + 9)/12))/4) + fix((275 * mon)/9) + day + 1721013.5;
fprintf('J_0 = %.4f days\n', J_0);

% [STEP 2] T_0
T_0 = (J_0 - 2451545)/36525;
fprintf('T_0 = %.4f\n', T_0);

% 0-to-360 Range Function
function angle = rangeAdjust(angle)
    while angle > 360
        angle = angle - 360;
    end
end

% [STEP 3] Greenwich sidereal time at 0h UT (theta_G_0)
theta_G_0 = 100.4606184 + 36000.77004 * T_0 + 0.000387933 * T_0.^2 - 2.583 * 10.^-8 * T_0.^3;
fprintf('theta_G_0 (before range adjust) = %.4f°\n', theta_G_0);
theta_G_0 = rangeAdjust(theta_G_0);
fprintf('theta_G_0 (after range adjust) = %.4f°\n', theta_G_0);

% [STEP 4] Greenwich sidereal time at any other UT (theta_G)
UT = hr + (min/60) + (sec/60.^2);
fprintf('UT = %.4f\n', UT);
theta_G = theta_G_0 + 360.98564724 * (UT/24);
fprintf('theta_G (before range adjust) = %.4f°\n', theta_G);
theta_G = rangeAdjust(theta_G);
fprintf('theta_G (after range adjust) = %.4f°\n', theta_G);

% Local sidereal time (theta)
theta = theta_G + eastLongitude - westLongitude;

% Output
fprintf('Local sidereal time = %.4f°\n', theta);