%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          DIFFERENCES IN SPECIFIC IMPULSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Function
function [deltav] = week8_specific_impulse(I_sp, g_0, R, deltav)
    fprintf('\nSPECIFIC IMPULSE:');
    
    if isnan(deltav)
        deltav = I_sp * g_0 * log(R);    
        fprintf('Required velocity, ΔV = %.4f km/s\n', deltav * 10.^-3);
    elseif isnan(I_sp)
        I_sp = deltav / (g_0 * log(R));
        fprintf('Specific impulse, I_sp = %.4fs\n', I_sp);
    elseif isnan(R)
        R = exp(deltav / (I_sp * g_0));
        fprintf('Mass ratio, R = %.4f\n', R);
    end
end