clc
% Planetary Characteristics
mu = 398600; % [Input] (Change when the transfer orbit is between two planets, mu = mu_sun)
R_0 = 6378; % km [Input]

% Assumed circular orbit 
h_t = 350; % km
Phi_i = deg2rad(5.116); % rad
target_status = 'ahead'; % Is the target behind or ahead of the interceptor
r_t = R_0 + h_t; % km

% TOF
omega_t = sqrt(mu / r_t.^3);
fprintf('ω_t = %.8f rad\n', omega_t);

Phi_travel = Phi_i; %#ok<NASGU> % rad
if strcmp('behind', target_status)
    Phi_travel = 2*pi + Phi_i; %#ok<UNRCH>
elseif strcmp('ahead', target_status) %#ok<UNRCH>
    Phi_travel = 2*pi - Phi_i;
end
fprintf('Φ_travel = %.4f rad\n', Phi_travel);

TOF = Phi_travel / omega_t;
fprintf('TOF = %.4f seconds = %.4f minutes\n', TOF, TOF / 60);

% Semi-major axis of the phasing orbit
a_phasing = (mu * (Phi_travel / (2 * pi * omega_t)).^2).^(1/3);
fprintf('a_phasing = %.4f km\n', a_phasing);

% Total necessary Δv for the manoeuvre
V_i = sqrt(mu / r_t);
fprintf('V_i = %.4f km/s\n', V_i);
V_ph = sqrt(2 * mu / r_t - mu / a_phasing);
fprintf('V_ph = %.4f km/s\n', V_ph);
DeltaV = abs(V_ph - V_i);
fprintf('ΔV_1 = %.4f km/s\n', DeltaV);
DeltaV_total = DeltaV * 2; % Mutliply by 2 because we move in and out of the orbit
fprintf('ΔV_total = %.4f km/s = %.4f m/s\n', DeltaV_total, DeltaV_total * 10.^3);

% Add the final co-orbital rendezvous question later as part of revision