% To get the geocentric right ascension and declination, use the 'week4_right_ascension_and_declination.m' program

% Topocentric right ascension and declination at sea level
% Input
theta_G = 126.7; % degrees
positionVector = [-5368, -1784, 3691]; % r = Xi - Yj - Zk;
H = 0; % sea level
geocentricLatitude = 33.877; % degrees
eastLongitude = 151.2093; % degrees
westLongitude = 0; % degrees
equatorialRadius = 6378; % km [Sometimes it is 6378 depending on the question]

% Pre Req Calculations
theta = theta_G + eastLongitude - westLongitude;
% UNCOMMENT TO PRINT THETA
% disp(theta);

% [Step 1]: Position of Observer Vector [Angles must be in Radians]
positionOfObserverVector = [
    equatorialRadius * cos(deg2rad(geocentricLatitude)) * cos(deg2rad(theta)), equatorialRadius * cos(deg2rad(geocentricLatitude)) * sin(deg2rad(theta)), equatorialRadius * sin(deg2rad(geocentricLatitude))];

% UNCOMMENT TO PRINT THE POSITION OF OBSERVER VECTOR
% fprintf('%.4f %.4f %.4f\n', positionOfObserverVector(1), positionOfObserverVector(2), positionOfObserverVector(3));

% [Step 2]: Topocentric Position Vector
rhoVector = positionVector - positionOfObserverVector;

% UNCOMMENT TO PRINT THE RHO VECTOR
% fprintf('%.4f %.4f %.4f\n', rhoVector(1), rhoVector(2), rhoVector(3));

% Solve for Delta and Alpha
rhoMagnitude = sqrt(sum(rhoVector.^2));

% UNCOMMENT TO PRINT THE RHO MAGNITUDE
% fprintf('rhoMagnitude = %.4f\n', rhoMagnitude);

l = rhoVector(1)/rhoMagnitude;
m = rhoVector(2)/rhoMagnitude;
n = rhoVector(3)/rhoMagnitude;

% UNCOMMENT TO PRINT l, m, and n
% fprintf('l = %.4f, m = %.4f, n = %.4f\n', l, m, n);

declination = asind(n);
rightAscension = acosd(l/cosd(declination));

if m <= 0
    rightAscension = 360 - rightAscension;
end

% Output
fprintf('Ascension,   α = %.2f°\n', rightAscension);
fprintf('Declination, δ = %.2f°\n', declination);