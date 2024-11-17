clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              LAUNCH WINDOWS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 41; % [Input]
L_0 = 28.5; % [Input]

[beta_AN, beta_DN] = launch_windows(i, L_0);
% gamma = 44.7;
% beta_DN = 135.83;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = 398600; % [Input]
h = 400; % [Input]
R_launch = 6378.14; % [Input]
phi = 0; % [Input] (Flight path angle (circular))
v_losses = 1.5; % [Input] (km/s)

R_burnout = R_launch + h;
design_velocity(mu, R_burnout, R_launch, phi, v_losses, beta_DN, L_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              REQUIRED FUEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%