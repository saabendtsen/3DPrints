width = 70;
length = 120;
thicc = 5;
height = 60;


//Mid connector
translate([0,length/2-thicc/2,0])
    cube([width,thicc,height]);
//Top

translate([0,length/4,height-thicc])    
    cube([width,length/2,thicc]);


difference(){
    union(){
        //Base
        translate([width/2,0,-15])
        rotate([-90,0,0])
        cylinder(h=length,r=width/1.7,$fn=128);
        //1st bump
        translate([width/2,0,-10])
        rotate([-90,0,0])
        cylinder(h=10,r=width/1.7,$fn=128);
        //2nd bump
        translate([width/2,length-10,-10])
        rotate([-90,0,0])
        cylinder(h=10,r=width/1.7,$fn=128);
        //Buttom
        cube([width,length,thicc]);
}
    
    //Cut buttom
    translate([-15,-5,-100])
    cube([width*2,length+10,+100]);
    //Cut left side
    translate([-20,-5,-3])
    cube([20,length+10,15]);
    //Cut right side
    translate([width,-5,-3])
    cube([20,length+10,15]);
    
    //cut inside
    translate([width/2,thicc,-15-thicc])
    rotate([-90,0,0])
    cylinder(h=length-thicc*2,r=width/1.79);
}

  