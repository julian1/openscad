
// it might be easier to just give it a lip of 1.2 + margin eg. 1.3
// simplies all the dimensions.

// for flange with top/bottom recesses 
// we would have 0.8 + 0.8 + 0.4 = 2mm
// while for two pieces we would get 1.2 * 2 == 2.4mm

// use singdole file and view both shapes, then just prefix with '%' when generate
// manufacturing stl

 
$fn = 20;

 
 
// Wall thickness>1.2mm, thinnest part≥0.8mm
 
wall = 1.2;    // 0.4 + 0.8
fudge = 0.3;

radii = 2;
 
innerx = 23;
innery = 26.5;  // freecad was 26. should be 26.5 or 27

outerx = 42;
outery = 48;



     

// top of flat part. with recess to hold vertical wall. extends above horizontal
color("yellow")
 linear_extrude(0.8) { 
 
    difference() {  
        
        group() { 
        offset(r = radii)  
            square( [outerx - radii * 2, outery - radii * 2], center = true);         
        }
    
        group() {
            square( [innerx + wall + fudge, innery + wall + fudge], center = true);
     
        }
    }
} 


// bottom of flat part, descends below horizontal, which is butt end
translate([0,0,-0.4]) {
   color("dodgerblue") { 
 linear_extrude(0.4) {  
    difference() {  
      
        offset(r = radii) 
           square( [outerx - radii * 2, outery - radii * 2], center = true);
        
        group() { 
           square( [innerx , innery ], center = true);
            
           // have to mirror text if put on bottom           
           translate( [0, (innery / 2) + 4, 0]) 
             mirror([1,0,0])
                text("main06.scad", 2.5, halign = "center"); 
            
        }
    }
} }
}

 
//
// % transparent

// vertical wall height, for visualization only
// actually may want to generate both parts in the same file
%translate([0,0,2 ] ) { 

   
 linear_extrude(10) { 
 
    difference() {  
        square( [innerx + wall, innery + wall ], center = true);
        square( [innerx , innery  ], center = true);
    }
}  
}

// can print derived parameter
echo (  "whoot", wall + fudge );



