d=8.2+.8;

d2=5.4;

r_in = d/2;
r_out = d/2 + 1;
difference() {
  union() {
    translate([0, 0, 12])
      cylinder(h=11, r1=r_out, r2=r_out, $fn=30);
    cylinder(h=12, r1=r_out*.6, r2=r_out, $fn=30);
  }
  union() {
    translate([0, 0, 0.8])
//      cylinder(h=24, r1=r_in, r2=r_in, $fn=30); 
    union() {
      translate([0, 0, 12])
        cylinder(h=11, r1=r_in, r2=r_in, $fn=30);
      cylinder(h=12, r1=r_in*.6, r2=r_in, $fn=30);
    }
    translate([0, 0, 24-5-1])
      rotate([90, 0, 0])
        cylinder(h=10, r1=d2/2, r2=d2/2, $fn=20);
    translate([0, -12, 24])
      rotate([90, 0, 0])
        cube([d2-0.3, 10, 20], center=true);
    translate([0, 0, -1])
      cylinder(h=5, r1=1.5, r2=1.5, $fn=30); 
  }
}

