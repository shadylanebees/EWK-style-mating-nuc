/*
Open Mating Nuc, released to the Public Domain by Robert Niles

Grab the Public Domain dovetail code from
http://www.thingiverse.com/thing:10269/
and place in your library folder
*/
include <dovetail.scad>;

// bee space ... 6-9mm

bottom_box_part(155,1,1);
translate([0,56,0]) bottom_box_part(155,1,1);
translate([0,112,0]) bottom_box_part(155,1,1);

// male = male dovetail
// female = female dovetail
module bottom_box_part(length=100,male=0,female=0){
     difference() {
        union() {        
            difference() {
                union() {
                cube([length,54,10]);
                if (male) {    
                    color("green")
                    translate([0,27,0]) rotate([0,00,90])
                    male_dovetail(max_width=30, min_width=26, depth=10, height=10, cutout_width=0, cutout_depth=0);
            }   
                }
                //side rabbets
                translate([-5,0,5]) {
                        rotate([0,0,0]) {
                            color("red") {
                            cube([length+5,5,5]);
                            }
                        }
                }    
                translate([-5,49,5]) {
                        rotate([0,0,0]) {
                            color("red") {
                            cube([length+5,5,5]);
                            }
                        }
                    }            
            } //end difference    
            guides(0,length);     
        }   
        
        if (female) {
            // add female dovetail
            translate([length,27,0]) rotate([0,0,90]) 
            color("red")    
            female_dovetail_negative(max_width=30,min_width=26, depth=10, height=10, block_width=20, block_depth=10, clearance=0.25);
        }    
    }
}    
 
 module guides(s,l) {
    translate([s,51.5,5]) {
        color("pink") {
            prism(l, 2.5, 2.5);
        } 
    }
    translate([s,0,7.5]) {
        rotate([-90,0,0]) {
            color("pink") {
                prism(l, 2.5, 2.5);
            } 
        }
    }
}

module prism(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}
   





