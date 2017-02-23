function [Answer] = Crossover( First,Second )

    for i = randi([1 25],1,1):randi([25 50],1,1);
        for j = randi([1 25],1,1):randi([25 50],1,1);
            x = First(i,j,1);
            First(i,j,1) = Second(i,j,1);
            Second(i,j,1) = x;
            x = First(i,j,2);
            First(i,j,2) = Second(i,j,2);
            Second(i,j,2) = x;
            x = First(i,j,3);
            First(i,j,3) = Second(i,j,3);
            Second(i,j,3) = x;
        end
    end

Answer = {First,Second};

end

