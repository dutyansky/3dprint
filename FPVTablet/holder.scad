t_th = 16;
w_th = 3;
base=173;


module frame() {
  translate([70/2, 0, 0]) {
    difference() {
      cube([70, t_th+w_th*2, base], center=true);
      union() {
        translate([w_th, 0, w_th])
          cube([70, t_th, base], center=true);  // "Tablet body"
        translate([14, 0, 16])
          cube([70, t_th+w_th*2+2, base], center=true); // Inner part of frame
        // Corners
        translate([-12, 0, +base/2+20-20])
          rotate([0, 45, 0])
            cube([20, t_th+w_th*2+2, 20], center=true);
        translate([70/2+5, 0, -base/2+20])
          rotate([0, 45, 0])
            cube([20, t_th+w_th*2+2, 20], center=true);
      }
    }
  }
}

frame();
rotate([0, 0, 15])
  translate([-55/2, -t_th/2+1.3, 125-base/2]) 
    cube([55, 8, 80.5], center=true);
translate([-2/2-10.5, 2, 125-base/2])   
    cube([2, 16, 80.5], center=true);
