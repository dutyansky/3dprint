t=0.5;


difference() {
  cylinder(r1=15, r2=15, h=50, $fn=80);
  cylinder(r1=15-t, r2=15-t, h=60, $fn=80); 
}
cylinder(r1=15, r2=15, h=0.4, $fn=80);