%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          SYNODIC PERIOD OF A RELATIVE TO B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [T] = week9_synodic_period(a_A, a_B, mu_Sun)
    fprintf('\nSYNODIC PERIOD:')
    omegaA = sqrt(mu_Sun / a_A.^3);
    fprintf('ω_A = %.15f rad/s\n', omegaA);
    omegaB = sqrt(mu_Sun / a_B.^3);
    fprintf('ω_B = %.15f rad/s\n', omegaB);
    T = (2 * pi) / abs(omegaA - omegaB);
    fprintf('Synodic Period, T = %.4f s = %.4f min = %.4f hr = %.4f days = %.4f years\n', T, T / 60, T / 60 / 60, T / 60 / 60 / 24, T / 60 / 60 / 24 / 365.25);
end