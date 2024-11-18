%% MAKE IT WORK FOR QUESTION 6
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              LAUNCH WINDOWS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 9.05; % [Input]
L_0 = 9.05; % [Input]

[beta_AN, beta_DN] = launch_windows(i, L_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = 398600; % [Input]
h = 500; % [Input]
R_launch = 6378.14; % [Input]
phi = 0; % [Input] (Flight path angle (circular))
v_losses = 0; % [Input] (km/s)
beta = beta_DN; % [Input] (Launch is planned to be near the descending node.)
R_burnout = R_launch + h;
a = R_burnout; % [Input] additional calcs

design_velocity(mu, R_burnout, R_launch, phi, v_losses, beta, L_0, a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              REQUIRED FUEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m_f = 850; % kg
deltav = 3.923 * 10.^3; % m/s (Found from Hohmann transfer questionj)
I_sp = 290; % seconds
g_0 = 9.8; % Acceleration due to gravity (m / s^2)

[m_p] = required_fuel(m_f, deltav, I_sp, g_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               SPECIFIC IMPULSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I_sp = 300; % seconds
g_0 = 9.8; % Acceleration due to gravity (m / s^2)
R = 25; % Mass ratio
deltav = NaN; % m/s

specific_impulse(I_sp, g_0, R, deltav);