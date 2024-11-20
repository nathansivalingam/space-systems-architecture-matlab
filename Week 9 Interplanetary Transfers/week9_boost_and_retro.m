%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            ΔV_boost and ΔV_retro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Function
function week9_boost_and_retro(a_home, a_target, r_park_home, r_park_target, mu_home, mu_target, mu_sun)
    fprintf('\nΔV_boost and ΔV_retro:');
    % deltav boost
    a_sun = (a_home + a_target)/2;
    V_T_E = sqrt((2 * mu_sun)/r_park_home - mu_sun/a_sun);
    fprintf('V_T_E = %.4f km/s\n', V_T_E);

    V_E = sqrt(mu_sun/r_park_home);
    fprintf('V_E = %.4f km/s\n', V_E);

    % deltav retro

end
