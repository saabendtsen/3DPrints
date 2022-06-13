length = 4.5;
width = 60;
height = 4.5;
radius = 4.9/2;
difference()
{
cube([width,length,height]);
translate([-1,3.1,3.1])
cube([width+5,length,height]);
translate([-1,-1.1,3.1])
cube([width+5,2.5,height]);
translate([-1,-1.1,-1.1])
cube([width+5,2.5,2.5]);
translate([-1,3.1,-1.1])
cube([width+5,length,2.5]);
}

translate([width,radius-0.3,radius-0.2])
rotate([0,90,0])
cylinder(20,r=radius,$fn=128);
