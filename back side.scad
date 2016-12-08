/*
Open Mating Nuc, released to the Public Domain by Robert Niles

Grab the Public Domain dovetail code from
http://www.thingiverse.com/thing:10269/
and place in your library folder
*/
include <dovetail.scad>;

rotate([-90,180,0]) {
back_piece();
}

module back_piece(){

    difference() {
        // basic side
        cube([54,18,200]);
        
        // create frame ledge
        translate([54,9,169]) {
            rotate([0,0,90]) {
                color("green") {
                cube([9.525,55,16.1]);
                }
            }
        }
        
        // create frame divvet
        translate([42,9,165]) {
            rotate([0,0,90]) {
                color("red") {
                cube([9.525,30,14.1]);
                }
            }
        }
        
        // rabbet sides for plexiglass
        translate([49,18,5]) {
            rotate([90,0,0]) {
                color("blue") {
                cube([5,185,9]);
                }
            }
        }
        translate([0,18,5]) {
            rotate([90,0,0]) {
                color("blue") {
                cube([5,185,9]);
                }
            }
        }    
        

    } // end difference
 
    // bottom dovetail
    color("green")
    translate([27,18,0]) rotate([0,0,0])
    male_dovetail(max_width=30, min_width=26, depth=10, height=10, cutout_width=0, cutout_depth=0);
    
    // top dovetail
         color("green")
        translate([27,18,185]) rotate([0,0,0])
        male_dovetail(max_width=30, min_width=26, depth=10, height=15, cutout_width=0, cutout_depth=0);
    
    
}

