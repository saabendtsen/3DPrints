cube =17;
wall = 2;
length =cube*12;
d = 31;


difference(){
union(){
translate([0,0,length/2])
cube([cube+wall,cube+wall,length],center =true);
cylinder(52,d=d,$fn=128);
}
cube([cube,cube,length*4],center=true);
}