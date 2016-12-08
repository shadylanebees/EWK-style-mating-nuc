/*
Open Mating Nuc, released to the Public Domain by Robert Niles

Grab the Public Domain dovetail code from
http://www.thingiverse.com/thing:10269/
and place in your library folder
*/
include <dovetail.scad>;

difference() {
rotate([-90,180,0]) {
front_piece();
}

dovetails();
}

module entrance_area() {
        $fn=60;
        // create the entrance hole
        translate([27,20,19]) {
            rotate([90,0,0]) {
                color("green") {
                cylinder(h=21, r=10);
               }
            }
        }
        
        // cubed cutout on inner side
       translate([6,10,7]) {
            color("red") {
                cube([42,15,22]);
            }
       }  
            
        // gate area
        translate([27,5,32]) {
            rotate([90,0,0]) {
                color("green") {
                cylinder(h=6, r=25);
               }
            }
        }
        
        // gate area screw hole
        translate([27,9,32]) {
            rotate([90,0,0]) {
                color("red") {
                cylinder(h=10, r=1.5);
               }
            }
        }        
}

module front_piece(){  
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
        
        translate([0,0,7]) {
            entrance_area();
        }
           /*  translate([30,.5,67]) {
            rotate([90,-90,0]) {
                color("blue") {
                    linear_extrude(height=1) { 
                text("shadylanebees.com",size = 8); }
                }
            }
        }*/
        
        
    }
}

module dovetails() {
        // bottom dovetail
    color("green")
    translate([-27,0,18]) rotate([-90,0,0])
    female_dovetail_negative(max_width=30,min_width=26, depth=10, height=10, block_width=20, block_depth=10, clearance=0.25);
    
    // top dovetail
         color("green")
        translate([-27,185,18]) rotate([-90,0,0])
       female_dovetail_negative(max_width=30,min_width=26, depth=10, height=15, block_width=20, block_depth=10, clearance=0.25);
    
}





    



   
    
