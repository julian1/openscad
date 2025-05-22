
$fn = 50;

// ok. this gives us a very precise control over final bend position.

// but the 90deg plane rotation is too complicated. 
// and cannot see that it is possible to unbend the shape with deformation.
 

rotate_extrude( angle=90)
translate([5,0,0])
square([2,10], center=true);


translate([5,0,0])
square([2,10], center=true);




translate([0,0,0])
square([2,10], center=true);
