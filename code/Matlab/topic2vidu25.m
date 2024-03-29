%Phuong phap luy thua (Power method)
clc; clear all; close all;

A = [2 -12; 1 -5];
X = [0; 1];	% Gia tri bat dau

N = 8;		% So vong lap
for k = 1:N
    w = A * X;
    X = w / norm(w);
end

X			% Vector rieng
lambda = (X'*A*X)/(X'*X) % Rayleigh quotient
