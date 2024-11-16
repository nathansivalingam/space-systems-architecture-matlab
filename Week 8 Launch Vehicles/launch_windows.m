% Latitude and inclination
L_0 = 28.5; % deg [Input]
i = 28.5; % deg [Input]

if (i > L_0)
    fprintf('Launch windows available: 2\n');
elseif (i == L_0)
    fprintf('Launch windows available: 1\n');
elseif (i < L_0)
    fprintf('Launch windows available: 0\n');
end