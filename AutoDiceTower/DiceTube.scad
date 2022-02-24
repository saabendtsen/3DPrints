diceL = 17;
diceCount = 3;
wallthickness = 2;



difference() {
//OuterCube
    cube([diceL+wallthickness*2,diceL+wallthickness*2,diceCount*diceL+wallthickness]);


//inderCut
    translate([wallthickness,wallthickness,-wallthickness])
    cube([diceL,diceL,diceCount*diceL+59]);
}