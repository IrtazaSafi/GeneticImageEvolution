function [ output ] = Mutation( input )
        
    for i = 1:50
        for j =1:50
            prob = 0.0001;
            if rand <= prob
            input(i,j,1) = rand*255;
            input(i,j,2) = rand*255;
            input(i,j,3) = rand*255;
            end
        end
    end
    output = input;


end

