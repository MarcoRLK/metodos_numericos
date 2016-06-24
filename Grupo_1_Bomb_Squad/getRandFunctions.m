function f = getRandFunctions()
% Get a random function from previous one defined in here
    NUM_OF_FUNCTIONS = 1;
    
    rand_number = randi(NUM_OF_FUNCTIONS);
    
    switch rand_number
        case 1 
           f = 'cos(x) - exp(-x)';
    end
           
end

