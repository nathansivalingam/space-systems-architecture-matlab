% Create a structure as a dictionary
twoLineElements = struct();

% Add key-value pairs
twoLineElements.inclination = 12.4651;
twoLineElements.RAAN = 23.8468;
twoLineElements.eccentricity = 0.011879;  % Fixing the eccentricity value format
twoLineElements.argumentOfPerigee = 39.7523;
twoLineElements.meanAnomaly = 150.0589;
twoLineElements.meanMotion = 0.98309523;

% Question specific constants
bodyRadius = 6371; % km (earth specific)
mu = 398600;

% Orbital period = inverse of mean motion
orbitalPeriod = inv(twoLineElements.meanMotion) * 86400; %#ok<MINV>

% Semi-major axis
semiMajorAxis = (mu/((2 * pi)/orbitalPeriod).^2).^(1/3);

% Altitudes of the apogee and perigee
apogeeAltitude = semiMajorAxis * (1 + twoLineElements.eccentricity) - bodyRadius;
perigeeAltitude = semiMajorAxis * (1 - twoLineElements.eccentricity) - bodyRadius;

% Output
fprintf('Orbital period,          P   = %.4f s\n', orbitalPeriod);
fprintf('Semi-major axis,         a   = %.4f km\n', semiMajorAxis);
fprintf('Apogee Altitude,         r_a = %.4f km\n', apogeeAltitude);
fprintf('Perigee Altitude,        r_p = %.4f km\n', perigeeAltitude);

