%% MAKE IT WORK FOR QUESTION 6
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              LAUNCH WINDOWS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 55; % [Input]
L_0 = 34.6; % [Input]

[beta_AN, beta_DN] = launch_windows(i, L_0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = 398600; % [Input]
h = 500; % [Input]
R_launch = 6378.14; % [Input]
phi = 0; % [Input] (Flight path angle (circular))
v_losses = 0.8; % [Input] (km/s)
beta = beta_DN; % [Input] (Launch is planned to be near the descending node.)

R_burnout = R_launch + h;
a = R_burnout; % [Input] additional calcs

design_velocity(mu, R_burnout, R_launch, phi, v_losses, beta, L_0, a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              REQUIRED FUEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%