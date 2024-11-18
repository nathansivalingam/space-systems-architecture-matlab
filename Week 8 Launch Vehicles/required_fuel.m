%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 REQUIRED FUEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Function
function [m_p] = required_fuel(m_f, deltav, I_sp, g_0)
    fprintf('\nREQUIRED FUEL:');
    
    % Function to find required propellant (kg)
    m_p = m_f * ( exp( deltav / (g_0 * I_sp ) ) - 1 );
    
    % Output
    fprintf('Required propellent, m_p = %.4f kg\n', m_p);
end
