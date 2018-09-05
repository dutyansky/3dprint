screwR2 = 1.5+0.5-0.1-0.1-0.05;

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

module gps_part() {
  difference() {
    union() {      
      difference() {          
        hull() {
          translate([-42/2, -34/2, 0])
            corner(TableThickness+5+7.5);

          translate([-42/2, +34/2, 0])
            corner(TableThickness+5+7.5);

          translate([+42/2, -34/2, 0])
            corner(TableThickness+5+7.5);

          translate([+42/2, +34/2, 0])
            corner(TableThickness+5+7.5);
        }
        
        // Inner part to subtract
        union() { 
            hull() {
              translate([-42/2+1, -34/2+1, TableThickness])
                corner(TableThickness+5+7.5);

              translate([-42/2+1, +34/2-1, TableThickness])
                corner(TableThickness+5+7.5);

              translate([+42/2-1, -34/2+1, TableThickness])
                corner(TableThickness+5+7.5);

              translate([+42/2-1, +34/2-1, TableThickness])
                corner(TableThickness+5+7.5);                        
            }    
            translate([20, -2, TableThickness])
                cube([10, 4, 5+7.5+2]);
        }
      }
      
      // GPS holding posts
      translate([+35/2, +25/2, TableThickness])
        U_holder();

      translate([-35/2, -25/2, TableThickness])
        U_holder();     

    }
    // Holes for GPS holding posts
    union() {
      translate([+35/2, +25/2, 0])
        cylinder(r1=screwR2 , r2=screwR2, h=20, $n=60);        
      translate([-35/2, -25/2, 0])
        cylinder(r1=screwR2 , r2=screwR2, h=20, $n=60);              
    }
  }  
}


module mag_part() {
  difference() {
    union() {  
      // Magnetometer part
      difference() {
        hull() {
          translate([-17/2, -22/2, 0])
            corner(TableThickness+4+5);

          translate([-17/2, +22/2, 0])
            corner(TableThickness+4+5);

          translate([+17/2, -22/2, 0])
            corner(TableThickness+4+5);

          translate([+17/2, +22/2, 0])
            corner(TableThickness+4+5);
        }
            
        hull() {
          translate([-17/2+1, -22/2+1, TableThickness])
            corner(TableThickness+4+5);

          translate([-17/2+1, +22/2-1, TableThickness])
            corner(TableThickness+4+5);

          translate([+17/2-1, -22/2+1, TableThickness])
            corner(TableThickness+4+5);

          translate([+17/2-1, +22/2-1, TableThickness])
            corner(TableThickness+4+5);
        }       
     }
     // Magnetometer holding posts
     translate([+8.5/2, +7, TableThickness])
      U_holder();

     translate([-8.5/2, +7, TableThickness])
      U_holder();

     translate([0, -1, TableThickness])
      U_holder();
     
 }
  union() {
     translate([+8.5/2, +7, 0])
        cylinder(r1=screwR2 , r2=screwR2, h=20, $n=60);              
     translate([-8.5/2, +7, 0])
        cylinder(r1=screwR2 , r2=screwR2, h=20, $n=60);      
          
     translate([0, -7, 0])
       cube([17, 6, 10], center=true);     

  }
 }
}


translate([0, 0, 30]) {
   gps_part();
   translate([34.52, -15, 0]) 
      mag_part();
}

difference() {
  cylinder(r1=4, r2=4, h=30, $n=60);
  cylinder(r1=1, r2=1, h=30, $n=60);
}
