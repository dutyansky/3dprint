R = 3;
sx = 35+.5+.2;

ox = 35+12*2;
oy = 18;

m=4.8;

module base() {
  h = 12+3;
  x = ox - R*2;
  y = oy - R*2;
  difference() {
    translate([0, 0, h/2])
      hull() {    
        translate([+x/2, +y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);
        translate([+x/2, -y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);  
        translate([-x/2, +y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);
        translate([-x/2, -y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);  
      }
    union() {
      translate([-sx/2, -20/2, 1])
        cube([sx, 20, 20], center=false);
      translate([-sx/2-6, 0, 0])
        cylinder(h=40, r1=m/2, r2=m/2, $fn=40, center=true);
      translate([+sx/2+6, 0, 0])
        cylinder(h=40, r1=m/2, r2=m/2, $fn=40, center=true);
      translate([-sx/2-6, 0, -40+5])
        cylinder(h=40, r1=8.5/2, r2=8.5/2, $fn=6, center=false);
      translate([+sx/2+6, 0, -40+5])
        cylinder(h=40, r1=8.5/2, r2=8.5/2, $fn=6, center=false);
      cylinder(h=40, r1=6/2, r2=6/2, $fn=40, center=true);
    }
  }
}


module cap() {
  h = 3;
  x = ox - R*2;
  y = oy - R*2;
 translate([0, 0, -h]) 
  difference() {
    translate([0, 0, h/2])
     union() {
      hull() {    
        translate([+x/2, +y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);
        translate([+x/2, -y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);  
        translate([-x/2, +y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);
        translate([-x/2, -y/2, 0])
          cylinder(h=h, r1=R, r2=R, center=true, $fn=40);  
      }
      translate([-(sx-1)/2, -oy/2, -4-h/2+1])
        cube([sx-1, oy, 4], center=false);     
     }
    union() {
      translate([-sx/2-6, 0, 0])
        cylinder(h=40, r1=m/2, r2=m/2, $fn=40, center=true);
      translate([+sx/2+6, 0, 0])
        cylinder(h=40, r1=m/2, r2=m/2, $fn=40, center=true);
      translate([-sx/2-6, 0, 1.5])
        cylinder(h=40, r1=7.8/2, r2=7.8/2, $fn=40, center=false);
      translate([+sx/2+6, 0, 1.5])
        cylinder(h=40, r1=7.8/2, r2=7.8/2, $fn=40, center=false);
    }
  }
 
}

translate([0, 25, 0]) rotate([180,0,0])
cap();
base();