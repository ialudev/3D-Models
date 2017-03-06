include <shared.scad>


module shape1(){
    difference(){
        circle(d=base_dia-base_wall*2,$fn=q/2);
        translate([0,base_dia/2.7])
        square([base_dia,base_dia],true);
        translate([0,-base_dia/2])
        square([base_dia/2,base_dia/2],true);
    }
}

module layer1(){
    linear_extrude(base_h*.7,convexity=8)
    difference(){    
        shape1();
        translate([0,-base_dia*.035])
        scale([.94,.88])
        shape1();
    }
}
difference(){
    layer1();
    //speaker driver 
    translate([0,-base_dia*.15,base_h*.7])
    cube([base_dia*.6,10,32],true);
}
