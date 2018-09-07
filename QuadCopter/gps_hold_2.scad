screwR2 = 1.5+0.5-0.1-0.1-0.05;

TableThickness = 3;


difference() {
  cylinder(r1=4, r2=4, h=30, $n=60);
  union() {
   cylinder(r1=1, r2=1, h=30, $n=60);
   translate([0, 0, 6])   
     cylinder(r1=2.55, r2=2.55, h=30, $n=60);
  }
}
