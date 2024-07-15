
// this is kind of nice. an inner and outer polyline
// that gets extruded.
// note that before linear_extrude a 2d square or circle is padded
// with height of 1

$fn = 20;
 
 

 linear_extrude(5) { 
 
  difference() { 
         
     minkowski() {    
      square( [10, 25 ], center = true);
      circle(2);
      }
 
            
     minkowski() {    
      square( [5, 5 ], center = true);
      circle(2);
      }
  }
}



