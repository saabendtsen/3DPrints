cube([50,100,3]);



difference(){
    translate([25,50,0])
    cylinder(h=30,d=38,$fn=128);
    
    translate([25,50,3])
    cylinder(h=30,d=35,$fn=128);
}