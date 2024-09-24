


radii = 2;

innerx = 20;    // CRIT 20 > 19mm. on EI 25VA.
outerx = 37;   // CRIT 37 < 38mm on EI 43VA.


wall = 1.2;
bodywall= wall + 0;    // for body. not flange. should not need to change

// eg. body height for two bobbins. but measured on length of EI plate
height = ((27) / 2) - (wall * 2 );   // CRIT 27 < 28mm. measured on EI.


// EI plate stack height.
// can just add or remove plates to fit. change for half-stack
// appears the same for 43VA v 25VA.
innery = 26.5;  // NOT CRIT. freecad was 26. should be 26.5 or 27
outery = innery + (10 * 2);   // NOT CRIT. (48-26.5)/2 = 10.75mm border



