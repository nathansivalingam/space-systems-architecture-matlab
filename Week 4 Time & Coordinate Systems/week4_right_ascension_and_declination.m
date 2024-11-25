clc
% Input
positionVector = [-3000, -60000, 9000]; % r = Xi - Yj - Zk;

% Functions
positionMagnitude = sqrt(positionVector(1).^2 + positionVector(2).^2 + positionVector(3).^2);
fprintf('r (magnitude) = %.4f\n', positionMagnitude);
l = positionVector(1)/positionMagnitude;
m = positionVector(2)/positionMagnitude;
n = positionVector(3)/positionMagnitude;
fprintf('l = %.4f\n', l);
fprintf('m = %.4f\n', m);
fprintf('n = %.4f\n', n);


% right ascension and declination
declination = asind(n);
fprintf('Declination, δ = %.4f°\n', declination);
rightAscension = acosd(l/cosd(declination));
if m <= 0
    rightAscension = 360 - rightAscension;
end

% Output
fprintf('Ascension, α = %.2f°\n', rightAscension);

% Method is based on the 'Transformation between I_t J_t K_t & IJK' excel section