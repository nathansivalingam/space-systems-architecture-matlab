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
% UNCOMMENT TO VIEW ECCENTRICITY VECTOR
% fprintf('Eccentricity Vector, e_bold: %.4f I %.4f J %.4f K\n', eccentricityVector(1), eccentricityVector(2), eccentricityVector(3));
eccentricityMagnitude = sqrt(sum(eccentricityVector.^2));

% Finding inclincation, i
angularMomentumVector = cross(positionVector, velocityVector);
% UNCOMMENT TO VIEW ANGULAR MOMENTUM VECTOR
% fprintf('Angular Momentum Vector, h_bold: %.4f I %.4f J %.4f K\n', angularMomentumVector);
angularMomentumMagnitude = sqrt(sum(angularMomentumVector.^2)); % h
% UNCOMMENT TO VIEW ANGULAR MOMENTUM MAGNITUDE
% fprintf('Angular Momentum Magnitude, h: %.4f\n', angularMomentumMagnitude);
inclination = rad2deg(acos(angularMomentumVector(3)/angularMomentumMagnitude)); % deg

% Finding RAAN, bigOmega
kVector = [0, 0, 1];
NVector = cross(kVector, angularMomentumVector);
% UNCOMMENT TO N VECTOR
% fprintf('N Vector, N_bold: %.4f I %.4f J %.4f K\n', NVector);
NMagnitude = sqrt(sum(NVector.^2));
% UNCOMMENT TO N MAGNITUDE
% fprintf('N Magnitude, N: %.4f\n', NMagnitude);

% RAAN Quadrant Check
RAAN = rad2deg(acos(NVector(1)/NMagnitude)); % deg
% disp(RAAN);
if NVector(2) < 0
    RAAN = 360 - RAAN;
end

% Finding argument of perigee, omega
argumentOfPerigee = rad2deg(acos((dot(NVector, eccentricityVector))/(NMagnitude*eccentricityMagnitude))); % deg
% disp(argumentOfPerigee);
if eccentricityVector(3) < 0
    argumentOfPerigee = 360 - argumentOfPerigee;
end

% Finding true anomaly, theta
trueAnomaly = rad2deg(acos((dot(eccentricityVector, positionVector))/(eccentricityMagnitude * positionMagnitude))); % deg
% disp(trueAnomaly);
if dot(positionVector, velocityVector) < 0
    trueAnomaly = 360 - trueAnomaly;
end

% Bound status (Ignore if at perigee or apogee)
boundStatus = 'outbound (perigee to apogee)';
if dot(positionVector, velocityVector) < 0
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