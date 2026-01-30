## Garbage Gyre Tracking System Mission 🛰️
### Welcome to my final report repository!👋

Here you will find many of the calculations conducted in the final report appendix. The main difference is that they are written using MATLAB. 
The reason behind this repository was to streamline the design process and make it easier to implement design changes in the future.

Currently the following programs have been written:
- The increase in orbital period due to a reduction in altitude. [Innovations](https://github.com/nathansivalingam/space-systems-architecture-matlab/blob/main/Garbage%20Gyre%20Tracking%20System%20Mission/innovations.m)
- The nodal regression rate, apsidal rotation rate and aerodynamic drag calculations as part of the analysis on the relevant orbital perturbations. [Perturbations](https://github.com/nathansivalingam/space-systems-architecture-matlab/blob/main/Garbage%20Gyre%20Tracking%20System%20Mission/perturbations.m)
- The hohmann transfer velocity changes necessary to simulate the transfer orbit from an elliptical parking orbit to a final sun-synchronous orbit in STK. [Hohmann Transfer](https://github.com/nathansivalingam/space-systems-architecture-matlab/blob/main/Garbage%20Gyre%20Tracking%20System%20Mission/hohmann_transfer_parking_orbit_to_final_orbit.m)

STK generates large binary datasets typical of aerospace simulation workflows, which are not suitable for version control in GitHub. The relevant STK files for this mission are therefore hosted externally and can be accessed via OneDrive: [STK](https://unsw-my.sharepoint.com/:f:/g/personal/z5359644_ad_unsw_edu_au/IgBGeREeuVtxRLOwT-H4vvKwAeUotmkN6OcqiC6QI_JzadY?e=AvgVJz)
