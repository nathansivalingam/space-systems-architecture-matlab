% Input
year = 2022;
month = 10;
day = 01;
hour = 02;
minute = 45;
second = 30;

% Julian Day (Date Component)
J_0 = 367 * year - fix(7 * (year + fix((month + 9)/12))/4) + fix((275 * month)/9) + day + 1721013.5;

% Julian Day (Factoring in the Time Component)
JD = J_0 + ((((second/60) + month)/60) + hour)/24;

% Output
fprintf('Julian Day Number, JD = %.1f days\n', JD);
