%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              SPHERE OF INFLUENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [R_SOI] = week9_spheres_of_influence(a_smallPlanet, m_smallPlanet, m_bigPlanet)
    fprintf('SPHERE OF INFLUENCE:\n')
    R_SOI = a_smallPlanet * (m_smallPlanet / m_bigPlanet).^(2/5);
    fprintf('R_SOI = %.4f km\n', R_SOI);
end