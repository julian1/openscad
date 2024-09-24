


radii = 2;

innerx = 23;    // CRIT 23 > 22mm. on EI 43VA.
outerx = 43;   // CRIT 43 < 44mm on EI 43VA.


wall = 2;
bodywall= wall + 0;    // for body. not flange. should not need to change

// eg. body height for two bobbins. but measured on length of EI plate
height = ((32) / 2) - (wall * 2 );   // CRIT 32 < 33mm. measured on EI. 


// EI plate stack height.
// can just add or remove plates to fit. change for half-stack
innery = 26.5 / 2;  // NOT CRIT. freecad was 26. should be 26.5 or 27
outery = innery + (10 * 2);   // NOT CRIT. (48-26.5)/2 = 10.75mm border



