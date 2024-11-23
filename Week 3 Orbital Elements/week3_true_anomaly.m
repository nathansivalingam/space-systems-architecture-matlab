clc
% Input
perigeeRadius = 9600; % km
apogeeRadius = 21000; % km
perigeeAngle = 0; % deg
apogeeAngle = 0; % deg
trueAnomaly = 120; % deg

% Body specific constants
mu = 398600;

% a)
% Eccentricity, e
eccentricity = (apogeeRadius - perigeeRadius)/(apogeeRadius + perigeeRadius);
fprintf('e = %.4f\n', eccentricity);

% Angular momentum, h
angularMomentum = (perigeeRadius * (mu) * (1 + eccentricity * cosd(perigeeAngle))).^(1/2); % km^2/s
fprintf('h = %.4f km^2/s\n', angularMomentum);

% Orbital period, T
semiMajorAxis = (apogeeRadius + perigeeRadius) / 2;
orbitalPeriod = 2 * pi * sqrt(semiMajorAxis.^3/mu); % seconds
fprintf('a = %.4f km\n', semiMajorAxis);
fprintf('T = %.4f s\n', orbitalPeriod);

% Eccentric anomaly
eccentricAnomaly = 2 * atan(sqrt((1 - eccentricity)/(1 + eccentricity)) * tand(trueAnomaly/2)); % rad
fprintf('E = %.4f rad\n', eccentricAnomaly);

% Mean anomaly
meanAnomaly = eccentricAnomaly - eccentricity * sin(eccentricAnomaly);
fprintf('M = %.4f rad\n', meanAnomaly);
time = meanAnomaly/(2 * pi) * orbitalPeriod; % s
fprintf('Time = %.4f s\n\n', time);

% b)
% Mean anomaly at time = 3 hours
time = 3 * 60 * 60;
if time > (0.5 * orbitalPeriod)
    meanAnomaly = 2 * pi * (time/orbitalPeriod); % rad
end
fprintf('(b) -> M = %.4f rad\n', meanAnomaly);

% plug the values into the kepler equation script, you should get E = 3.4166
eccentricAnomaly = week3_kepler_equation(eccentricity, meanAnomaly, 10.^-8); % rad

% Find the true anomaly
trueAnomaly = rad2deg(2 * atan(sqrt((1 + eccentricity)/(1 - eccentricity)) * tan(eccentricAnomaly/2)));
if trueAnomaly < 0
    trueAnomaly = 360 + trueAnomaly;
end
fprintf('True anomaly  = %.4f°\n', trueAnomaly);

%% Kepler Equation Method
function [eccentricAnomaly] = week3_kepler_equation(eccentricity, meanAnomaly, chosenTolerance)
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
        if abs(eta) > chosenTolerance
            eccentricAnomaly = eccentricAnomaly - eta;
            fprintf('Iteration %d: deltaE = %.17f\n', i, eta);
        elseif abs(eta) < chosenTolerance
            fprintf('Iteration %d: deltaE = %.17f\n', i, eta);
            break
        end
        i = i + 1;
    end

    % Final Output
    fprintf('E = %.5f rad = %.4f°\n', eccentricAnomaly, rad2deg(eccentricAnomaly));
end