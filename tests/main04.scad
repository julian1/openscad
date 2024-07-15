
// I think we want different wall thickness.
// I think we want an extrusion. on 2d geometry


height = 10;

difference() { 

    group() { 
        // middle section position
        cube([12,12,height], center = true);
        
        // top section positive
        translate([0,0,height / 2 ])  { 
           cube([11,11,1], center = true);
        }   
        
               
        // bottom section positive
        translate([0,0, -height / 2 ])  { 
           cube([11,11,1], center = true);
        }   
        
        
    }

   group() { 
        // hole
        color( "red") {
        cube([10,10, height * 2], center = true);
      } 
      
          
   } 
  
 
}



