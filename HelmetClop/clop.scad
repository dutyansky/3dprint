R1=1.5;
R2=1.2;

RR1=0.7;
RR2=0.7;


hull() {
    cylinder(h=1.4, r1=9.9/2, r2=9.5/2, $fn=40);
    translate([0, -(23.7/2-R1), 0])
      cylinder(h=1.4, r1=R1, r2=R2, $fn=20);
    translate([0, +(23.7/2-R1), 0])
      cylinder(h=1.4, r1=R1, r2=R2, $fn=20);
}    

translate([0, 0, 1.4])
    hull() {
        cylinder(h=2.3, r1=6.7/2, r2=6.7/2, $fn=40);
        translate([0, -(17.8/2-RR1), 0])
          cylinder(h=2.3, r1=RR1, r2=RR2, $fn=20);
        translate([0, +(17.8/2-RR1), 0])
          cylinder(h=2.3, r1=RR1, r2=RR2, $fn=20);
    }    


    
translate([0, 0, 3.7]) {
 difference() {
  union() {   
    cylinder(h=4.7, r1=6.5/2, r2=6.5/2, $fn=40);
    translate([0, 0, 2.5])
      cylinder(h=0.5, r1=6.8/2, r2=6.8/2, $fn=40);
  }
  cube([10, 0.7, 10], center=true);
  cylinder(h=5, r1=4/2, r2=4/2, $fn=40);  
  }
}