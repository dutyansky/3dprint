Width=76;
Thickness=14;
Length=190;
Gap=1.5+0.35;

module holder() {
  difference() {
    union() {
      hull() {
        translate([-Length/2+4, -Width/2+4, 0])
          cylinder(r1=4, r2=4, h=Thickness, center=true, $fn=30);
        translate([-Length/2+4, +Width/2-4, (Thickness-8)/2])
          cylinder(r1=4, r2=4, h=8, center=true, $fn=30);
        translate([+Length/2-4,-Width/2+4, 0])
          cylinder(r1=4, r2=4, h=Thickness, center=true, $fn=30);
        translate([+Length/2-4, +Width/2-4, (Thickness-8)/2])
          cylinder(r1=4, r2=4, h=8, center=true, $fn=30);
      }
      
      // Bridge  
      translate([0, -Width/2-(Gap+5)/2+4, Thickness/2-4/2])
        cube([Length, (Gap+5), 4], center=true);
      
      // Latching part
      translate([0, -Width/2-5/2-(Gap), -14/2+Thickness/2])
        cube([Length, 5, 14], center=true);  

      translate([0, -Width/2+4/2, -14/2+Thickness/2])
        cube([Length, 4, 14], center=true);  
          
      for (i = [0 : 1 : 5])
        translate([-Length/2+35+i*28, Width/2+16/2-1, Thickness/2-6/2])
          cube([6, 16+13, 6], center=true);
      
    }
    // Holes
    union() {
      for (i = [0 : 1 : 4])
        translate([-Length/2+40+i*35, -Width/2+15, 0])
          cylinder(r1=(11-i*0.7)/2, r2=(11-i*0.7)/2, h=Thickness+1, center=true);
      for (i = [0 : 1 : 4])
        translate([-Length/2+40+i*35, Width/2-15, 0])
          cylinder(r1=(8-i*0.6)/2, r2=(8-i*0.6)/2, h=Thickness+1, center=true);      
      translate([-Length/2+13, -17, 0])
        cube([13, 26, Thickness+1], center=true);
      translate([-Length/2+15, -23+35, 0])
        cube([20.5, 8, Thickness+1], center=true);
      translate([-Length/2+15, -23+35+19, 0])
        cube([20.5, 8, Thickness+1], center=true);
      
//      for (i = [0 : 1 : 4])
//        translate([-Length/2+23+i*35, -Width/2+36, 0])
//          cube([25, 8, Thickness+1], center=true);
      for (i = [1 : 1 : 4])
        translate([-Length/2+23+i*35, -Width/2+57, 0])
          cube([14, 25, Thickness+1], center=true);
//      for (i = [1 : 1 : 4])
//        translate([-Length/2+23+i*35, +Width/2-57, 0])
//          cube([8, 20, Thickness+1], center=true);


      translate([-Length/2+28, -Width/2-16+6, -20])
        cube([55, 16, Thickness+20], center=false);

      translate([Length/2-20-67, -Width/2-16+6, -20])
        cube([62, 16, Thickness+20], center=false);

      
    }
  }
}

intersection() {
translate([0, 0, Thickness/2])  rotate([0, 180, 0]) 
    holder();
//  cube([300, 300, 0.6*2], center=true);
//translate([0, -39, 0])  { cube([10, 10, 100], center=true); }
}