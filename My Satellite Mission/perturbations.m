% ===============================================================================
% Classic Orbital Elements [MUST POPULATE WITH CORRECT DATA]
% ===============================================================================
a = 6838.14;
i = 98; % deg
e = 0.0001; %

% ===============================================================================
% Perturbations
% ===============================================================================
%% The Oblateness of the Earth
% Regression of nodes
Omega_dot = -2.06474 * 10.^14 * ( cosd(i) / (a.^(3.5) * (1 - e.^2).^2) );
fprintf('Omega_dot = %.4f\n', Omega_dot);

% Rotation of apsides
omega_dot = 1.0324 * 10.^14 * ( (4 - 5 * (sind(i)).^2) / (a.^(3.5) * (1 - e.^2).^2) );
fprintf('omega_dot = %.4f\n', omega_dot);

%% Drag
rho = 1.2 * 10.^-11; % kg/m^3
V = sqrt((2*mu)/a - mu/a); % m / s
C_d = 2.5;
A = 2.3 * 3.4; % m^2
D = (1/2) * rho * V.^2 * C_d * A;

%% Attraction of the sun

%% Solar radiation pressure