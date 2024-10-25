% Input
positionVector = [-5368, -1784, 3691]; % r = Xi - Yj - Zk;

% Functions
positionMagnitude = sqrt(positionVector(1).^2 + positionVector(2).^2 + positionVector(3).^2);
l = positionVector(1)/positionMagnitude;
m = positionVector(2)/positionMagnitude;
n = positionVector(3)/positionMagnitude;

% right ascension and declination
declination = asin(n);
rightAscension = rad2deg(acos(l/cos(declination)));

% disp(rightAscension);
if m <= 0
    rightAscension = 360 - rightAscension;
end

% Output
fprintf('Ascension,   α = %.2f°\n', rightAscension);
fprintf('Declination, δ = %.2f°\n', rad2deg(declination));

% Method is based on the 'Transformation between I_t J_t K_t & IJK' excel section