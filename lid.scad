$fn = 128;

module top(size = 54, width = 240) {
    cube([240, size, 2]);
    
    // Branding
    translate([width/2, size/4, 0])
    linear_extrude(3)
    text("Carlmut Industries™", font="Liberation Sans:style=Bold Italic", halign="center");
    
    // Mounting mechanism
    translate([0, 0, -26])
    difference() {
        cube([width, size, 26]);
        cube([width, size - 2.5, 26]);
        translate([0, size - 2.5, 0])
        cube([25, 2.5, 26]);
    }
    
}

module front(d = 70, width = 240) {
    translate([0, 0, -d/2])
    rotate([0, 90, 0])
    difference() {
        cylinder(h=width, d=d);
        cylinder(h=width, d=d - 4);
        
        // remove parts
        translate([-d/2, 0, 0])
        cube([d, d, width]);
        translate([0, -d, 0])
        cube([d, d, width]);
    }
}

module cover() {
    top();
    translate([0, 0, 2])
    front();
}

cover();