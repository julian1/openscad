
// EXTR.  if could manage the lip on both sides - we could stack with only a single slab section the middle separator

// not sure if a complicate subtraction is the right way to go
// also this isn't quite correct

height = 1;

difference() { 

  cube([20,20,height], center = true);


   group() { 
    color( "red") {
       cube([10,10, height * 2], center = true);
      } 
      
    translate([0,0,height / 2]) {
      color( "green") {
       cube([11,11, height], center = true);
      }
   } 
  }
 
}



