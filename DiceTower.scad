length = 170;
width = 80;
trayHeigth = 20;
wallthickness= 5;
towerheight = 130;
diceOutHeight = 50;

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
    }
    
    //buttom edge
    translate([0,edgelength*1.09-wallthickness*2,wallthickness])
    rotate([135,0,0])
    cube([width,width-edgelength,wallthickness]);
    
    //2nd edge
    translate([0,width-edgelength*0.75,towerheight/2.5])
    rotate([45,0,0])
    cube([width,width-edgelength,wallthickness]);
    
    //1st edge
    translate([0,edgelength*0.55+wallthickness*2,towerheight-edgelength*1.1 ])
    rotate([135,0,0])
    cube([width,width-edgelength,wallthickness]);
      
}