%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        TIME OF FLIGHT (HOHMANNS TRANSFER)
%                   ANGLE PHASING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [TOF] = week9_TOF_hohmann_transfer_and_angle_phase(a_home, a_target, mu_Sun, phi_initial)
    fprintf('\nPHASING OF PLANETS: ')
    a_transfer = (a_home + a_target) / 2;
    fprintf('a_transfer = %.4f km\n', a_transfer);
    
    % Time of Flight
    TOF = pi * sqrt(a_transfer.^3/mu_Sun);
    fprintf('TOF = %.4f s = %.4f min = %.4f hr = %.4f days = %.4f months = %.4f years\n', TOF, TOF / 60, TOF / 60 / 60, TOF / 60 / 60 / 24, TOF / 60 / 60 / 24 / 30.44, TOF / 60 / 60 / 24 / 365.25);

    % Angular velocity
    omega_home = sqrt(mu_Sun / a_home.^3);
    fprintf('ω_home = %.15f rad/s\n', omega_home);
    omega_target = sqrt(mu_Sun / a_target.^3);
    fprintf('ω_target = %.15f rad/s\n', omega_target);

    % Lead angle
    alpha_lead = omega_target * TOF;
    fprintf('α_lead = %.4f rad = %.4f°\n', alpha_lead, rad2deg(alpha_lead));

    % Phase angle
    phi_final = pi - alpha_lead;
    fprintf('Φ_final = %.4f rad = %.4f°\n', phi_final, rad2deg(phi_final));

    % Time wait
    T_wait = (deg2rad(phi_initial) - phi_final) / (omega_home - omega_target);
    fprintf('T_wait = %.4f s = %.4f min = %.4f hr = %.4f days = %.4f months = %.4f years\n', T_wait, T_wait / 60, T_wait / 60 / 60, T_wait / 60 / 60 / 24, T_wait / 60 / 60 / 24 / 30.44, T_wait / 60 / 60 / 24 / 365.25);
end