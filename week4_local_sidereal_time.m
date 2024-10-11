% Input (Assumed UT, What should I code if it changes?)
day = 10;
month = 09;
year = 2022;
hour = 4;
minute = 30;
second = 00;

eastLongitude = 151.2093; % degrees

% Julian Day (Date Component)
J_0 = 367 * year - fix(7 * (year + fix((month + 9)/12))/4) + fix((275 * month)/9) + day + 1721013.5;

% T_0
T_0 = (J_0 - 2451545)/36525;

% Greenwich sidereal time at 0h UT (theta_G_0)
theta_G_0 = 100.4606184 + 36000.77004 * T_0 + 0.000387933 * T_0.^2 - 2.583 * 10.^-8 * T_0.^3;

while theta_G_0 > 360
    theta_G_0 = theta_G_0 - 360;
end

% Greenwich sidereal time at any other UT (theta_G)
UT = hour + (minute/60) + (second/60.^2);
theta_G = theta_G_0 + 360.98564724 * (UT/24);

while theta_G > 360
    theta_G = theta_G - 360;
end

% Local sidereal time (theta)
theta = theta_G + eastLongitude;

% Output
fprintf('Local sidereal time = %.4f degrees\n', theta);