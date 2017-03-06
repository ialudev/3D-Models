include <shared.scad>


module layer1(){
    linear_extrude(ring_h,convexity=8){
        difference(){
            circle(d=insert_dia,center=true,$fn=q);
            circle(d=insert_dia-base_wall*3,center=true,$fn=q);
            translate([insert_dia/2,0])
            #square(sev_seg,true);
        }
    }
}


layer1();
