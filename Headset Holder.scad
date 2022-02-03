width = 70;
length = 200;
thicc = 5;
height = 50;

//Buttom
cube([width,length,thicc]);
//Mid connector
translate([0,length/2-thicc/2,0])
    cube([width,thicc,height]);
//Top

translate([0,length/4,height-thicc])    
    cube([width,length/2,thicc]);


difference(){
    union(){
    
translate([width/2,0,-15])
    rotate([-90,0,0])
    cylinder(h=length,r=width/1.7,$fn=128);
        
        cylinder(h=10,width
    }
    
    
    translate([-15,-5,-100])
    cube([width*2,length+10,+100]);
}