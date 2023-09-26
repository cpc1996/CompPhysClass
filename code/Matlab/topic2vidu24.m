% Phuong phap lap Jacobi de giai he p/t: Ax=b
clc; clear all; close all;

A = [5 -2 3; -3 9 1; 2 -1 -7];
b = [-1; 2; 3];
n = length(b);	% So hang cua ma tran
X0 = [0 0 0];	% X0 : Gia tri bat dau

N = 20; % N la so vong lap
for k = 1:N
    for i = 1:n
        Sum = 0;
        for j = 1:n
            if j ~= i
                Sum = Sum + A(i,j) * X0(j);
            end
        end
        X1(i) = (b(i) - Sum) / A(i,i);
    end
    % error1 = norm(X0 - X1)
    X0 = X1
end

A*X0'
b
% error2 = norm(A*X0' - b)
