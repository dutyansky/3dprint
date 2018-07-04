difference() {
  hull() {
    translate([0, +40/2, 0])
      cylinder(r1=9, r2=9, h=0.9, $n=60);
    translate([0, -40/2, 0])
      cylinder(r1=9, r2=9, h=0.9, $n=60);
    translate([-10+18, -10/2, 0])
      cube([10,10,0.9]);
  }
  union() {
    translate([0, +40/2, 0])
      cylinder(r1=2, r2=2, h=0.9);
    translate([0, -40/2, 0])
      cylinder(r1=2, r2=2, h=0.9);   
  }
}
translate([-10+18, -10/2, 0])
  cube([10,10,4.5]);

difference() {
  translate([-8+18, -6.3/2, 4.5])
    cube([8,6.3,5.5]);
  translate([-8+18+4, -6.3/2+8, 4.5+4.])
    rotate([90, 0, 0])
      cylinder(r1=4.8/2, r2=4.8/2, h=10, $n=60); 
}