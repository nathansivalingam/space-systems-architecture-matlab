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

week9_parking_orbit_to_R_SOI(a_park_e, mu);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INTERPLANETARY TRANSFER -> WORKS FOR Q10,11,12,13,14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Home Planet w.r.t. the Centre Planet
r_home_apoapsis = 149600000; % km [SAME IF CIRCULAR]
r_home_periapsis = 149600000; % km [SAME IF CIRCULAR]
a_home = (r_home_apoapsis + r_home_periapsis) / 2; % km

% Spacecraft w.r.t. the Home Planet
mu_home = 398600; % km^3/s^2
r_home_park_apoapsis = 6378.14 + 180; % km [SAME IF CIRCULAR]
r_home_park_periapsis = 6378.14 + 180; % km [SAME IF CIRCULAR]
a_home_park = (r_home_park_apoapsis + r_home_park_periapsis) / 2; % km

% Target Planet w.r.t. the Centre Planet
r_target_apoapsis = 57.91e6 * (1 + 0.2056); % km
r_target_periapsis = 57.91e6 * (1 - 0.2056); % km
a_target = (r_target_apoapsis + r_target_periapsis) / 2; % km

% Spacecraft w.r.t. the Target Planet
mu_target = 6.671 * 10 ^-11 * 3.3011e23 * 10.^-9; % km^3/s^2
r_target_park_apoapsis = NaN; % km [SAME IF CIRCULAR]
r_target_park_periapsis = 2440 + 200; % km [SAME IF CIRCULAR]
a_target_park = 10134; % (r_target_park_apoapsis + r_target_park_periapsis) / 2; % km (Q14 -> 10134 km)

% Other
mu_centre = 132712000000; % km
phi_initial = deg2rad(50); % km [MUST BE RADIANS] [Only needed to find T_wait]

% Transfer Orbit Characteristics
r_transfer_apoapsis = r_home_apoapsis; % [Won't matter regarding apoapsis and periapsis if circular]
r_transfer_periapsis = r_target_apoapsis; % [Won't matter regarding apoapsis and periapsis if circular]
a_transfer = (r_transfer_apoapsis + r_transfer_periapsis) / 2;

% w.r.t. the Sun (Where in the Sun's orbit does the spacecraft leave the home planet and enter the target planet)
r_home_depart = r_home_apoapsis; % [Won't matter regarding apoapsis and periapsis if circular]
r_target_arrive = r_target_apoapsis; % [Won't matter regarding apoapsis and periapsis if circular]

% w.r.t. the Planet (Where in the planet's orbit does the spacecraft leave the home planet and enter the target planet)
r_home_park_depart = r_home_park_apoapsis; % [Won't matter regarding apoapsis and periapsis if circular]
r_target_park_arrive = r_target_park_periapsis; % [Won't matter regarding apoapsis and periapsis if circular]

week9_interplanetary_transfer_ellip(a_transfer, r_home_depart, r_target_arrive, mu_centre, a_home, a_target, r_home_park_depart, r_target_park_arrive, mu_home, a_home_park, mu_target, a_target_park, phi_initial);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INTERPLANETARY TRANSFER (JUST FOR WHEN
% (Home Planet Parking Orbit is Circular, 
% Target Planet Parking Orbit is Circular, 
% Both Planet’s Orbit around the Sun are Circular)
% Works for Q10-13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_home = 149600000; % km
r_home = 6697; % km [PARKING ORBIT]
mu_home = 398600; % km^3/s^2

a_target = 227800000; % km
r_target = 3580; % km [PARKING ORBIT]
mu_target = 42828; % km^3/s^2

mu_centre = 132712000000; % km

phi_initial = deg2rad(50); % km [MUST BE RADIANS]

week9_interplanetary_transfer_circ(a_home, r_home, mu_home, a_target, r_target, mu_target, mu_centre, phi_initial);