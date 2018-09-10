module roundcube(x, y, z, r) {
  hull() {
    translate([-(x/2-r), -(y/2-r), -z/2])
      cylinder(r1=r, r2=r, h=z, $fn=60);
    translate([-(x/2-r), +(y/2-r), -z/2])
      cylinder(r1=r, r2=r, h=z, $fn=60);
    translate([+(x/2-r), -(y/2-r), -z/2])
      cylinder(r1=r, r2=r, h=z, $fn=60);
    translate([+(x/2-r), +(y/2-r), -z/2])
      cylinder(r1=r, r2=r, h=z, $fn=60);
  }
}

module roundcube2(x, y, z, R1, R2) {
  hull() {
    translate([-(x/2-R2), -(y/2-R2), -z/2])
      cylinder(r1=R2, r2=R1, h=z, $fn=60);
    translate([-(x/2-R2), +(y/2-R2), -z/2])
      cylinder(r1=R2, r2=R1, h=z, $fn=60);
    translate([+(x/2-R2), -(y/2-R2), -z/2])
      cylinder(r1=R2, r2=R1, h=z, $fn=60);
    translate([+(x/2-R2), +(y/2-R2), -z/2])
      cylinder(r1=R2, r2=R1, h=z, $fn=60);
  }
}


module stand() {
    union() {
        difference() {
            intersection() {
              translate([0, 0, 25])
                rotate([80, 0, 0])
                    difference() {
                     translate([0, -20, 0])   
                       roundcube(80, 60, 18, 6);
                     translate([0, 9, 0])   
//                       cube([80, 60, 12], center=true);  
                         roundcube(80, 60, 12, 8.5);  
                    }
              translate([0, 0, 50])
                cube([100, 100, 100], center=true);
            }
            translate([0, -50, 62])
              cube([100, 100, 100], center=true);
        }    
        translate([0, 26, 2]) 
          difference() {
            roundcube2(80, 50, 5, 6, 8);          
            translate([-0, -2, 0])   
              roundcube(60, 40, 5, 6);
          }
    }
}



//translate([0, 0, 15]) rotate([0, 90, 0])
  stand();

