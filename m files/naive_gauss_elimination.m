%% Naive Gauss Elimination
% Matrix Assignment

C = [1 2 -1; 2 1 -2; -3 1 1];

b= [3 3 -6]';


%%
% creating Augmented Matrix
A = [C b];                                                  
n= size(A,1);  
%number of eqns/variables
x = zeros(n,1);             

%% 
% Forward Elimination

for i=1:n
    for j=i:n-1
        fac = A(j+1,i)/A(i,i);
        A(j+1,:) = A(j+1,:) - fac*A(i,:);
    end
end
disp("After Forward Elimination")
disp("A : ")
disp(A)

%%
% Back Substition
for i=n:-1:1
    summ = 0;
    for j=0:n-i
        summ = summ + A(i,n-j)*x(n-j,:);
    end
    x(i,:) = (A(i,n+1) - summ)/A(i,i);
end
disp("Solution")
disp("x : ")
disp(x)


