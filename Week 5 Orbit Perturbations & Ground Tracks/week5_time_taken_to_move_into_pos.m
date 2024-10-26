% Enter values
a = 7278; % km
e = 0.001;
i = 50; % deg
Omega = 90; % deg
omega = 45; % deg
theta = 0; % deg

% New RAAN position
OmegaAfter = 30; % deg

% Calculations
Omega_dot = -2.06474 * 10.^14 * a.^(-7/2) * cosd(i) * (1 - e.^2).^-2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (0 < i && i < 90)
    status = 'westword';
elseif (90 < i && i < 180)
    status = 'eastward';
elseif (i == 90)
    status = 'polar';
end

fprintf('Omega_dot = %.4f deg, %s\n', abs(Omega_dot), status);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

timeTaken = (Omega - OmegaAfter)/abs(Omega_dot);
fprintf('%.2f days\n', timeTaken);