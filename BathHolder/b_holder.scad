R=10;
H=6;
sx=40;
sy=140;

w=1.7;

module holder_hole(x, y, r) {
  hull() {        
    translate([-(x/2-r), -(y/2-r), (30+H)/2-5])
      cylinder(h=0.1, r1=r, r2=r, center=true, $fn=10);  
    translate([-(x/2-r), +(y/2-r), (30+H)/2-5])
      cylinder(h=0.1, r1=r, r2=r, center=true, $fn=10);  
    translate([+(x/2-r), +(y/2-r), (30+H)/2-5])
      cylinder(h=0.1, r1=r, r2=r, center=true, $fn=10);  
    translate([+(x/2-r), -(y/2-r), (30+H)/2-5])
      cylinder(h=0.1, r1=r, r2=r, center=true, $fn=10);  

    translate([-(x/2-r), -(y/2-r), (30+H)/2])
      cylinder(h=0.1, r1=r+3, r2=r+3, center=true, $fn=10);  
    translate([-(x/2-r), +(y/2-r), (30+H)/2])
      cylinder(h=0.1, r1=r+3, r2=r+3, center=true, $fn=10);  
    translate([+(x/2-r), +(y/2-r), (30+H)/2])
      cylinder(h=0.1, r1=r+3, r2=r+3, center=true, $fn=10);  
    translate([+(x/2-r), -(y/2-r), (30+H)/2])
      cylinder(h=0.1, r1=r+3, r2=r+3, center=true, $fn=10);  

  }

  hull() {        
    translate([-(x/2-r), -(y/2-r), 0])
      cylinder(h=30+H, r1=r, r2=r, center=true, $fn=10);  
    translate([-(x/2-r), +(y/2-r), 0])
      cylinder(h=30+H, r1=r, r2=r, center=true, $fn=10);  
    translate([+(x/2-r), +(y/2-r), 0])
      cylinder(h=30+H, r1=r, r2=r, center=true, $fn=10);  
    translate([+(x/2-r), -(y/2-r), 0])
      cylinder(h=30+H, r1=r, r2=r, center=true, $fn=10);  
    translate([0, 0, -23])
      cylinder(h=0.2, r1=3, r2=3, center=true, $fn=10);  
  }
//  cylinder(h=80, r1=3, r2=3, center=true, $fn=10);  
}

module holder_hull(x, y, r) {
  x = x + w;
  y = y + w;
  r = r + w/2;
  hull() {
    translate([-(x/2-r), -(y/2-r), 0])
      cylinder(h=35, r1=r, r2=r, center=true, $fn=10);  
    translate([-(x/2-r), +(y/2-r), 0])
      cylinder(h=35, r1=r, r2=r, center=true, $fn=10);  
    translate([+(x/2-r), +(y/2-r), 0])
      cylinder(h=35, r1=r, r2=r, center=true, $fn=10);  
    translate([+(x/2-r), -(y/2-r), 0])
      cylinder(h=35, r1=r, r2=r, center=true, $fn=10);  
    
  }
}


module holder() {
  difference() {
    union() {
      hull() {
        translate([+sx/2, +(sy-R*2)/2, 0])
          cylinder(h=H, r1=R, r2=R, center=true, $fn=40);
        translate([+sx/2, -(sy-R*2)/2, 0])
          cylinder(h=H, r1=R, r2=R, center=true, $fn=40);  
        translate([-sx/2, +(sy-R*2)/2, 0])
          cylinder(h=H, r1=R, r2=R, center=true, $fn=40);
        translate([-sx/2, -(sy-R*2)/2, 0])
          cylinder(h=H, r1=R, r2=R, center=true, $fn=40);  
      }
      
      translate([-sx/2+10, 0, -4])
        cube([16+6, 12+6, H], center=true);  
      
      
      translate([-17, -58, -30/2-H/2])
        holder_hull(12, 14.5, 2);
      translate([-17, -58+25, -30/2-H/2])
        holder_hull(12, 14.5, 2);

      translate([-17, -70+100, -30/2-H/2])
        holder_hull(14, 16.5, 2);
      translate([-17, -70+100+26, -30/2-H/2])
        holder_hull(14, 16.5, 2);
      
      translate([-17+20, -58, -30/2-H/2])
        holder_hull(8.5, 14, 2);
      

      translate([-17+30, -70+100, -30/2-H/2])
        holder_hull(17.5, 15, 2);
      translate([-17+30, -70+100+25, -30/2-H/2])
        holder_hull(10, 19, 2);    
    }
    
    union() {
      translate([-sx/2+10, 0, 0])
        cylinder(h=H+20, r1=7/2, r2=7/2, center=true, $fn=20);  
      translate([-sx/2+10, 0, H-4])
        cube([16, 12, H], center=true);  
      
      translate([-17, -58, -(30+H)/2+H/2+2])
        holder_hole(12, 14.5, 2);    
      translate([-17, -58+25, -(30+H)/2+H/2+2])
        holder_hole(12, 14.5, 2);    

      translate([-17, -70+100, -(30+H)/2+H/2+2])
        holder_hole(14, 16.5, 2);    
      translate([-17, -70+100+26, -(30+H)/2+H/2+2])
        holder_hole(14, 16.5, 2);    
      
      translate([-17+20, -58, -(30+H)/2+H/2+2])
        holder_hole(8.5, 14, 2);

      translate([-17+30, -70+100, -(30+H)/2+H/2+2])
        holder_hole(17.5, 15, 2);    
      translate([-17+30, -70+100+25, -(30+H)/2+H/2+2])
        holder_hole(10, 19, 2);    

      translate([-17+35, -58, 0])
        cylinder(h=H+5, r1=7.8/2, r2=7.8/2, center=true, $fn=20);  

      translate([-17+35, -58+15, 0])
        cylinder(h=H+5, r1=7.8/2, r2=7.8/2, center=true, $fn=20);  

      translate([-17+35, -58+15*2, 0])
        cylinder(h=H+5, r1=7.8/2, r2=7.8/2, center=true, $fn=20);  

      translate([-17+35, -58+15*3, 0])
        cylinder(h=H+5, r1=7.8/2, r2=7.8/2, center=true, $fn=20);  

      translate([-17+35, -58+15*4, 0])
        cylinder(h=H+5, r1=7.8/2, r2=7.8/2, center=true, $fn=20);  
     
    }
  }
}


translate([0, 0, H/2])
  rotate([0, 180, 0]) {  
    holder();
  }