include <shared.scad>

module shape1(){
    intersection(){
        square(foot_dim,true);
        circle(d=foot_dim[1]*1.45,center=true,$fn=q*6);
    }
}

module screw_holes(){
    //attachment screw holes
    circle(d=m4,center=true,$fn=q);
    translate([0,base_h/4])
    circle(d=m4,center=true,$fn=q);
    translate([0,-base_h/4])
    circle(d=m4,center=true,$fn=q);
}

module layer1(){
    linear_extrude(foot_h,convexity=8,scale=[.75,1],$fn=q){
        difference(){
            shape1();
            screw_holes();
            //inner spaces
            translate([foot_dim[0]/3.4,0])
            square([foot_dim[0]/3,foot_dim[1]*0.94],true);
            translate([-foot_dim[0]/3.4,0])
            square([foot_dim[0]/3,foot_dim[1]*0.94],true);
        }
    }
    translate([0,0,.6])
    linear_extrude(2,convexity=8,scale=[.94,1],$fn=q){
        shape1();
    }
    translate([-foot_dim[0]/2.37,foot_dim[1]/6,9])
    difference(){
        cube([4.5,39,15],true);
        translate([-1.25,0,4.5])
        cube([2.8,40,7],true);
    }
}

difference(){
    layer1();
    //base unit cutout
    translate([0,0,base_dia/2+foot_h/3]) rotate([90,0,0])
    cylinder(d=base_dia,h=base_h,center=true,$fn=q*2);
    //attachment screws
    translate([0,0,1.4]){
        cylinder(d=m4*2.4,h=3,center=true,$fn=q);
        translate([0,base_h/4,0])
        cylinder(d=m4*2.4,h=3,center=true,$fn=q);
        translate([0,-base_h/4,0])
        cylinder(d=m4*2.4,h=3,center=true,$fn=q);
    }
    //power plug holes
    translate([-foot_dim[0]/2.2,foot_dim[1]/6,10]){
        cube([6,34.8,15],true);
        rotate([90,0,90]) {
            hull(){
                translate([-5.45,0,0])
                cylinder(d=12,h=14,center=true,$fn=q);
                translate([5.45,0,0])
                cylinder(d=12,h=14,center=true,$fn=q);
            }
            translate([-13.6,0,0])
                cylinder(d=1.9,h=14,center=true,$fn=q);
            translate([13.6,0,0])
                cylinder(d=1.9,h=14,center=true,$fn=q);
        }
    }
//*/
}

