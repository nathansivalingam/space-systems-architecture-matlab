% Position and Velocity Vector Input ([xI, yJ, zK] format)
positionVector = [8228, 389, 6888];
velocityVector = [-0.7000, 6.600, -0.6000];

% Find all six COEs (units: km for distance and degrees for angles)
positionMagnitude = sqrt(sum(positionVector.^2));

% Print the positionMagnitude without extra whitespace or newlines
fprintf('%.4f\n', positionMagnitude); % Adding \n for clarity in output
