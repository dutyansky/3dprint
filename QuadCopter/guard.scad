module guard() {
    difference() {
    cylinder(r1=3.4+.3, r2=3.4+.3, h=8, $fn=60);
      union() {
       cylinder(r1=3+.3, r2=3+.3, h=8, $fn=60);
       translate([3, 0, 4])   
         cube([2, 0.5, 10], center=true);
      }
     }
 }
 
 for (i = [-2:1:2])
 translate([i*15, 0, 0])
   guard();