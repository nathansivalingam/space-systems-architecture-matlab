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

% Angular momentum, h
angularMomentum = (perigeeRadius * (mu) * (1 + eccentricity * cos(perigeeAngle))).^(1/2); % km^2/s

% Orbital period, T
orbitalPeriod = 2 * pi * sqrt(((apogeeRadius + perigeeRadius)/2).^3/mu); % seconds

% Eccentric anomaly
eccentricAnomaly = 2 * atan(sqrt((1 + eccentricity)/(1 - eccentricity)) * tan(trueAnomaly/2)); %#ok<NASGU> % rad
eccentricAnomaly = 1.7281; % Delete this line once you here back from forum

% Mean anomaly
meanAnomaly = eccentricAnomaly - eccentricity * sin(eccentricAnomaly);
time = meanAnomaly/(2 * pi) * orbitalPeriod; % s % Find out where this equation came from 
fprintf('Time          = %.0f s\n', time);

% b)
% Mean anomaly at time = 3 hours
time = 3 * 60 * 60;
if time > (0.5 * orbitalPeriod)
    meanAnomaly = 2 * pi * (time/orbitalPeriod); % rad
end

% plug the values into the kepler equation script, you should get E = 3.4166
eccentricAnomaly = 3.4794; % rad

% Find the true anomaly
trueAnomaly = 2 * atan(sqrt((1 + eccentricity)/(1 - eccentricity)) * tan(eccentricAnomaly/2)) + 2 * pi;
fprintf('True anomaly  = %.1f°\n', rad2deg(trueAnomaly));
