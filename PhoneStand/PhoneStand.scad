module stand() {
    union() {
        difference() {
            intersection() {
              translate([0, 0, 25])
                rotate([80, 0, 0])
                    difference() {
                     cube([30, 60, 18], center=true);
                     translate([0, 9, 0])   
                       cube([30, 60, 12], center=true);  
                    }
              translate([0, 0, 50])
                cube([100, 100, 100], center=true);
            }
            translate([0, -50, 62])
              cube([100, 100, 100], center=true);
        }    
        translate([0, 33, 2]) 
          difference() {
            cube([30, 60, 4], center=true);          
            translate([-5, -2, 0])   
              cube([30, 55, 4], center=true);
          }
    }
}



translate([0, 0, 15]) rotate([0, 90, 0])
  stand();