%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              INTERPLANETARY TRANSFER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function week9_interplanetary_transfer_circ(a_home, r_home, mu_home, a_target, r_target, mu_target, mu_centre, phi_initial)
    fprintf('\nINTERPLANETARY TRANSFER (CIRC):');
    a_transfer = (a_home + a_target) / 2;
    fprintf('a_transfer = %.4f km\n', a_transfer);

    %% a
    V_infty_home = abs(sqrt((2 * mu_centre)/a_home - mu_centre/a_transfer) - sqrt((2 * mu_centre)/a_home - mu_centre/a_home));
    fprintf('V_infty_home = %.4f km/s\n', V_infty_home);
    
    %% b
    V_infty_target = abs(sqrt((2 * mu_centre)/a_target - mu_centre/a_target) - sqrt((2 * mu_centre)/a_target - mu_centre/a_transfer));
    fprintf('V_infty_target = %.4f km/s\n', V_infty_target);

    %% c
    deltaV_boost = abs(sqrt((2 * mu_home)/r_home + V_infty_home.^2) - sqrt(mu_home / r_home));
    fprintf('deltaV_boost = %.4f km/s\n', deltaV_boost);

    %% d
    deltaV_retro = abs(sqrt(mu_target / r_target) - sqrt((2 * mu_target)/r_target + V_infty_target.^2));
    fprintf('deltaV_retro = %.4f km/s\n', deltaV_retro);

    %% e
    sumDeltaV = deltaV_boost + deltaV_retro;
    fprintf('sumDeltaV = %.4f km/s\n', sumDeltaV);

    %% f
    TOF = pi * sqrt(a_transfer.^3/mu_centre);
    fprintf('TOF = %.4f s = %.4f min = %.4f hr = %.4f days = %.4f months = %.4f years\n', TOF, TOF / 60, TOF / 60 / 60, TOF / 60 / 60 / 24, TOF / 60 / 60 / 24 / 30.44, TOF / 60 / 60 / 24 / 365.25);

    %% g
    % Angular velocity
    omega_home = sqrt(mu_centre / a_home.^3);
    fprintf('-> ω_home = %.15f rad/s\n', omega_home);
    omega_target = sqrt(mu_centre / a_target.^3);
    fprintf('-> ω_target = %.15f rad/s\n', omega_target);

    % Lead angle
    alpha_lead = omega_target * TOF;
    fprintf('-> α_lead = %.4f rad = %.4f°\n', alpha_lead, rad2deg(alpha_lead));

    % Phase angle
    phi_final = pi - alpha_lead;
    fprintf('-> Φ_final = %.4f rad = %.4f°\n', phi_final, rad2deg(phi_final));

    % Time wait
    T_wait = (phi_initial - phi_final) / (omega_home - omega_target);
    fprintf('T_wait = %.4f s = %.4f min = %.4f hr = %.4f days = %.4f months = %.4f years\n', T_wait, T_wait / 60, T_wait / 60 / 60, T_wait / 60 / 60 / 24, T_wait / 60 / 60 / 24 / 30.44, T_wait / 60 / 60 / 24 / 365.25);
end