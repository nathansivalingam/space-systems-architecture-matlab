% Input (Assumed UT, What should I code if it changes?)
day = 10;
month = 09;
year = 2022;
hour = 4;
minute = 30;
second = 00;

% Julian Day (Date Component)
J_0 = 367 * year - floor(7 * (year + floor((month + 9)/12))/4) + floor((275 * month)/9) + day + 1721013.5;

% Julian Day (Factoring in the Time Component)
JD = J_0 + ((((second/60) + month)/60) + hour)/24;

% Output
fprintf('Julian Day (Date Component), J_0 = %.1f days\n', J_0);
fprintf('Julian Day Number,            JD = %.1f days\n', JD);
