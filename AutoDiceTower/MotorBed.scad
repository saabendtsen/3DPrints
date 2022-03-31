
width = 40;
length = 200;
wallthickness = 3;

height = 220;

diameter = 55;
circleCentercut = 4.1;
motorwidth = 42.5;
motorlength = 39.5;
motorlengthWaxel = 63.4;



difference(){
    //motorbed
    translate([0,0,0])
    cube([motorlengthWaxel+wallthickness*3,motorwidth+wallthickness*2,wallthickness*3]);
    
    //motorCutout
    translate([20,wallthickness,wallthickness])
    cube([motorlength,motorwidth,wallthickness*3]);
}

translate([-7,2.5,0]){
//lock
scale([1,1,1]){
//hull(){
translate([2.5,0,0])
//base
cube([5,5,3]);
hull(){
translate([2.5,0,0])
cube([0.5,5,3]);
//long
translate([0,-2.5,0])
cube([0.5,10,3]);
    }
}
}