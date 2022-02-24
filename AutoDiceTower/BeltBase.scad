width = 80;
length = 150;
wallthickness = 3;

height = 180;

diameter = 40;
circleCentercut = 3;

difference(){

hull(){
//baseBotom
cube([width,length,wallthickness]);

//Left Lower circle
translate([0,diameter/2,diameter])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter);



//Left Upper circle
translate([0,length-diameter/2,height])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter);


//Right Lower circle
translate([width-wallthickness,diameter/2,diameter])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter);

//Right Upper circle
translate([width-wallthickness,length-diameter/2,height])
rotate([90,0,90])
cylinder(h=wallthickness,d = diameter);

}

//cutout
translate([wallthickness,-1,wallthickness])
cube([width-wallthickness*2,length+wallthickness,height*2]);

//Lower pin cutout
translate([-1,diameter/2,diameter])
rotate([90,0,90])
cylinder(h=width+wallthickness*2,d = circleCentercut);

//Upper pin cutout
translate([0,length-diameter/2,height])
rotate([90,0,90])
cylinder(h=width+wallthickness*2,d = circleCentercut);
}
