include <shared.scad>

module shape1(){
    difference(){
        square([sev_seg[0],sev_seg[1]/6],true);
        translate([sev_seg[0]/2-m1*m1,0])
        circle(d=m1,$fn=q);
        translate([-sev_seg[0]/2+m1*m1,0])
        circle(d=m1,$fn=q);
    }
}

module layer1(){
    linear_extrude(insert_h,convexity=8){
        difference(){
            circle(d=insert_dia,center=true,$fn=q*2);
            square(sev_seg,true);
        }
    }
}

module layer2(){
    linear_extrude(sev_seg_h,convexity=8){
        translate([0,sev_seg[1]/2+sev_seg[1]/12,0])
        shape1();
        translate([0,-sev_seg[1]/2-sev_seg[1]/12,0])
        shape1();
    }
}

layer1();
layer2();