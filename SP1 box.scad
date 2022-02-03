
box(25,40,160,220);

lidthickness = 3;
wallthickness = 3+lidthickness;





module form(radius,height,width,length){
hull(){
    //First cyleinder
translate([radius,radius,0])
    cylinder(r=radius,h=height,$fn=100);
    
//2nd x
translate([width-radius,radius,0])
    cylinder(r=radius,h=height,$fn=100);
//2nd y  
translate([radius,length-radius,0])
    cylinder(r=radius,h=height,$fn=100);  
    
//XY
translate([width-radius,length-radius,0])
    cylinder(r=radius,h=height,$fn=100);  
}
};



module box(cornor,height,width,length){    
difference(){
    union(){
        //OuterForm
        form(cornor,height,width,length);
        //inderForm
        translate([lidthickness,lidthickness,0])
        form(cornor,height+3,width-lidthickness*2, length-lidthickness*2);
}
    
//Cutout
translate([wallthickness,wallthickness,wallthickness])
    form(cornor,height+wallthickness,width-wallthickness*2,length-wallthickness*2); 
   
}
    
//Lid
difference(){    
translate([width+10,0,0])
    form(cornor,wallthickness+5,width,length);
    
translate([width+10+lidthickness,lidthickness,wallthickness])
    form(cornor,wallthickness+5,width-lidthickness*2,length-lidthickness*2);
    
}
};
