use <../cloners.scad>
use <../random.scad>

// example 1
radial_cloner(count = 6, r = 3, clones = "random") {
    color("Red") sphere(r = .5, center = true);
    color("Yellow") cube([1, 1, 1], center = true);
    color("Blue") cylinder(r = .5, h = 1, center = true);
}
translate([0, -2, 0]) linear_extrude(height = .1) text("example 1", size = .8);

// example 2
translate([10, 0, 0]) {
    radial_cloner(count = 12, r = 3, start = 450, end = 90, align = false) {    
        linear_extrude(height = .2) text(str($i + 1), size = .5);
    }
    translate([0, -2, 0]) linear_extrude(height = .1) text("example 2", size = .8);
}

// example 3
translate([20, 0, 0]) {
    peices = 30;
    scale([1.5, 1.5, 1]) translate([2.5, 2.5, 0]) radial_cloner(count = peices, r = 0) {    
        // requires 2016.XX+ to support rotate_extrudes's angle parameter
        color($i % 2 == 0 ? "Blue" : "Yellow") rotate_extrude(angle = (360/peices)) { 
            translate([2, 0, 0]) square(size = [.5, ($i % 2 * .4) + .6]); 
        }
    }
    translate([0, -2, 0]) linear_extrude(height = .1) text("example 3", size = .8);
}