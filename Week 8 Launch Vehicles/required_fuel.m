% Variables
I_sp = 290; % Specific inpulse (seconds)
delta_V = 1.831 * 10.^3; % required velocity change (m/s)
m_f = 907; % Burn out mass (kg)
g_0 = 9.81; % Acceleration due to gravity (m / s^2)

% Function to find required propellant (kg)
m_p = m_f * ( exp( delta_V / (g_0 * I_sp ) ) - 1 );

% Output
fprintf('Required propellent, m_p = %.4f kg\n', m_p);
