% Mang so va ma tran trong Matlab
clc; close all; clear all;

% Tao mang a, b, c, d, E:
a = []
b = [1]
c = [1, 3, 5]
d = [2; 4; 6]
E = [1, 2, 3; 4, 5, 6]

% Kich thuoc cua mang:
s_c =size(c), s1_c =size(c,1), s2_c =size(c,2)
s_d =size(d), s1_d =size(d,1), s2_d =size(d,2)
s_E =size(E), s1_E =size(E,1), s2_E =size(E,2)

% Chieu dai cua mang:
l_c = length(c), l_d = length(d)

% Xac dinh cac phan tu cua mang E:
x1 = E(2,3), x2 = E(end,2), x3 = E(1,end)
