width = 46;
length = 200;
wallthickness = 3;

height = 223.5;

diameter = 55;
circleCentercut = 4.8;
motorwidth = 42.5;
motorlength = 39.5;
motorlengthWaxel = 63.4;



difference(){

hull(){
//baseBotom
cube([width,length,wallthickness]);

//Left Lower circle
translate([0,diameter/2,diameter])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter,$fn=128);



//Left Upper circle
translate([0,length-diameter/2,height])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter,$fn=128);


//Right Lower circle
translate([width-wallthickness,diameter/2,diameter])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter,$fn=128);

//Right Upper circle
translate([width-wallthickness,length-diameter/2,height])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter,$fn=128);

}

//cutout
translate([wallthickness,-1,wallthickness])
cube([width-wallthickness*2,length+wallthickness,height*2]);

//Lower pin cutout
translate([-1,diameter/2,diameter])
rotate([90,0,90])
cylinder(h=width+wallthickness*2,d = circleCentercut,$fn=128);

//Upper pin cutout
translate([0,length-diameter/2,height])
rotate([90,0,90])
cylinder(h=width+wallthickness*2,d = circleCentercut,$fn=128);
}

//support wall
translate([0,length* 2/3,0])
cube([width,wallthickness,width/2]);


//Motormount

    //motorbed
    translate([width,0,0])
    cube([motorlengthWaxel+wallthickness*2,motorwidth+wallthickness*2,wallthickness*2]);
    
difference(){
    //frontmount
    translate([motorlengthWaxel+wallthickness,wallthickness,wallthickness])
    cube([2,42,42]);
    
     translate([motorlengthWaxel,13,wallthickness])
    cube([wallthickness*2,22.3,33]);

}