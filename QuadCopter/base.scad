LowClearance=10+4;

L_holderD = 6.5+.6;
L_holderD_in = 5.1;

screwR = 1.5+0.3;
screwR2 = 1.5+0.5-0.1-0.1;

TableThickness = 2.;

module corner(height) {
 cylinder(r1=L_holderD/2, r2=L_holderD/2, h=height, $n=60);
}
   
    
module L_holder() {
 difference() {
   cylinder(r1=L_holderD/2, r2=L_holderD/2, h=LowClearance, $n=60);
   union() {
     cylinder(r1=screwR , r2=screwR, h=LowClearance, $n=60);
     translate([0, 0, -LowClearance+3.5]) 
       cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=LowClearance, $n=60);
     translate([0, 0, +3.5+1]) 
       cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=LowClearance, $n=60);
   }
 }
}


module U_holder() {
 difference() {
   cylinder(r1=6/2, r2=6/2, h=2.5, $n=60);
   union() {
     cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
   }
 }
}

module base() {

  // Main table
  translate([0, 0, LowClearance]) {
    difference() {  
      union() {
        hull() {
          translate([-55/2, -44/2, 0])
            corner(TableThickness);

          translate([-55/2, +44/2, 0])
            corner(TableThickness);

          translate([+55/2, -44/2, 0])
            corner(TableThickness);

          translate([+55/2, +44/2, 0])
            corner(TableThickness);
        }
        hull() {
          translate([-37/2, -100/2, 0])
            corner(TableThickness);

          translate([-37/2, +100/2, 0])
            corner(TableThickness);

          translate([+37/2, -100/2, 0])
            corner(TableThickness);

          translate([+37/2, +100/2, 0])
            corner(TableThickness);
        }    
      }
      union() { 
        // Screw holes for lower pillars
        translate([-55/2, -44/2, 0]) {
          cylinder(r1=screwR , r2=screwR , h=10, $n=60);    
          cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=10, $n=60);
        }

        translate([-55/2, +44/2, 0]) {
          cylinder(r1=screwR , r2=screwR , h=10, $n=60);
          cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=10, $n=60);
        }         

        translate([+55/2, -44/2, 0]) {
          cylinder(r1=screwR , r2=screwR , h=10, $n=60);
          cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=10, $n=60);
        }

        translate([+55/2, +44/2, 0]) {
          cylinder(r1=screwR , r2=screwR , h=10, $n=60);
          cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=10, $n=60);
        }
        
        // Screw holes for upper pillars
        translate([4, 35, 0]) {
          translate([-30/2, -30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);        
          translate([-30/2, +30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
          translate([+30/2, -30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
          translate([+30/2, +30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
        }
        translate([0, -15, 0]) {
          translate([-30/2, -30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
          translate([-30/2, +30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
          translate([+30/2, -30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
          translate([+30/2, +30/2, 0])
            cylinder(r1=screwR2 , r2=screwR2, h=10, $n=60);
        }
                
        // Cut in the table
        cube([8, 70, 20], center=true);
      }
    }
    // Upper pillars
    translate([4, 35, 0]) {
      translate([-30/2, -30/2, TableThickness-0.1])
        U_holder();
      translate([-30/2, +30/2, TableThickness-0.1])
        U_holder();
      translate([+30/2, -30/2, TableThickness-0.1])
        U_holder();
      translate([+30/2, +30/2, TableThickness-0.1])
        U_holder();
    }
    translate([0, -15, 0]) {
      translate([-30/2, -30/2, TableThickness-0.1])
        U_holder();
      translate([-30/2, +30/2, TableThickness-0.1])
        U_holder();
      translate([+30/2, -30/2, TableThickness-0.1])
        U_holder();
      translate([+30/2, +30/2, TableThickness-0.1])
        U_holder();
    }
  }
  
  // Upper table
  difference() {
    union() {
      translate([0, -44/2+20/2-44, 10+22])
        union() {
          hull() {
            translate([-20/2, -20/2, 0])
              corner(3);
            translate([-20/2, +20/2, 0])
              corner(3);
            translate([+20/2, -20/2, 0])
              corner(3);
            translate([+20/2, +20/2, 0])
              corner(3);       
          }
          translate([20/2+2, 20/2-10/2+2, -(32-LowClearance)/2+1]) 
            cube([3, 9, 32-LowClearance], center=true);      
          translate([-(20/2+2), 20/2-10/2+2, -(32-LowClearance)/2+1]) 
            cube([3, 9, 32-LowClearance], center=true);      
        }
        
      // Mounting bracket for the video TX
      translate([0, -44/2+20/2-44-20, 10+22+2])
        union() {
          hull() {
            translate([-14/2, -20/2, 0])
              corner(3);
            translate([-14/2, +20/2, 0])
              corner(3);
            translate([+14/2, -20/2, 0])
              corner(3);
            translate([+14/2, +20/2, 0])
              corner(3);       
          }
        }
      translate([0, -44/2+20/2-44-20-8.5-1, 10+22+3])
        union() {
          hull() {
            translate([-14/2, -(14-L_holderD)/2, 0])
              corner(19);
            translate([-14/2, +(14-L_holderD)/2, 0])
              corner(19);
            translate([+14/2, -(14-L_holderD)/2, 0])
              corner(19);
            translate([+14/2, +(14-L_holderD)/2, 0])
              corner(19);       
          }
        }
        
    }

    union() { // Subtractive part of Video TX bracket
      translate([0, -44/2+20/2-44-20-8.5-10+8-1, 10+22+3-3])
        union() {
          hull() {
            translate([-34/2, -(12-L_holderD)/2, 0])
              corner(19);
            translate([-34/2, +(12-L_holderD)/2, 0])
              corner(19);
            translate([+34/2, -(12-L_holderD)/2, 0])
              corner(19);
            translate([+34/2, +(12-L_holderD)/2, 0])
              corner(19);       
          }
        }
      
      translate([0, -44/2-44, 0]){
        cylinder(r1=screwR , r2=screwR , h=100, $n=60);
        translate([0, 0, 10+22+1])
          cylinder(r1=L_holderD_in/2, r2=L_holderD_in/2, h=10, $n=60);     
      }
      // Hole for video TX antenna
      translate([0, -44/2+20/2-44-20-8.5-10+8, 0]){
        cylinder(r1=7/2 , r2=7/2, h=100, $n=60);
      }
    }
  }      
 

// Lower pillars
  translate([-55/2, -44/2, 0])
    L_holder();

  translate([-55/2, +44/2, 0])
    L_holder();

  translate([+55/2, -44/2, 0])
    L_holder();

  translate([+55/2, +44/2, 0])
    L_holder();
    
    
}

base();
//  L_holder();

//translate([0, 10, 0])
//  U_holder();
