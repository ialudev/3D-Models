include <shared.scad>

rotate([0,180,0])
difference(){
    //screw stiffener
    union(){
        translate([0,0,(nut_h*1.45)/2])
        cube([m4*2,base_h-screw_h*4,nut_h*1.45],true);
        cylinder(d=m4*3,h=nut_h*1.45,$fn=q/2);
        translate([0,base_h/4,0])
        cylinder(d=m4*3,h=nut_h*1.45,$fn=q/2);
        translate([0,-base_h/4,0])
        cylinder(d=m4*3,h=nut_h*1.45,$fn=q/2);
    }

    cylinder(d=8.5,h=nut_h,$fn=6);
    cylinder(d=7.2,h=20,center=true,$fn=q);
    translate([0,base_h/4,0]){
        cylinder(d=8.5,h=nut_h,$fn=6);
        cylinder(d=7.2,h=20,center=true,$fn=q);
    }
    translate([0,-base_h/4,0]){
        cylinder(d=8.5,h=nut_h,$fn=6);
        cylinder(d=7.2,h=20,center=true,$fn=q);
    }

}
