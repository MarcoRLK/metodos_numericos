function f = getRandIterativeFunctions()
% Get a random function from previous one defined in here
    NUM_OF_FUNCTIONS = 4;
    
    rand_number = randi(NUM_OF_FUNCTIONS);
    
    switch rand_number
        case 1 
           f = 'cos(x) - x';
        case 2
           f = 'x^2 - sqrt(x)';
        case 3
           f = 'x^(1/3) + exp(x)';
        case 4
           f = 'x - exp(-x)';
    end
           
end

