%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  LAUNCH WINDOWS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Function
function [beta_AN, beta_DN] = launch_windows(i, L_0)
    fprintf('LAUNCH WINDOWS:\n');

    %% Launch Window Availability (in One Day)
    if (i > L_0)
        fprintf('Launch windows available: 2\n');
    elseif (i == L_0)
        fprintf('Launch windows available: 1\n');
    elseif (i < L_0)
        fprintf('Launch windows available: 0\n');
    end

    %% Launch Azimuths (Deg)
    sin_beta = cosd(i) / cosd(L_0); % deg
    fprintf('sin_beta = %.4f\n', sin_beta);
    beta = asind(cosd(i)/cosd(L_0));
    fprintf('beta = %.4f°\n', beta);
    beta_AN = beta; % deg
    fprintf('β_AN (before correction) = %.4f°\n', beta_AN);
    beta_AN = angleCorrectionFn(beta_AN);
    fprintf('β_AN (after correction) = %.4f°\n', beta_AN);
    beta_DN = 180 - beta; % deg
    fprintf('β_DN (before correction) = %.4f°\n', beta_DN);
    beta_DN = angleCorrectionFn(beta_DN);
    fprintf('β_DN (after correction) = %.4f°\n', beta_DN);

    % It will in appear in the MATLAB App so mack sure that the MATLAB App is open
    % img = imread(fullfile('launch_azimuth.gif'));
    % imshow(img);
end

%% Functions
function correctedAngle = angleCorrectionFn(angle)
    while angle > 360
        angle = angle - 360;
    end
    while angle < 0
        angle = angle + 360;
    end
    correctedAngle = angle;
end