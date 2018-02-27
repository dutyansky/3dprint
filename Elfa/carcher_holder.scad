w=3.2-0.2;//3.2-0.1;
h=18-1-1;
d=32.5;
//2.73


// Single "tooth" hook of Elfa attachment
module tooth() {
  difference() {
    cube([w, 11, h]);
    union() {
      cube([w, 2.5+0.5, 6]);  // 2.5+1
      translate([0, 20-2, 4])
        rotate([55, 0, 0])
          cube([w, 40, 40]);
    }
  }
}


// Complete attachment, with 4 teeth
module connector() {
  translate([-24/2, 0, 0]) {
  cube([24, 8, 51]);
  translate([(24-w-10.5)/2, 8, 0])
    tooth();
  translate([(24-w-10.5)/2+10.5, 8, 0])
    tooth();
  translate([(24-w-10.5)/2, 8, d])
    tooth();
  translate([(24-w-10.5)/2+10.5, 8, d])
    tooth();
  }
}

softenR = 2;
DiaV = 75+2*softenR ;



connector();
translate([0, 0, softenR-0.1])
minkowski() {
  difference() {
    union() {
      translate([-24/2, 0, 0]) cube([24, 4, 51-softenR]);
      
      hull() {
        translate([-90/2, 5, 0]) cube([90, 1, 30]);
        translate([-120/2, -38-5+2, 0]) cube([120, 1, 12]);
      }
      translate([0, -37+2, 0])
        difference() {
          // Main body
          translate([-180/2, -72-30, 0]) cube([180, 72+30, 12]);
          union() {
            translate([-18, -76-10-30, 0]) cube([75+softenR*2, 76+30, 20]);  
            translate([-80, -76-10-30, 0]) cube([50+softenR*2, 76+30, 20]);  
            translate([-100, -76-10-30-70, 0]) cube([50+softenR*2, 76+30, 20]);  
            // Cut for power adapter
            translate([+65, -70-30, 0]) 
              rotate([0, 20, 0])
                cube([15+softenR*2, 37+softenR*2, 50]);  
          }
        }
    }
    union() {
      // Cut for additional blade
      translate([-(76+softenR*2)/2, -30-7-5+3, 0]) cube([76+softenR*2, 30+softenR*2, 50]);       
      // Upper surface
      translate([-100, -75-15, 105+10])
        rotate([0, 90, 0])
          cylinder(r1=110, r2=110, $fn=60, h=200);     
      translate([-100, -55-3-2, 25-8+5+1])
        rotate([0, 90, 0])
          cylinder(r1=17+1, r2=17+1, $fn=60, h=200);     
    }
  }
  sphere(r=softenR, center=true);
}

      //translate([-80, -75, 110])
      //  rotate([0, 90, 0])
        //  cylinder(r1=100, r2=100, $fn=60, h=200);

/*
translate([-160/2, -10, 0])
  cube([160, 10, 15]);
translate([-160/2, -60, 0])
  cube([15, 60, 15]);
translate([-15/2, -60, 0])
  cube([15, 60, 15]);
translate([160/2-15, -60, 0])
  cube([15, 60, 15]);
*/
/*
translate([0, -(DiaV/2+15)+7-softenR, softenR]) {
  minkowski() {
    difference() {
      cylinder(h=15, r1=DiaV/2+15, r2=DiaV/2+15, center=false, $fn=60);
      union() {
        cylinder(h=15, r1=DiaV/2, r2=DiaV/2, center=false, $fn=60);
        translate([-200/2, -(100+15), 0])
          cube([200, 100, 30], center=false);
      }
    }
    sphere(r=softenR, center=true);
  }
}
*/
