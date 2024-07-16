
// it might be easier to just give it a lip of 1.2 + margin eg. 1.3
// simplies all the dimensions.

// for flange with top/bottom recesses 
// we would have 0.8 + 0.8 + 0.4 = 2mm
// while for two pieces we would get 1.2 * 2 == 2.4mm

// use singdole file and view both shapes, then just prefix with '%' when generate
// manufacturing stl

 
$fn = 20;

 
 
// Wall thickness>1.2mm, thinnest part≥0.8mm
 

fudge = 0.2;

radii = 2;
 
innerx = 23;
innery = 26.5;  // freecad was 26. should be 26.5 or 27

outerx = 42;
outery = 48;




// need a pro-trusion to meet minimum specs - 0.2,0.2,10
color("yellow")
 linear_extrude(10) {       
       // circ 
     translate([0, -(innery /2 + 5), 0 ] )
       circle( 3/2);         
}



holeface = 0.4;  // top , yello
endface = 0.8;    // bottom blue
wall = 1.2;    // 0.4 + 0.8
      
     

// top of flat part 0.8mm. with recess to hold vertical wall. extends above horizontal
// now 0.4mm
color("yellow")
 linear_extrude( holeface) { 
 
    difference() {  
        
        group() { 
        offset(r = radii)  
            square( [outerx - radii * 2, outery - radii * 2], center = true);         
        }
    
        group() {
            square( [innerx + (wall * 2) + (fudge * 2), innery + (wall * 2) + (fudge * 2)], center = true);
            
            /*
           // have to mirror text if put on bottom  
           // text engrave min. depth is 0.8mm. and 0.8mm  width.
           // so must be put on top, even if its the inside         
           translate( [0, (innery / 2) + 3.5, 0]) 
             //mirror([1,0,0])
               // text("main06.scad", 2.5, halign = "center"); 
            text("dsn06", 5, halign = "center");
     
             */
        }
    }
} 


// bottom of end-face part, descends below horizontal, which is butt end
// it is the bottom part that has the lip that needs to be thicker
translate([0,0,-endface ]) {
   color("dodgerblue") { 
   //     color("yellow") { 
 linear_extrude( endface) {  
    difference() {  
      
        offset(r = radii) 
           square( [outerx - radii * 2, outery - radii * 2], center = true);
        
        group() { 
           square( [innerx , innery ], center = true);
            
      
            
        }
    }
} }
}


 
//
// % transparent

// vertical wall height, for visualization only
// actually may want to generate both parts in the same file
%translate([0,0, 5 ] ) { 

 // eg. we (16 / 2) -0.4 - 0.4
 linear_extrude(16 / 2 - endface * 2) 
    difference() {  
        square( [innerx + (wall * 2), innery + (wall * 2)], center = true);
        square( [innerx , innery  ], center = true);
  }  
}


pad = 1;

%translate([0,0,15] ) { 

    group() {
 
        // inner square
     linear_extrude(16 / 2 - endface * 2) 
        difference() {  
            square( [innerx + (wall * 2), innery + (wall* 2)], center = true);
            square( [innerx , innery  ], center = true);
      }  

    // band
    translate([0,0, + holeface  ])
     linear_extrude(16 / 2 - wall * 2)  
        difference() {  
            square( [innerx + (wall * 2) + (pad * 2), innery + (wall * 2) + (pad * 2) ], center = true);
            square( [innerx , innery  ], center = true);
        }
    }
}


pad2 = 2;

%translate([0,0,25] ) { 

    group() {
        
     // inner square
     linear_extrude(16 / 2 - endface * 2) 
        difference() {  
            square( [innerx + (wall * 2), innery + (wall * 2) ], center = true);
            square( [innerx , innery  ], center = true);
      }  

    // band
    translate([0,0, + holeface  ])
     linear_extrude(16 / 2 - wall * 2)  
        difference() {  
            square( [innerx + (wall * 2) + (pad2 * 2), innery + (wall * 2) + (pad2 * 2)], center = true);
            square( [innerx , innery  ], center = true);
        }
      
    }
      
}





// can print derived parameter
echo (  "whoot", wall + fudge );



