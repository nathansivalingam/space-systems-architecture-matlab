%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              LAUNCH WINDOWS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 28.5;
L_0 = 28.5;
[alpha, gamma, beta_AN, beta_DN] = launch_windows(i, L_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = 398600; % Earth
h = 400;
R_launch = 6378.14;
R_burnout = R_launch + h;
a = R_burnout;
phi = 0; % Circular orbit (Flight path angle)
v_losses = 1.5; % km/s
design_velocity(mu, R_burnout, R_launch, phi, v_losses, a, beta_DN);
