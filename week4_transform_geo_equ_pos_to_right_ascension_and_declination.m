% To get the geocentric right ascension and declination, use the 'week4_right_ascension_and_declination.m' program

% Topocentric right ascension and declination at sea level
% Input
theta_G = 126.7; % degrees
positionVector = [-5368, -1784, 3691]; % r = Xi - Yj - Zk;
H = 0; % sea level
geocentricLatitude = 33.877; % degrees
eastLongitude = 151.2093; % degrees
westLongitude = 0; % degrees
equatorialRadius = 6371; % km [Sometimes it is 6378 depending on the question]

% Pre Req Calculations
theta = theta_G + eastLongitude - westLongitude;

% [Step 1]: Position of Observer Vector [Angles must be in Radians]
positionOfObserverVector = [
    equatorialRadius * cos(deg2rad(geocentricLatitude)) * cos(deg2rad(theta)), equatorialRadius * cos(deg2rad(geocentricLatitude)) * sin(deg2rad(theta)), equatorialRadius * sin(deg2rad(geocentricLatitude))];

% [Step 2]: Topocentric Position Vector
rhoVector = positionVector - positionOfObserverVector;

% Solve for Delta and Alpha
rhoMagnitude = sqrt(sum(rhoVector.^2));
l = rhoVector(1)/rhoMagnitude;
m = rhoVector(2)/rhoMagnitude;
n = rhoVector(3)/rhoMagnitude;

declination = asin(n);
rightAscension = rad2deg(acos(l/cos(declination)));

if m <= 0
    rightAscension = 360 - rightAscension;
end

% Output
fprintf('Ascension,   α = %.2f°\n', rightAscension);
fprintf('Declination, δ = %.2f°\n', rad2deg(declination));