% Input (Assumed UT, What should I code if it changes?)
day = 10;
month = 09;
year = 2022;
hour = 4;
minute = 30;
second = 00;

eastLongitude = 151.2093; % degrees

% [STEP 1] Julian Day (Date Component)
J_0 = 367 * year - fix(7 * (year + fix((month + 9)/12))/4) + fix((275 * month)/9) + day + 1721013.5;

% [STEP 2] T_0
T_0 = (J_0 - 2451545)/36525;

% 0-to-360 Range Function
function angle = rangeAdjust(angle)
    while angle > 360
        angle = angle - 360;
    end
end

% [STEP 3] Greenwich sidereal time at 0h UT (theta_G_0)
theta_G_0 = 100.4606184 + 36000.77004 * T_0 + 0.000387933 * T_0.^2 - 2.583 * 10.^-8 * T_0.^3;
theta_G_0 = rangeAdjust(theta_G_0);

% [STEP 4] Greenwich sidereal time at any other UT (theta_G)
UT = hour + (minute/60) + (second/60.^2);
theta_G = theta_G_0 + 360.98564724 * (UT/24);
theta_G = rangeAdjust(theta_G);

% Local sidereal time (theta)
theta = theta_G + eastLongitude;

% Output
fprintf('Local sidereal time = %.4f degrees\n', theta);