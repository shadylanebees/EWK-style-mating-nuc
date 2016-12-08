/*
Open Mating Nuc, released to the Public Domain by Robert Niles
*/

lid(l=180);
translate([0,56,0]) lid(l=160);
translate([0,112,0]) lid(l=127);

// print two wedges for each section
translate([0,168,0]) glass_wedge();
translate([40,168,0]) glass_wedge();
translate([80,168,0]) glass_wedge();
translate([0,179,0]) glass_wedge();
translate([40,179,0]) glass_wedge();
translate([80,179,0]) glass_wedge();


module glass_wedge() {
    color("blue") translate([0,0,0]) cube([34,9.5,1]);
    color("red") translate([0,0,1]) cube([1,9.5,1]);
    color("red") translate([2,0,1]) cube([1,9.5,1]);
}

module lid(l=100,w=54,h=3,wt=2,t=2,et=0.5,r=5){
    l = l-15.0; // was 15.50
	translate ([0, 0, 0]) 
	rotate (a = [0, 0, 0]) 
	difference(){
		cube([l,w,h]);
		translate ([0, -1, et]) rotate (a = [45, 0, 90]) cube (size = [w+2, h*2, h*2]); 
        
        translate ([l, -1, et]) rotate (a = [45, 0, 90]) cube (size = [w+2, h*2, h*2]);
        
        //slits for the glass wedges
        color("blue") translate([(l/2)-5,1,0]) cube([10,1.5,3]);
        color("blue") translate([(l/2)-5,54-2.5,0]) cube([10,1.5,3]);
	}    
     grip_ribs(l-7,w);
}

module grip_ribs(l,w=54) {
    n = floor(w/10);
    for (i=[n:4:w-4]) {
        color("blue") translate([3.5,i,3]) cube([l,1,.5]);
    }
}