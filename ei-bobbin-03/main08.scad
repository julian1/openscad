
/*
    the way to handle generation of multiple stl files, with slightly varying parameters
    actually easier to import a values file for each instance.

*/

$fn = 20;


// Wall thickness>1.2mm, thinnest part≥0.8mm
// Would be nice to be able to add text.



// 43-1.2-full 

// overrides
// include <43VA-1.2mm.scad>
// include <43VA-2mm.scad>
// include <43VA-half-1.2mm.scad>
// include <43VA-half-2mm.scad>


// include <25VA-1.2mm.scad>
// include <25VA-2mm.scad>
// include <25VA-half-1.2mm.scad>
include <25VA-half-2mm.scad>









/*
    EXTR. tab must be set to wall thickness.
        and cannot protrude past the box perimeter
    - otherwise the wound coil cannot be slid off.
*/

tabx = wall;
taby = 5;

fudge = 0.3;  // not div
tabxf = tabx + fudge;
tabyf = taby + fudge;



// horizontal flange
// color("yellow")
% group() {

    // circular protrusion needed for jlcpcb
     linear_extrude(10) {
           // circ
         translate([0, -(innery /2 + 5), 0 ] )
           circle( 3/2);
    }

     linear_extrude( wall) {

        difference() {

            group() {
            offset(r = radii)
                square( [outerx - radii * 2, outery - radii * 2], center = true);


            }

            group() {
                square( [innerx , innery  ], center = true);

               // right
               translate( [ innerx / 2  + tabx / 2 ,0, 0 ] )
                square( [tabxf, tabyf ] , center = true);

               // left
               translate( [ -innerx / 2  - tabx / 2 ,0, 0 ] )
                square( [tabxf, tabyf ] , center = true);

               // top
               translate( [  0,  +innery / 2  + tabx / 2 , 0 ] )
                square( [ tabyf, tabxf  ] , center = true);

               // bottom
               translate( [  0,  -innery / 2  - tabx / 2 , 0 ] )
                square( [ tabyf, tabxf  ] , center = true);


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
}


//
// % transparent
// # easier to see
// box/ former


/*
 if use  half wall for tab depth, then the flange can have two bobbins at each end.
 but if tab - is <1.2mm it may not be manufacturable
 perhaps need to try making both
 wall / 2;  // only for positive shape
*/
tabz =  wall ; // / 2

// %color("lightblue")
translate([0,0, wall + 0 ] ) {

 // eg. we (16 / 2) -0.4 - 0.4
 linear_extrude(  height)
    difference() {

        square( [innerx + (bodywall * 2), innery + (bodywall * 2)], center = true);
        square( [innerx , innery  ], center = true);
  }


    // bottom tabs

    // right
    translate( [ innerx / 2  + tabx / 2 , 0, -tabz  ] )
    linear_extrude( tabz )
        square( [tabx, taby ] , center = true);

    // left
    translate( [ -innerx / 2  - tabx / 2 , 0, -tabz  ] )
    linear_extrude( tabz )
        square( [tabx, taby ] , center = true);

    // top
    translate( [ 0, innery / 2  + tabx / 2 , -tabz  ] )
    linear_extrude( tabz)
        square( [ taby, tabx  ] , center = true);

    // bottom
    translate( [ 0, -innery / 2  - tabx / 2 , -tabz  ] )
    linear_extrude( tabz)
        square( [taby, tabx  ] , center = true);

   // top tabs


    // right
    translate( [ innerx / 2  + tabx / 2 , 0, height   ] )
    linear_extrude( tabz )
        square( [tabx, taby ] , center = true);

    // left
    translate( [ -innerx / 2  - tabx / 2 , 0, height  ] )
    linear_extrude( tabz )
        square( [tabx, taby ] , center = true);

    // top
    translate( [ 0, innery / 2  + tabx / 2 ,  height ] )
    linear_extrude( tabz )
        square( [ taby, tabx  ] , center = true);

    // bottom
    translate( [ 0, -innery / 2  - tabx / 2 , height  ] )
    linear_extrude( tabz)
        square( [taby, tabx  ] , center = true);



}





