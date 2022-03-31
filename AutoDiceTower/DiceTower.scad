length = 170;
width = 80;
trayHeigth = 25;
wallthickness= 5;
towerheight = 150;
diceOutHeight = 40;

edgelength = 40;

basetray(length,width,trayHeigth);
tower();

module basetray(length,width,trayHeigth){
    
    difference(){
    //Base tray
    cube([width,length,trayHeigth]);
        
    //hollow tray
    translate([wallthickness,wallthickness,wallthickness])
    cube([width-wallthickness*2,length-wallthickness*2,trayHeigth]);
    }
}

module tower(){
    
    difference(){
    //TowerBase
    cube([width,width,towerheight]);
    //hollowTowerBase
    translate([wallthickness,wallthickness,wallthickness])
    cube([width-wallthickness*2,width-wallthickness*2,towerheight]);
    //DiceOut
    translate([wallthickness,width+wallthickness,wallthickness])
    cube([width-wallthickness*2,wallthickness*2,diceOutHeight]);
    //DiceOut
    translate([wallthickness,width-wallthickness*1.5,wallthickness])
    cube([width-wallthickness*2,wallthickness*2,diceOutHeight]);
    
       
    //2nd edge
    translate([wallthickness/2,width-edgelength+1.1,towerheight/3])
    rotate([45,0,0])
    cube([width-wallthickness,width-edgelength+20,wallthickness]);
    
    //1st edge
    translate([wallthickness/2,edgelength+2.4,towerheight-edgelength*1.1 ])
    rotate([135,0,0])
    cube([width-wallthickness,width-edgelength+20,wallthickness]);
    
        
    }
    
    //buttom edge
    translate([0,edgelength*1.09-wallthickness*2,wallthickness])
    rotate([135,0,0])
    cube([width,width-edgelength,wallthickness]);
    
    //2nd edge
difference(){
    translate([width+5,0,0])
    rotate([0,0,0])
    cube([width-wallthickness-0.4,width-edgelength+20,wallthickness-0.4]);
    //90edge
    translate([width+4.8,0,0])
    rotate([45,0,0])
    cube([width-wallthickness+2,wallthickness+2,wallthickness]);
}
    
     //2nd edge
difference(){
    translate([width+5,width,0])
    rotate([0,0,0])
    cube([width-wallthickness-0.4,width-edgelength+20,wallthickness-0.4]);
    //90edge
    translate([width+4.8,width,0])
    rotate([45,0,0])
    cube([width-wallthickness+2,wallthickness+2,wallthickness]);
}
   
   
}