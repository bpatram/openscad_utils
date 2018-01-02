use <../cloners.scad>
use <../random.scad>

$vpr = [57, 5, 9];
$vpt = [11, 5, 0];
$vpd = 24;

// example 1
grid_array_cloner(size = [2, 2, 2], count = [3, 3, 3], clones = "random") {
    color("Red") sphere(r = .5, center = true);
    color("Yellow") cube([1, 1, 1], center = true);
    color("Blue") cylinder(r = .5, h = 1, center = true);
}
translate([0, -2, 0]) linear_extrude(height = .1) text("example 1", size = .8);

// example 2
translate([10, 0, 0]) {
    grid_array_cloner(size = [2, 2, 2], count = [3, 3, 3]) {    
        color(rand_color($i)) sphere(r = .5, center = true);
        color(rand_color($i)) cube([1, 1, 1], center = true);
        color(rand_color($i)) cylinder(r = .5, h = 1, center = true);
    }
    translate([0, -2, 0]) linear_extrude(height = .1) text("example 2", size = .8);
}

// example 3
translate([20, 0, 0]) {
    grid_size = 3;
    grid_array_cloner(size = [2, 2, 2], count = [grid_size, grid_size, grid_size]) {    
        rotate([
            $i_xyz[0]/grid_size * -90, 
            $i_xyz[1]/grid_size * 90, 
            $i_xyz[2]/grid_size * -90
        ]) color([$i_xyz[0]/grid_size, .2, 0]) cylinder(r1 = .5, r2 = 0, h = 1, center = true);
    }
    translate([0, -2, 0]) linear_extrude(height = .1) text("example 3", size = .8);
}