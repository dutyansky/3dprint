screwR2 = 1.5+0.5-0.1-0.1;

TableThickness = 3;
module corner(height) {
 cylinder(r1=3, r2=3, h=height, $n=60);
}


module U_holder() {
 difference() {
   cylinder(r1=6/2, r2=6/2, h=5, $n=60);
   union() {
     cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
   }
 }
}

translate([0, 0, 9]) {
  difference() {
    union() {
      
      difference() {
        hull() {
          translate([-46/2, -40/2, 0])
            corner(TableThickness+5+7.5);

          translate([-46/2, +40/2, 0])
            corner(TableThickness+5+7.5);

          translate([+46/2, -40/2, 0])
            corner(TableThickness+5+7.5);

          translate([+46/2, +40/2, 0])
            corner(TableThickness+5+7.5);
        }
        
        hull() {
          translate([-46/2+1, -40/2+1, TableThickness])
            corner(TableThickness+5+7.5);

          translate([-46/2+1, +40/2-1, TableThickness])
            corner(TableThickness+5+7.5);

          translate([+46/2-1, -40/2+1, TableThickness])
            corner(TableThickness+5+7.5);

          translate([+46/2-1, +40/2-1, TableThickness])
            corner(TableThickness+5+7.5);
        }    
      }

      translate([+35/2, +25/2, TableThickness])
        U_holder();

      translate([-35/2, -25/2, TableThickness])
        U_holder();
    }
    // Holes for upper pillars
    union() {
      translate([+35/2, +25/2, 0])
        cylinder(r1=screwR2 , r2=screwR2, h=20, $n=60);        
      translate([-35/2, -25/2, 0])
        cylinder(r1=screwR2 , r2=screwR2, h=20, $n=60);        
      
    }
  }
}

difference() {
  cylinder(r1=4, r2=4, h=9, $n=60);
  cylinder(r1=1, r2=1, h=9, $n=60);
}