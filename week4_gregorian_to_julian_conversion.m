% Input
year = 2022;
month = 10;
day = 01;
hour = 02;
minute = 45;
second = 30;

% Julian day number formula
J_0 = 367 * year - fix(7 * (year + fix((month + 9)/12))/4) + fix((275 * month)/9) + day + 1721013.5;

% JD (What is it?)
JD = J_0 + ((((second/60) + month)/60) + hour)/24;

fprintf('Julian day number, J_0 = %.1f days\n', J_0);
fprintf('JD                     = %.1f days\n', JD);
