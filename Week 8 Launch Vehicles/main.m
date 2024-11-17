clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              LAUNCH WINDOWS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 9.05; % [Input]
L_0 = 9.05; % [Input]

[alpha, gamma, beta_AN, beta_DN] = launch_windows(i, L_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = 398600; % [Input]
h = 500; % [Input]
R_launch = 6378.14; % [Input]
phi = 0; % [Input] (Flight path angle (circular))
v_losses = 1; % [Input] (km/s) 

R_burnout = R_launch + h;
design_velocity(mu, R_burnout, R_launch, phi, v_losses, beta_DN, L_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              REQUIRED FUEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%