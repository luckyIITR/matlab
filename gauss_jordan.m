% Matrix Assignment

C = [1 2 -1; 2 1 -2; -3 1 1];

b= [3 3 -6]';
%%
A = [C b]                                            
n= size(A,1);  
%%

for i = 1:n
    A(i,:) = A(i,:)/A(i,i);
    for j=1:n
        if i ~= j
            A(j,:) = A(j,:) - A(j,i)*A(i,:);
        end
    end
end 
%%
x = A(:,length(A));
disp("Solution")
disp("x : ")
disp(x)