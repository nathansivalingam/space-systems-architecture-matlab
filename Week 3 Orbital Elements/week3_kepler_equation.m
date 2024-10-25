% This program is just to Solve Kepler's Equation using the Newton's Method
% Input
eccentricity = 0.37255;
meanAnomaly = 3.6029; % rad (to go from deg to rad -> times 4 deg by Pi/180)
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
fprintf('E = %.4f rad = %.4f°\n', eccentricAnomaly, rad2deg(eccentricAnomaly));