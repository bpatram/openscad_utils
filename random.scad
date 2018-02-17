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

function rand_double(seed = 123456, low = 0, high = 1) = rands(low, high, 1, seed_value = seed)[0];

function rand_color(seed = 123456, constrain = [[0,0,0], [1,1,1]], alpha = 1) = [
    rand_double(low = constrain[0][0], high = constrain[1][0], seed = pow(seed + 1, 1)), 
    rand_double(low = constrain[0][1], high = constrain[1][1], seed = pow(seed + 2, 2)), 
    rand_double(low = constrain[0][2], high = constrain[1][2], seed = pow(seed + 3, 3)), 
    alpha
];