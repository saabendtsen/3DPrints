length = 170;
width = 80;
trayHeigth = 20;
wallthickness= 5;
towerheight = 170;
diceOutHeight = 40;

edgelength = 40;

    
    
    //2nd edge
    translate([width+5,0,0])
    rotate([0,0,0])
    cube([width-wallthickness-0.4,width-edgelength+20,wallthickness-0.4]);
    
     //2nd edge
    translate([width+5,width,0])
    rotate([0,0,0])
    cube([width-wallthickness-0.4,width-edgelength+20,wallthickness-0.4]);