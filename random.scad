function rand_double(seed = 123456, low = 0, high = 1) = rands(low, high, 1, seed_value = seed)[0];

function rand_color(seed = 123456, constrain = [[0,0,0], [1,1,1]], alpha = 1) = [
    rand_double(low = constrain[0][0], high = constrain[1][0], seed = pow(seed + 1, 1)), 
    rand_double(low = constrain[0][1], high = constrain[1][1], seed = pow(seed + 2, 2)), 
    rand_double(low = constrain[0][2], high = constrain[1][2], seed = pow(seed + 3, 3)), 
    alpha
];