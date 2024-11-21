clc
%
vecOne = [6500, 0, 0];
vecTwo = [0, 7.5, 0];

% Angle Between Vectors
vecOneMag = sqrt(sum(vecOne.^2));
vecTwoMag = sqrt(sum(vecTwo.^2));

theta = rad2deg(acos((dot(vecOne, vecTwo))/(vecOneMag * vecTwoMag)));
secondTheta = 360 - theta;

fprintf('Angle Between Vectors: %.4f or %.4f deg\n', theta, secondTheta);

% Cross Product
fprintf('Vector Cross Product:');
disp(cross(vecOne, vecTwo));