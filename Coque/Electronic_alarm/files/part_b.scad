include <shared.scad>
include <threads.scad>

module screw_threads(){
    color("white")
    difference(){
        translate([0,0,lid_h/2.3])
        cylinder(d=lid_dia+7,h=lid_h,center=true,$fn=q*4);
        metric_thread(lid_dia+4.65, 4, lid_h*2,internal=true);
        cylinder(d=lid_dia-7,h=lid_h,center=true,$fn=q*2);
    }
}

module bevel(w){
    rotate_extrude(angle = 360, convexity = 4,$fn=q*2){
        translate([w,0])
        rotate([0,0,45])
        square([5,5]);
    }
}

difference(){
    screw_threads();
    translate([0,0,-lid_h/2.5])
    bevel((lid_dia+7+2.5)/2);
    translate([0,0,lid_h/1.22])
    bevel((lid_dia+7+2.5)/2);
    translate([0,0,-lid_h/2.5])
    bevel((lid_dia-7-2.5)/2);
}