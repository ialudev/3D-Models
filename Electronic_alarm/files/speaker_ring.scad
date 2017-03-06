include <shared.scad>

linear_extrude(2.5,convexity=8)
difference(){
    circle(d=78.5,$fn=q*2);
    circle(d=56,$fn=q);
        
}