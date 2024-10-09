% Position and Velocity Vector Input ([xI, yJ, zK] format) [km]
positionVector = [-1106, 445.2, 6886];
velocityVector = [-1.897, 7.275, -0.7853];
mu = 398600; % earth specific

% Find all six COEs (units: km for distance and degrees for angles)
% Find the magnitude of r and v
positionMagnitude = sqrt(sum(positionVector.^2));
velocityMagnitude = sqrt(sum(velocityVector.^2));

% Find the semi-major axis, a
varEpsilon = (velocityMagnitude.^2/2) - (mu/positionMagnitude); % km^2/s^2
semiMajorAxis = (-mu/(2*varEpsilon)); % km

% Find the eccentricity vector, e, and it's magnitude
eccentricityVector = [];
for i = 1:length(positionVector)
    eccentricityVector(i) = (1/mu) * ((velocityMagnitude.^2 - (mu/positionMagnitude)) * positionVector(i) - (dot(positionVector, velocityVector) * velocityVector(i))); %#ok<SAGROW>
end
eccentricityMagnitude = sqrt(sum(eccentricityVector.^2));

% Finding inclincation, i
angularMomentumVector = cross(positionVector, velocityVector);
angularMomentumMagnitude = sqrt(sum(angularMomentumVector.^2)); % h
inclination = rad2deg(acos(angularMomentumVector(3)/angularMomentumMagnitude)); % deg

% Finding RAAN, bigOmega
kVector = [0, 0, 1];
NVector = cross(kVector, angularMomentumVector);
NMagnitude = sqrt(sum(NVector.^2));

RAAN = rad2deg(acos(NVector(1)/NMagnitude)); % deg
if NVector(2) < 0
    RAAN = 360 - RAAN;
end

% Finding argument of perigee, omega
argumentOfPerigee = rad2deg(acos((dot(NVector, eccentricityVector))/(NMagnitude*eccentricityMagnitude))); % deg
if eccentricityVector(3) < 0
    argumentOfPerigee = 360 - argumentOfPerigee;
end

% Finding true anomaly, theta
trueAnomaly = rad2deg(acos((dot(eccentricityVector, positionVector))/(eccentricityMagnitude * positionMagnitude))); % deg
if dot(positionVector, velocityVector) < 0
    trueAnomaly = 360 - trueAnomaly;
end

% Bound status
boundStatus = 'outbound (perigee to apogee)';
if cross(eccentricityVector, positionVector) < 0
    boundStatus = 'inbound (apogee to perigee)';
end

% Output
fprintf('Semi-major axis,                     a = %.4f km\n', semiMajorAxis);
fprintf('Eccentricity,                        e = %.4f\n', eccentricityMagnitude);
fprintf('Inclination,                         i = %.4f°\n', inclination);
fprintf('Right ascension of ascending node,   Ω = %.4f°\n', RAAN);
fprintf('Argument of perigee,                 ω = %.4f°\n', argumentOfPerigee);
fprintf('True anomaly,                        θ = %.4f°\n', trueAnomaly);
fprintf('Bounding status = %s\n', boundStatus);