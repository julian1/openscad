

// need to figure out a inside / outside poyine + extrusion

height = 4;

difference() { 

  cube([12,12,height], center = true);


  translate( [ 0,0,+3]) { 
    color( "red") {
       cube([10,10, height * 2], center = true);
      } 
  }
}



