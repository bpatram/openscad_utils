# OpenSCAD Utilities

This is yet another generic OpenSCAD library to help with creating meshes/objects/surfaces in OpenSCAD. Currently this library is mainly consumed by myself for some of my work in OpenSCAD. I've put some effort to generalize some of the modules/functions for reuse by anyone. Issues and PR are accepted!

## How to use

This project is broken down into a few individual files, all of which can be used independently. You can simply download the scad file(s) that you need for your project and include it via `use`. Below lists each file and the modules/functions it contains.

### Cloners

Most of the functionality in these functions mimics the cloner functionality found in Cinema4D.

#### Grid Array Cloner (grid_array_cloner)

Clones children objects in a 3D grid array. When using this module, you can access the `$i` or `$i_xyz` global variable which you can use to modify each clone object (see examples below).

##### Parameters

|Parameter name|Description|Default value|
|---|---|---|
|`count`|Number of clones per axis|`[1, 1, 1]`
|`size`|Distance between each clone|`[1, 1, 1]`
|`clones`|Either `"iterate"` or `"random"`. Controls how children will be cloned when using multiple children|`"iterate"`
|`seed`|Seed value used for random child selection (when using `"random"` clones mode)|`123456`

##### Examples

![grid cloner example](examples/grid_array_cloner.png)

```openscad
use <cloners.scad>
use <random.scad>

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
```

#### Radial Cloner

#### Linear Cloner

#### Vertex Cloner

### Random

Various functions to generate random numbers, vectors, and matrices.

#### Random Double (rand_double)

#### Random Color (rand_color)