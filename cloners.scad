/**
  *  The MIT License (MIT)
  *
  *  OpenSCAD Utils v0.1.0 Copyright (c) 2018 Brandon Patram
  *
  *  Permission is hereby granted, free of charge, to any person obtaining a copy
  *  of this software and associated documentation files (the "Software"), to deal
  *  in the Software without restriction, including without limitation the rights
  *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  *  copies of the Software, and to permit persons to whom the Software is
  *  furnished to do so, subject to the following conditions:
  *
  *  The above copyright notice and this permission notice shall be included in all
  *  copies or substantial portions of the Software.
  *
  *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  *  SOFTWARE.
  */

CLONER_CLONE_ITERATE = "iterate";
CLONER_CLONE_RANDOM = "random";

// pick a random index number between 0 (first) and last ($children-1) of children
function random_child_index(max_value, seed) = floor(rands(0, max_value, 1, seed_value = seed)[0]);
// take a 0-indexed 1d index and get a 3d coord
function index_1d_3d(index, size) = [index % size[0], floor((index / size[0]) % size[1]), floor(index / (size[0] * size[1]))];
// take a 0-indexed 3d coord and get a 1d index from it
function index_3d_1d(index, size) = coord[0] + coord[1] * size[0] + index[2] * size[0] * size[1];

// we want to be 0 index based, so if we want 5 total then the range is [0,4]
// now it's possible we want 1, 1-1 = 0, so we have a max of 1
function range(stop, start = 0) = [start : max(stop-1, 1)];

module grid_array_cloner(count = [1, 1, 1], size = [1, 1, 1], clones = "iterate", seed = 123456) {
    max_child_index = max($children, 0);    

    function clone_position(index) = [size[0] * index[0], size[1] * index[1], size[2] * index[2]];
    
    for ($i = range(count[0] * count[1] * count[2])) {
        $i_xyz = index_1d_3d($i, count);

        translate(clone_position($i_xyz)) {
            if (clones == CLONER_CLONE_ITERATE) children($i % max_child_index);
            else if (clones == CLONER_CLONE_RANDOM) children(random_child_index(max_child_index, seed = seed + $i));
        }
    }
}

module radial_cloner(count = 1, r = 1, start = 0, end = 360, clones = "iterate", align = true, seed = 123456) {
    max_child_index = max($children, 0);    
    // calculate the degree per segment
    segment_degree = (end - start) / count;
    // find the angle given an index value
    function clone_angle(index) = (segment_degree * min(index, count-1)) + start;
    // calculate the position given an index
    function clone_position(index) = [cos(clone_angle(index)) * r, sin(clone_angle(index)) * r];
    
    for ($i = range(count)) {
        translate([r, r, 0]) translate(clone_position($i)) {
            if (align == true) {
                rotate([0, 0, clone_angle($i)]) {
                    if (clones == CLONER_CLONE_ITERATE) children($i % max_child_index);
                    else if (clones == CLONER_CLONE_RANDOM) children(random_child_index(max_child_index, seed = seed + $i));
                }
            } else {
                if (clones == CLONER_CLONE_ITERATE) children($i % max_child_index);
                else if (clones == CLONER_CLONE_RANDOM) children(random_child_index(max_child_index, seed = seed + $i));
            }
        }
    }
}

module linear_cloner(count = 1, size = [0, 0, 1], clones = "iterate", seed = 123456) {
    max_child_index = max($children, 0);  
    
    function clone_position(index) = [size[0] * index, size[1] * index, size[2] * index];
    
    for ($i = range(count)) {
        translate(clone_position($i)) {
            if (clones == CLONER_CLONE_ITERATE) children($i % max_child_index);
            else if (clones == CLONER_CLONE_RANDOM) children(random_child_index(max_child_index, seed = seed + $i));
        }
    }
}

module vertex_cloner(points = [], clones = "iterate", seed = 123456) {
    max_child_index = max($children, 0);  
    
    for ($i = range(len(points))) {
        translate(points[$i]) {
            if (clones == CLONER_CLONE_ITERATE) children($i % max_child_index);
            else if (clones == CLONER_CLONE_RANDOM) children(random_child_index(max_child_index, seed = seed + $i));
        }
    }
}