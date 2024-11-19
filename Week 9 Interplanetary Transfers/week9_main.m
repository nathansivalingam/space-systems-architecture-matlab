clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              SPHERE OF INFLUENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_smallPlanet = 149600000; % km
m_smallPlanet = 5.974e24; % kg
m_bigPlanet = 1.989e30; % kg
[R_SOI] = week9_spheres_of_influence(a_smallPlanet, m_smallPlanet, m_bigPlanet);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          SYNODIC PERIOD OF A RELATIVE TO B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_A = 149600000; % km (A)
a_B = 108200000; % km (B)
mu_Sun = 132712000000; % km^3/s^2 (Why do we use mu_sun for Pluto-Earth calculations)
[P_syn] = week9_synodic_period(a_A, a_B, mu_Sun);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        TIME OF FLIGHT (HOHMANNS TRANSFER)
%                   ANGLE PHASING
%               WAITING TIME (T_WAIT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_home = 149600000; % km (Home Planet)
a_target = 228000000; % km (Target Planet)
mu_Sun = 132712000000; % km^3/s^2
phi_initial = 180; % degrees (only needed to find waiting time)

week9_TOF_hohmann_transfer_and_angle_phase(a_home, a_target, mu_Sun, phi_initial);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            INTERPLANETARY TRANSFER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
week9_interplanetary_transfer();