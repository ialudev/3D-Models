include <shared.scad>
include <threads.scad>

module main_tube(){
    color("white")
    linear_extrude(base_h,convexity=8){
        difference(){
            circle(d=base_dia,$fn=q*2);
            circle(d=base_dia-base_wall*2,$fn=q/2);
        }
    }
}
module screw_threads(){
    color("white")
    difference(){
        metric_thread(base_dia+4.65, 4, screw_h);
        cylinder(d=base_dia,h=screw_h*3,center=true,$fn=q/2);
    }
}


difference(){
    union(){
        main_tube();
        //Large button base
        translate([0,(base_dia-base_wall*2)/2,base_h/3.2])
        rotate([90,0,0])
        cylinder(d=btn_large+base_wall*2,h=base_wall*2,center=true,$fn=q);
        //small button 1 base
        rotate([90,0,0])
        translate([0,base_h/1.45,-(base_dia-base_wall*2)/2])
        cylinder(d=btn_small+base_wall,h=base_wall*2,center=true,$fn=q);
        //small button 2
        rotate([90,0,35])
        translate([0,base_h/1.45,-(base_dia-base_wall*2)/2])
        cylinder(d=btn_small+base_wall,h=base_wall*2,center=true,$fn=q);
        //small button 3
        rotate([90,0,-35])
        translate([0,base_h/1.45,-(base_dia-base_wall*2)/2])
        cylinder(d=btn_small+base_wall,h=base_wall*2,center=true,$fn=q);
        //screw stiffener
        translate([0,-(base_dia-m4/2)/2,base_h/2])
        cube([m4*2,m4/2,base_h-screw_h*2],true);
    }
    //Large button hole
    translate([0,base_dia/2,base_h/3.2])
    rotate([90,0,0])
    cylinder(d=btn_large,h=20,center=true,$fn=q);
    //small button 1 hole
    rotate([90,0,0])
    translate([0,base_h/1.45,-base_dia/2])
    cylinder(d=btn_small,h=20,center=true,$fn=q);
    //small button 2
    rotate([90,0,35])
    translate([0,base_h/1.45,-base_dia/2])
    cylinder(d=btn_small,h=20,center=true,$fn=q);
    //small button 3
    rotate([90,0,-35])
    translate([0,base_h/1.45,-base_dia/2])
    cylinder(d=btn_small,h=20,center=true,$fn=q);
    //base attachment screws
    rotate([90,0,0])
    translate([0,base_h/2,base_dia/2]){
        cylinder(d=m4,h=20,center=true,$fn=q);
        translate([0,base_h/4,0])
        cylinder(d=m4,h=20,center=true,$fn=q);
        translate([0,-base_h/4,0])
        cylinder(d=m4,h=20,center=true,$fn=q);
    }
    //cabel routing holes
    rotate([90,0,-18])
    translate([0,base_h/2.7,base_dia/2])
    cylinder(d=btn_small,h=20,center=true,$fn=q/2);
    rotate([90,0,18])
    translate([0,base_h/1.6,base_dia/2])
    cylinder(d=btn_small,h=20,center=true,$fn=q/2);
}

screw_threads();
translate([0,0,base_h-screw_h])
screw_threads();
//*/
