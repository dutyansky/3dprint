d=2.5+1;
h=1.4;

module fin() {
  translate([8, -7.2, 0]) {
    translate([7, 0, 0]) {
      hull() {
        translate([0, 2.5, 0])
          cube([0.01,9.5, h]);
        translate([5, 0, 0])
          cube([0.01,16.5, h]);
        translate([2.5, 0, 0])
          cube([0.01, 8, h]);
      }
      translate([5, 0, 0]) {
        cube([32, 16.5, h]);
        translate([0, 16.5-1.5, h]) 
          cube([32, 1.5, 1]);
      }
    }
    translate([-2, 2.5, 0])
      cube([9,9.5, h]);
  }
}

difference() {
  union() {
    for (a = [0 : 90 : 360])
      rotate([0, 0, a])
        fin();
    translate([0, 0, h*0.5])
      cylinder(r1=8.5, r2=2, h=4, $n=60);
    cylinder(r1=8.5, r2=8.5, h=h*0.5, $n=60);
  }
  cylinder(r1=d/2, r2=d/2, h=10, $n=40, center=true);
}