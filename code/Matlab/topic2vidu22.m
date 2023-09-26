% Cac lenh lien quan den ma tran
clc; clear all; close all;

% Tao ma tran 3x3 ngau nhien
A = fix(1 + 8 * rand(3))

% Tinh toan
Ainv = inv(A)	  % Ma tran ngich dao
At 	 = A'		  % Ma tran chuyen vi
detA = det(A)	  % Tinh dinh thuc
rankA = rank(A)	  % Tinh hang
diagA = diag(A)	  % Lay duong cheo chinh
