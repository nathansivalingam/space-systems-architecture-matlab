clc
% Position and Velocity Vector Input ([xI, yJ, zK] format) [km]
positionVector = [-1106, 445.2, 6886];
velocityVector = [-1.897, 7.275, -0.7853];
mu = 398600; % earth specific

% Find all six COEs (units: km for distance and degrees for angles)
%% Find the magnitude of r and v
positionMagnitude = sqrt(sum(positionVector.^2));
velocityMagnitude = sqrt(sum(velocityVector.^2));
fprintf('Position Magnitude, r = %.4f km\n', positionMagnitude);
fprintf('Velocity Magnitude, v = %.4f km/s\n', velocityMagnitude);

%% Find the semi-major axis, a
varEpsilon = (velocityMagnitude.^2/2) - (mu/positionMagnitude); % km^2/s^2
semiMajorAxis = (-mu/(2*varEpsilon)); % km
fprintf('ε = %.4f km/s\n', varEpsilon);
fprintf('a = %.4f km\n\n', semiMajorAxis);

%% Find the eccentricity vector, e, and it's magnitude
eccentricityVector = [];
for i = 1:length(positionVector)
    eccentricityVector(i) = (1/mu) * ((velocityMagnitude.^2 - (mu/positionMagnitude)) * positionVector(i) - (dot(positionVector, velocityVector) * velocityVector(i))); %#ok<SAGROW>
end
eccentricityMagnitude = sqrt(sum(eccentricityVector.^2));
fprintf('Eccentricity Vector, e_bold: %.4f I %.4f J %.4f K\n', eccentricityVector(1), eccentricityVector(2), eccentricityVector(3));
fprintf('e = %.4f\n\n', eccentricityMagnitude);

%% Finding inclincation, i
angularMomentumVector = cross(positionVector, velocityVector);
angularMomentumMagnitude = sqrt(sum(angularMomentumVector.^2)); % h
inclination = acosd(angularMomentumVector(3)/angularMomentumMagnitude); % deg
fprintf('Angular Momentum Vector, h_bold: %.4f I %.4f J %.4f K\n', angularMomentumVector);
fprintf('h = %.4f km^2/s\n', angularMomentumMagnitude);
fprintf('i = %.4f°\n\n', inclination);

%% Finding RAAN, bigOmega
kVector = [0, 0, 1];
NVector = cross(kVector, angularMomentumVector);
NMagnitude = sqrt(sum(NVector.^2));
fprintf('N Vector, N_bold: %.4f I %.4f J %.4f K\n', NVector);
fprintf('N = %.4f\n', NMagnitude);

% RAAN Quadrant Check
RAAN = rad2deg(acos(NVector(1)/NMagnitude)); % deg
fprintf('RAAN (Before Quadrant Check): %.4f\n', RAAN);
if NVector(2) < 0
    RAAN = 360 - RAAN;
end
fprintf('RAAN (After Quadrant Check): %.4f\n\n', RAAN);

%% Finding argument of perigee, omega
argumentOfPerigee = rad2deg(acos((dot(NVector, eccentricityVector))/(NMagnitude*eccentricityMagnitude))); % deg
fprintf('ω (Before Quadrant Check): %.4f\n', argumentOfPerigee);
if eccentricityVector(3) < 0
    argumentOfPerigee = 360 - argumentOfPerigee;
end
fprintf('ω (After Quadrant Check): %.4f\n\n', argumentOfPerigee);

%% Finding true anomaly, theta
trueAnomaly = rad2deg(acos((dot(eccentricityVector, positionVector))/(eccentricityMagnitude * positionMagnitude))); % deg
fprintf('θ (Before Quadrant Check): %.4f°\n', trueAnomaly);
fprintf('r ∙ v (dot product) = %.4f\n', dot(positionVector, velocityVector));
if dot(positionVector, velocityVector) < 0
    trueAnomaly = 360 - trueAnomaly;
end
fprintf('θ (After Quadrant Check): %.4f°\n\n', trueAnomaly);

%% Bound status (Ignore if at perigee or apogee)
boundStatus = 'outbound (perigee to apogee)';
if dot(positionVector, velocityVector) < 0
    boundStatus = 'inbound (apogee to perigee)';
end

% Output
fprintf('Bounding status = %s\n', boundStatus);