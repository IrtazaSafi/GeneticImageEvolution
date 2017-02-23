clc
Target = imresize(imread('FacebookLogo.jpg'),[50,50]);
ImageOne = imresize(imread('blue.png'),[50,50]);
ImageTwo = imresize(imread('blue.png'),[50,50]);
ImageThree = imresize(imread('blue.png'),[50,50]);
ImageFour = imresize(imread('blue.png'),[50,50]);
ImageFive = imresize(imread('blue.png'),[50,50]);
ImageSix = imresize(imread('blue.png'),[50,50]);
ImageSeven = imresize(imread('black.png'),[50,50]);
ImageEight = imresize(imread('blue.png'),[50,50]);
ImageNine = imresize(imread('blue.png'),[50,50]);

Population = {ImageOne,ImageTwo,ImageThree,ImageFour,ImageFive,ImageSix,ImageSeven,ImageEight,ImageNine};
FitnessVector = {};
FitnessStore = [];
ThreeFittestIndices = [];
FittestImages = {};
figure
Generation = 0;
while 1
    FitnessVector = {};
    FitnessStore = [];

    display(Generation)
    Generation = Generation + 1;
for i = 1:9
    
    val = Fitness(Target,Population{i});
    FitnessVector{i} = val;
    FitnessStore(i) = val;
end
%FitnessStore = FitnessVector;
[val,index] = min(FitnessStore);
FittestImages{1} = Population{index};
Population(:,index) = [];
% ThreeFittestIndices(1) = index
    FitnessStore(index) = [];

 [val,index] = min(FitnessStore);
FittestImages{2} = Population{index};
Population(:,index) = [];
% ThreeFittestIndices(2) = index
FitnessStore(index) = [];

[val,index] = min(FitnessStore);
FittestImages{3} = Population{index};
Population(:,index) = [];
% ThreeFittestIndices(3) = index
FitnessStore(index) = [];

%FitnessStore = sort(FitnessStore);
MinFitness = min(FitnessStore)

% for i = 1:9
%     if FitnessVector{i} == FitnessStore(1)
%         ThreeFittestIndices{1} = i;
%        
%     end
%     if FitnessVector{i} == FitnessStore(2)
%         ThreeFittestIndices{2} = i;
%     end
%     if FitnessVector{i} == FitnessStore(3)
%         ThreeFittestIndices{3} = i;
%     end
% end

%Do CrossOver Between ThreeFittest
First = FittestImages{1};
Second = FittestImages{2};
Third = FittestImages{3};
pause(0.01);
%Inter = 'E:\Academic\Artificial Intelligence\Assignment 3\simpleFitness';
%imwrite(First,'out.jpg');
image(First);

NextPop= {};
prob = 0.1;
if rand <= 0.4
    x = Crossover(First,Second);
    NextPop{1} = x{1};
    NextPop{2} = x{2};
else
    NextPop{1} = First;
    NextPop{2} = Second;
end
% FirstCrossOverDone
prob = 0.1;
if rand <= 0.4
    x = Crossover(First,Third);
    NextPop{3} = x{1};
    NextPop{4} = x{2};
else
    NextPop{3} = First;
    NextPop{4} = Third;
end
prob = 0.1;
if  rand <= 0.4
    x = Crossover(Second,Third);
    NextPop{5} = x{1};
    NextPop{6} = x{2};
else
    NextPop{5} = Second;
    NextPop{6} = Third;
end

NextPop{7} = First;
NextPop{8} = Second;
NextPop{9} = Third;

%Mutation
NextPopMutated = {};
TempPop = [];
for i = 1:9
    x = Mutation(NextPop{i});
    NextPopMutated{i} = x;
   
end
Population = {};
Population = NextPopMutated;
end

% Initial Population = 9
% Fitness Function used was the norm matlab function which is applied on
% TWO images
%Probability of CrossOver is 0.4 
% Mutation Probability is 0.001

% b -> Increasing CrossOver probability increases time
% ->Increasing Mutation Rate destroys the code and mona lisa isn't achieved
%
        

