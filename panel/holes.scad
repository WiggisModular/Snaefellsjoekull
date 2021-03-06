module hole(diameter){
    cylinder(h=thickness*3, d=diameter,center=true,$fn=180);
}

module slit(length, width){
        cube([length-width,width,thickness*3],center=true);
        translate([length/2-width/2,0, 0]) {
            cylinder(d=width,h=thickness*3,center=true,$fn=180);
        }
        translate([-length/2+width/2,0, 0]) {
            cylinder(d=width,h=thickness*3,center=true,$fn=180);
        }
        
}