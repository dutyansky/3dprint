module manif1(d) {
  union() {
    hull() {
      translate([0, 0, 0.25+300])
        cube([300-d*2, 150-d*2, 0.5], center=true);
      translate([0, 0, 0.25+50])
        cube([300*.35-d*2, 150*.6-d*2, 0.5], center=true);
    }

    hull() {
      translate([0, 0, 0.25+50])
        cube([300*.35-d*2, 150*.6-d*2, 0.5], center=true);
      translate([0, 0, 0.25])
        cylinder(r1=40-d, r2=40-d,$fn=60, h=0.5, center=true);     
    }

    hull() {
      translate([0, 0, 0.25])
        cylinder(r1=40-d, r2=40-d,$fn=60, h=0.5, center=true);     

      translate([0, 0, 0.25-100])
        cylinder(r1=40-d, r2=40-d,$fn=60, h=0.5, center=true);     
    }
  }
}

translate([0, 0, 139/2+5])
  rotate([0, 180, 0])
    intersection() {
      difference() {
        union() {
          manif1(0);
          translate([40, 0, -60]) {
            hull() {
              translate([0, 0, 20])
                cube([0.1, 5, 0.1], center=true);
              rotate([0, 90, 0])
                cylinder(r1=9, r2=9, $fn=60, h=10, center=true);          
            }
          }
        }
        union() { 
          manif1(1.2);
          translate([40, 0, -60]) 
            rotate([0, 90, 0])
              cylinder(r1=14.2/2, r2=14.2/2, $fn=60, h=12, center=true);
        }        
      }      
      translate([0, 0, 5-25/2])
        cube([1000, 1000, 139+25], center=true);
    }
