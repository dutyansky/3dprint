R1 = 1;
sx = 30;
sy = 55-35+30;
x = sx-R1*2;
y = sy-R1*2;
h = 20; //16.5
h_cut = 16.5+1-0.1;

module part() {
difference() {
    translate([0, 0, sy/2]) {
        rotate([90, 0, 0]) {  
            difference () {
                hull() {    
                    translate([+x/2, +y/2, 0])
                      cylinder(h=h, r1=R1, r2=R1, center=true, $fn=40);
                    translate([+x/2, -y/2, 0])
                      cylinder(h=h, r1=R1, r2=R1, center=true, $fn=40);  
                    translate([-x/2, +y/2, 0])
                      cylinder(h=h, r1=R1, r2=R1, center=true, $fn=40);
                    translate([-x/2, -y/2, 0])
                      cylinder(h=h, r1=R1, r2=R1, center=true, $fn=40);  
                }
                 
                translate([0, 3, 0])
                  cube([40, sy, h_cut], center=true) ;
            }
        }
    }
    
    union() {
        hull() {
            cylinder(h=40, r1=5, r2=5, $fn=40, center=true);
        translate([20, 0, 0])
            cylinder(h=40, r1=5, r2=5, $fn=40, center=true);
        }
        
        
       translate([-30, 0, 0])
        difference() {
            cube([60, 10, 10], center=true);
            translate([30, 0, 0])
              cylinder(h=40, r1=7, r2=7, $fn=50, center=true);
        }
        
    }
}
}

part();