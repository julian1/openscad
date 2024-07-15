
// eg. the radii of each point can be adjusted

include <Round-Anything/polyround.scad>

 
$fn = 20;


  radiiPoints=[[-4,0,1],[5,3,1.5],[0,7,0.1],[8,7,10],[20,20,0.8],[10,0,10]];
  
  polygon(polyRound(radiiPoints,30));
  %translate([0,0,0.3])polygon(getpoints(radiiPoints));//transparent copy of the polgon without rounding
 