clc
% This program is just to Solve Kepler's Equation using the Newton's Method
% Input
eccentricity = 0.72; % [e]
meanAnomaly = deg2rad(4); % [M] rad
chosenTolerance = 10.^-8;

% Kepler's Equation
% Step 1
if meanAnomaly <= pi
    eccentricAnomaly = meanAnomaly + (eccentricity/2); % Radians
elseif meanAnomaly > pi
    eccentricAnomaly = meanAnomaly - (eccentricity/2); % Radians
end

i = 0;
while true
    % Step 2
    eccentricAnomalyF = eccentricAnomaly - eccentricity * sin(eccentricAnomaly) - meanAnomaly;
    eccentricAnomalyFDash = 1 - eccentricity * cos(eccentricAnomaly);

    % Step 3
    eta = eccentricAnomalyF / eccentricAnomalyFDash;

    % Step 4
    if abs(eta) > chosenTolerance %#ok<BDSCI>
        eccentricAnomaly = eccentricAnomaly - eta;
        fprintf('Iteration %d: deltaE = %.17f\n', i, eta);
    elseif abs(eta) < chosenTolerance %#ok<BDSCI>
        fprintf('Iteration %d: deltaE = %.17f\n', i, eta);
        break
    end
    i = i + 1;
end

% Final Output
fprintf('E = %.5f rad = %.4f°\n', eccentricAnomaly, rad2deg(eccentricAnomaly));
