%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REQUIRED VELOCITY TO GO FROM PARKING ORBIT TO 
% EARTH'S BOUNDARY SOI SUCH THAT IT ARRIVES THERE
% WITH ZERO VELOCITY RELATIVE TO EARTH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function week9_parking_orbit_to_R_SOI(a_park_e, mu)
    fprintf('\nPARKING ORBIT -> R_SOI QUESTION 9:')
    deltav_boost = (sqrt(2) - 1) * sqrt(mu / a_park_e);
    fprintf('ΔV_boost = %.4f km/s\n', deltav_boost);

    % img2 = imread(fullfile('workshopQuestion9.9.png'));
    % imshow(img2);
end
