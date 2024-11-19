clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              SPHERE OF INFLUENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_smallPlanet = 228000000; % km
m_smallPlanet =  641.9e21; % kg
m_bigPlanet = 1.989e30; % kg
[R_SOI] = week9_spheres_of_influence(a_smallPlanet, m_smallPlanet, m_bigPlanet);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          SYNODIC PERIOD OF A RELATIVE TO B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_A = 149600000; % km (A)
a_B = 228000000; % km (B)
mu_Sun = 132712000000; % km^3/s^2 (Why do we use mu_sun for Pluto-Earth calculations)
[T] = week9_synodic_period(a_A, a_B, mu_Sun);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        TIME OF FLIGHT (HOHMANNS TRANSFER)
%                   ANGLE PHASING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_A = 149600000; % km (A [Home Planet])
a_B = 228000000; % km (B [Target Planet])
mu_Sun = 132712000000; % km^3/s^2
[TOF] = week9_TOF_hohmann_transfer(a_A, a_B, mu_Sun);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            INTERPLANETARY TRANSFER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
week9_interplanetary_transfer();