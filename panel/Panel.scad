/* [panMonoChannel] */
pmcWidth = 16;
pmcNumber = 10;

/* [mainNoFx] */
mnfWidth = 30;
mnfNumber = 1;
mnfPos = "R"; // [R:Right, L:Left]

/* [General] */
panelOuterHeight =128.5;
hp=5.08;
potHolesize = 9;
connHolesize = 7;
thickness = 2;
spacing = 1;


panel();

module panel(){
    w = pmcWidth*(pmcNumber+1) + mnfWidth*(mnfNumber+1) + spacing*2;
    echo(str("Panel width: ", w));
    difference() {
        cube(size=[w,panelOuterHeight, thickness], center=false);
        // panMonoChannels
        if (mnfPos == "R") {
            translate([pmcWidth/2+spacing, 24, 0]) {
                panMonoChannels();
            }
        } else {
            translate([pmcWidth/2+spacing+ mnfWidth*(mnfNumber+1), 24, 0]) {
                panMonoChannels();
            }           
        }
    }
}

module panMonoChannels(){
    for (i=[0:pmcNumber]) {
        translate([i*pmcWidth,0, 0]) {
            panMonoChannel();
        }
    }
}

module panMonoChannel(){
    hole(potHolesize);
    translate([0,40.64, 0]) {
        hole(potHolesize);
    }
    translate([0,31.47+40.64, 0]) {
        hole(connHolesize);
    }
}


module hole(diameter){
    cylinder(h=thickness*3, d=diameter,center=true,$fn=180);
}