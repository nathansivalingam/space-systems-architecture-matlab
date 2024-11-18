%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Function
function design_velocity(mu, R_burnout, R_launch, phi, v_losses, beta, L_0, a)
    fprintf('\nDESIGN VELOCITY:');

    % v_gravity_loss
    v_gravity_loss = sqrt( (2 * mu * (R_burnout - R_launch) ) / (R_burnout * R_launch) );
    fprintf('v_loss = %.4f km/s\n', v_gravity_loss);

    % v_burnout
    v_burnout = sqrt( ((2 * mu) / R_burnout) - (mu / a) );
    fprintf('v_burnout = %.4f km/s\n', v_burnout);

    % deltav_burnout, south
    deltav_burnout_south = -v_burnout * cosd(phi) * cosd(beta);
    fprintf('deltav_burnout_south = %.4f km/s\n', deltav_burnout_south);

    % deltav_burnout, east
    deltav_burnout_east = v_burnout * cosd(phi) * sind(beta);
    fprintf('deltav_burnout_east = %.4f km/s\n', deltav_burnout_east);

    % deltav_burnout, zenith
    deltav_burnout_zenith = v_burnout * sind(phi);
    fprintf('deltav_burnout_zenith = %.4f km/s\n', deltav_burnout_zenith);

    % v_launch_site (earth, may need to change later)
    v_launch_site = 0.4651 * cosd(L_0);
    fprintf('v_launch_site = %.4f km/s\n', v_launch_site);

    % deltav_needed
    i = deltav_burnout_south;
    j = deltav_burnout_east - v_launch_site;
    k = deltav_burnout_zenith + v_gravity_loss;
    deltav_needed = sqrt(i.^2 + j.^2 + k.^2);
    fprintf('deltav_needed = [%.4f, %.4f, %.4f] = %.4f km/s\n', i, j, k, deltav_needed);

    % deltav_design
    deltav_design = abs(deltav_needed) + v_losses;
    fprintf('deltav_design = %.4f km/s\n', deltav_design);
end