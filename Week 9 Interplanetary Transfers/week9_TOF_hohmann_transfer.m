%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        TIME OF FLIGHT (HOHMANNS TRANSFER)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [TOF] = week9_TOF_hohmann_transfer(a_A, a_B, mu_Sun)
    fprintf('\nTIME OF FLIGHT (HOHMANN TRANSFER): ')
    a_t = (a_A + a_B) / 2;
    fprintf('a_t = %.4f km\n', a_t);
    TOF = pi * sqrt(a_t.^3/mu_Sun);
    fprintf('TOF = %.4f s = %.4f min = %.4f hr = %.4f days = %.4f months = %.4f years\n', TOF, TOF / 60, TOF / 60 / 60, TOF / 60 / 60 / 24, TOF / 60 / 60 / 24 / 30.44, TOF / 60 / 60 / 24 / 365.25);

    fprintf('\nPHASE ANGLE: ')
    omega_t = sqrt(mu_Sun / a_B.^3); % a must be for the target planet
    fprintf('ω_t = %.15f\n', omega_t);

    alpha_lead = omega_t * TOF;
    fprintf('α_lead = %.4f rad = %.4f°\n', alpha_lead, rad2deg(alpha_lead));

    phi_final = pi - alpha_lead;
    fprintf('Φ_final = %.4f rad = %.4f°\n', phi_final, rad2deg(phi_final));
end