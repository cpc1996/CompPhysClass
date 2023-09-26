% Phuong phap khu Gauss de giai he p/t: Ax=b
clc; close all; clear all;

A = [2 4 3 4; 3 1 -2 -2; 4 11 7 7] % A = [A|b]
n = size(A, 1); % So hang cua ma tran

% Khu Gauss de tim ma tran bac thang rut gon:
for k = 1:n-1
    for i = k+1:n
        p = A(i,k) / A(k,k);
        % Lay hang i tru di p lan hang k:
        for j = k:n+1 
            A(i,j) = A(i,j) - p * A(k,j);
        end
    end
end
A

% Thay the nguoc de tim x:
for i = n:-1:1
    Sum = 0;
    for j = i+1:n
        Sum = Sum + A(i,j) * x(j);
    end
    x(i,1) = (A(i,n+1) - Sum) / A(i,i);
end
A, x
