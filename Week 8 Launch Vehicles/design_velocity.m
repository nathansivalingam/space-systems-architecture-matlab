%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                DESIGN VELOCITY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Function
function output = design_velocity(mu, R_burnout, R_launch, phi, v_losses, a, beta_DN)
    % v_loss
    v_loss = sqrt( (2 * mu * (R_burnout - R_launch) ) / (R_burnout * R_launch) );
    fprintf('v_loss = %.4f km/s\n', v_loss);

    % v_burnout
    v_burnout = sqrt( ((2 * mu) / R_burnout) - (mu / a) );
    fprintf('v_burnout = %.4f km/s\n', v_burnout);

    % deltav_burnout, south
    deltav_burnout_south = -v_burnout * cosd(phi) * cosd(beta_DN);
    fprintf('deltav_burnout_south = %.4f km/s\n', deltav_burnout_south);

    % deltav_burnout, east

    % deltav_burnout, zenith

    % v_launch_site

    % deltav_needed

    % deltav_design
end