#! /bin/bash

openscad grid_array_cloner.scad -o grid_array_cloner.png --preview --imgsize=800,300 --camera=12,5,0,60,0,0,32 --projection=p --colorscheme=BeforeDawn
openscad radial_cloner.scad -o radial_cloner.png --preview --imgsize=800,300 --camera=12,5,0,60,0,0,32 --projection=p --colorscheme=BeforeDawn