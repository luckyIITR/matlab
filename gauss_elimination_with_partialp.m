%% Gauss Elimination with Partial Pivoting

fprintf('\n==================================================================================');
fprintf('\n                             Gaussian Elimination Method ');
fprintf('\n==================================================================================');


% Matrix Assignment

C = [1 2 -1; 2 1 -2; -3 1 1];

b= [3 3 -6]';
%% 
% creating Augmented Matrix

A = [C b]                                            
n= size(A,1);  
%number of eqns/variables
x = zeros(n,1)
%% 
% Forward Elimination

for i=1:n
    % Partial-pivoting
    % this will compute the index of maximum leading term
    max_row_index = i;
    for p = i:n-1
        if abs(A(i,i)) < abs(A(p+1,i))
        max_row_index = p+1;
        end
    end
    temp = A(i,:);
    A(i,:) = A(max_row_index,:);
    A(max_row_index,:) = temp;
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