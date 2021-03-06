module mainNoFx() {
    translate([10, 69, 0]) {
        hole(potHolesize);
    }
    translate([10,69+26.42,0]){
        hole(connHolesize);
    }
    translate([10+25.4 , 69, 0]) {
        hole(potHolesize);
    }
    translate([10+25.4,69+26.42,0]){
        hole(connHolesize);
    }
}

module mainNoFxs(){
    if (mnfNumber > 0 ) {
        for (i=[0:mnfNumber-1]) {
            translate([i*mnfWidth,0, 0]) {
                mainNoFx();
            }
        }
    }
}
