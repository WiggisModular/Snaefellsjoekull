include <panMonoChannel.scad>
include <mainNoFx.scad>
include <holes.scad>

/* [panMonoChannel] */
pmcWidth = 16; // [44:1:54]
pmcNumber = 10;

/* [mainNoFx] */
mnfWidth = 44; // [44:1:54]
mnfNumber = 1;
mnfPos = "R"; // [R:Right, L:Left]

/* [General] */
sizeInHP=42;
potHolesize = 9;
connHolesize = 7;
thickness = 2;
export = 0; // [0:False, 1:True]

/* [Here be dragons] */
panelHeight =128.5;
hp=5.08;


panelWidth = sizeInHP*hp;
spacing = (panelWidth-(pmcWidth*pmcNumber+mnfWidth*mnfNumber))/2;

if ( export == 1) {
   projection() panel();
} else {
    panel();
}

module panel(){
    echo(str("Panel width: ", panelWidth));
    difference() {
        cube(size=[panelWidth, panelHeight, thickness], center=false);
        // panMonoChannels
        if (mnfPos == "R") {
            translate([spacing,0, 0]) {
                panMonoChannels();
            }
            translate([pmcWidth*(pmcNumber)+3,0,0]){
                mainNoFxs();
            }
        } else {
            translate([spacing + mnfWidth*(mnfNumber), 0, 0]) {
                panMonoChannels();
            } 
            mainNoFxs();  
        }
        translate([7.5,3 , 0]) {
            slit(7,3.3);
        }
        translate([7.5,panelHeight-3, 0]) {
            slit(7,3.3);
        }
        translate([(sizeInHP-2)*hp,3,0]) {
            slit(7,3.3);
        }
        translate([(sizeInHP-2)*hp,panelHeight-3,0]) {
            slit(7,3.3);
        }
        translate([(sizeInHP/2)*hp,3,0]) {
            slit(7,3.3);
        }
        translate([(sizeInHP/2)*hp,panelHeight-3,0]) {
            slit(7,3.3);
        }
    }
}
