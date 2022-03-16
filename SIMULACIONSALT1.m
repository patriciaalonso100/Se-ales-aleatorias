a=[1,0,0];
b=[1,1,0];
c=[1,1,1];
r=[1,0,1];
pa=0.5;
pb=0.25;
pc=0.25;
p=0.05; %These are all the possible variables that we will use
numeroR=0;
numeroA=0;
numeroB=0;
numeroC=0;%They start at 0, it is the absolute frequency of the variables 

matrizCeros=zeros(10000,3);%we start using a zero-matriz and then we will replace the random a,b and c on its elements
matrizCeros2=zeros(10000,3);%we need a second zero-matriz to be replaced also by r's

for var=1:10000 %our first loop replaces a's,b's or c's in the first zero-matriz due to its probabilities.
    matrizAleatoria=rand(1,1);
    if matrizAleatoria<pa
        matrizCeros(var,1:3)=a;
    elseif matrizAleatoria<pa+pb
        matrizCeros(var,1:3)=b;
    else
        matrizCeros(var,1:3)=c;
    end
end

for i=1:10000%second loop is used for changing 1's by 0's in first zeros-matrix(within its a's,b's or c's) when the probability is less than 0.05, and then do not change the ones that have 0.95 prob
    for j=1:3
        matrizAleatoria2=rand(1,1);
        if matrizAleatoria2<p
            matrizCeros2(i,j)=1-matrizCeros(i,j);
        else 
            matrizCeros2(i,j)=matrizCeros(i,j);
        end
    end
end
for h=1:10000%we use this loop for calculatin relative frequency of R
    if isequal(matrizCeros2(h,1:3),r)
        numeroR=numeroR+1;
    else
    end
end
fRelR=numeroR/10000; %relative frequency formula that compare the number of R's and the total number of elements of the matrix
for y=1:10000%it will calculate relative frequencies of a, b and c that have been transformed to r's in the second zero-matrix
    if isequal(matrizCeros2(y,1:3),r)
        if isequal(matrizCeros(y,1:3),a)
            numeroA=numeroA+1;
        elseif isequal(matrizCeros(y,1:3),b)
            numeroB=numeroB+1;
        else
            numeroC=numeroC+1;
        end
    end
end
fRelA=numeroA/numeroR;
fRelB=numeroB/numeroR;
fRelC=numeroC/numeroR;%relative frequencies of a's.b's and c's that compare the number of the variables that have been transformed to R's.
            