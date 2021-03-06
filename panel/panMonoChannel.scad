module panMonoChannels(){
    if (pmcNumber > 0 ) {
        for (i=[0:pmcNumber-1]) {
            translate([i*pmcWidth,0, 0]) {
                panMonoChannel();
            }
        }
    }
}

module panMonoChannel(){
    translate([pmcWidth/2,24,0]){
        hole(potHolesize);
        translate([0,40.64, 0]) {
            hole(potHolesize);
        }
        translate([0,31.47+40.64, 0]) {
            hole(connHolesize);
        }
    }
}
