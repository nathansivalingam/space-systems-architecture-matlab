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
%         TIME OF FLIGHT (HOHMANNS TRANSFER)
%                   ANGLE PHASING
%               WAITING TIME (T_WAIT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_home = 149600000; % km (Home Planet)
a_target = 228000000; % km (Target Planet)
mu_Sun = 132712000000; % km^3/s^2
phi_initial = 180; % degrees (only needed to find waiting time)

week9_TOF_hohmann_transfer_and_angle_phase(a_home, a_target, mu_Sun, phi_initial);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REQUIRED VELOCITY TO GO FROM PARKING ORBIT TO 
% EARTH'S BOUNDARY SOI SUCH THAT IT ARRIVES THERE
% WITH ZERO VELOCITY RELATIVE TO EARTH (ASSUMED CIRCULAR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_park_e = 12756; % km
mu = 398600; % km^3/s^2

week9_parking_orbit_to_R_SOI(parking_orbit_radius, mu);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              ΔV_boost and ΔV_retro (QUESTION 10 STILL NEEDS TO BE FINISHED)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a_home = 1.496e8; % kms
% a_target = 1.081e8; % km
% r_park_home = 6600; % km
% r_park_target = 6400; % km
% mu_home = 398600; % km^3/s^2
% mu_target = 3.257e5; % km^3/s^2
% mu_sun = 132712000000; % km^3/s^2

% week9_boost_and_retro(a_home, a_target, r_park_home, r_park_target, mu_home, mu_target, mu_sun);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            EARTH ORBIT -> MARS ORBIT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_Earth = 149600000; % km
a_Mars = 227800000; % km
mu_Sun = 132712000000; % km

week9_interplanetary_transfer(a_Earth, a_Mars, mu_Sun);