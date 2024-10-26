% Enter values
e = 0;
a = 700 + 6378; % km
i = 30; % deg
status = '';


Omega_dot = -2.06474 * 10.^14 * a.^(-7/2) * cosd(i) * (1 - e.^2).^-2;

if (0 < i && i < 90)
    status = 'westword';
elseif (90 < i && i < 180)
    status = 'eastward';
elseif (i == 90)
    status = 'polar';
end

fprintf('Omega_dot = %.4f deg, %s\n', abs(Omega_dot), status);