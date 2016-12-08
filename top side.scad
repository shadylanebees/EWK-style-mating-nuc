/*
Open Mating Nuc, released to the Public Domain by Robert Niles

Grab the Public Domain dovetail code from
http://www.thingiverse.com/thing:10269/
and place in your library folder
eg: File/Show Library Folder
*/
include <dovetail.scad>;

// make a feed tray that is 180mm long
// solid feed for now ... fondant, candy, etc.
feed_tray(180);

// make an access tray for bees to come up to get feed
// should exclude queens
translate([0,58,0]) access_tray(127);

// Other other end ..use for storage
// would love to see what ideas others come up with
// for tray sections ... for now .. just a storage part
translate([0,116,0]) top_box_feed_tray(160,0,1,0);




module access_tray(length=100) {
    difference() {
        top_box_feed_tray(length,0,0);
        translate([0,7,17]) cube([10,40,8]);  
        color("blue") translate([13,8,2]) cube([length-26,39,4]);
        translate([0,4,0]) queen_excluder(length);
    }
}

module queen_excluder(length=100) { // using diameter of 4.3mm
    for(i = [10 : 8.8 : 44]) {
        translate([(length-(length-30))/2,i,0])
        hull() {
            cylinder(d=4.3,h=2);
            translate([length-30,0,0]) cylinder(d=4.3,h=2);
        }
    }
}

module feed_tray(length=100) {
    difference() {
        top_box_feed_tray(length,1,0);
        translate([length-10,7,17]) cube([10,40,8]);
    }
}

module top_box_feed_tray(length=100,male=0,female=0,solid=0) {
    if(male) {
        translate([-18,0,15]) overhang(); // male side
         translate([-5,0,21.0]) rotate([90,0,90]) handles();
    }
    if (female) {
        translate([length,0,15]) overhang(); // female side
        translate([length+5,0,21.0]) rotate([90,0,90]) handles();
    }
    
    difference() {
        cube([length,54,26]); //10 mm from bottom to top of dovetail
        if (solid == 0) {
            translate([10,5,6]) cube([length-20,44,23]);
        }
     
        // add glass wedge slits
        color("blue") translate([(length/2)-5,1,0]) cube([10,1.5,26]);
        color("blue") translate([(length/2)-5,54-2.5,0]) cube([10,1.5,26]);
        
        // add female dovetail
        translate([length,27,0]) rotate([0,0,90])   
        female_dovetail_negative(max_width=30,min_width=26, depth=10, height=15, block_width=20, block_depth=10, clearance=0.25);
        
        //side rabbets
        translate([0,0,0]) rotate([0,0,0]) cube([length,5,5]);
        translate([0,49,0]) rotate([0,0,0]) cube([length,5,5]);
    }        
    difference() {
        color("blue") translate([0,0,26]) cube([10,54,3]);
        if (solid == 0) {
            translate([7,0,26]) lid_cut();
        }
    }
    difference() {
        color("blue") translate([length-10,0,26]) cube([10,54,3]);
        if (solid == 0) {
            translate([length-17,0,26]) lid_cut();
        }
    }
    color("green") translate([0,27,0]) rotate([0,0,90])
    male_dovetail(max_width=30, min_width=26, depth=10, height=15, cutout_width=0, cutout_depth=0);
    
}

module overhang() {
    color("green")
    cube([18,54,14]);
}

module lid_cut(l=10,w=54.4,h=3,wt=2,t=2,et=0.5,r=5){
	translate ([10, 54, 0]) 
	rotate (a = [0, 0, 180]) 
	difference() {
		cube([l,w,h]);
		translate ([0, -1, et]) rotate (a = [45, 0, 90]) cube (size = [w+2, h*2, h*2]); 
        translate ([l, -1, et]) rotate (a = [45, 0, 90]) cube (size = [w+2, h*2, h*2]); 
	}
}

module handles() {
    a0 = [[0,0],[54,0],[54,20],[45,30],[9,30],[0,20]];
    b0 = [0,1,2,3,4,5];
    a1 = [[10,8],[44,8],[46,15],[40,23],[14,23],[8,15]]; // which do i like better?
    //a1 = [[10,8],[44,8],[46,18],[30,25],[24,25],[8,18]];
    b1 = [6,7,8,9,10,11];
    a = concat (a0,a1);
    b  = [b0,b1];

    linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
    offset(r = -2)
    offset(r = 2)
    polygon(a,b);
}