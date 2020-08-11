% Mary Oh
% BME 301
% HW 4

clc;
clear all;
close all;

%% 2a: Determinant of A

A = [7 18 3;
    2 4 1;
    10 1 3];
detA = det(A)

%% 3a: LU Factorization

A = [3 1 2;
    6 3 3;
    -3 2 -3];

[L,U, P] = lu(A)
