% BME 301
% Mary Oh
% HW 7

clc;
clear all;
close all;

T = [30:1:42];
L = [5.60 5.75 5.82 5.87 5.90 5.92 5.94 5.94 5.95 5.96 5.97 6.00 6.03];

%% Q1: Plot

figure(1)
plot(T, L, 'o-')
title('Length (mm) vs. Temperature (C)')
xlabel('Temperature (C)')
ylabel('Length (mm)')
hold on

%% Q2a: Linear curve

coeff = polyfit(T, L, 1);

disp(['y = ', num2str(coeff(1)), 'x + ', num2str(coeff(2))]);

%% Q2b: Residual error at T = 37C

[p, ~, mu] = polyfit(T, L, 1);
f1 = polyval(p, T, [], mu);
resid = L - f1;

T37 = resid(8)

%% Q2c: Residual Sum of Square Error (E)

e = sum((L - f1) .^2)

%% Q2d: Plot

eqn = ['y = ', num2str(coeff(1)), 'x + ', num2str(coeff(2))];

figure(1)
plot(T, f1, 'g')
legend('Data' , eqn)
hold on

%% Q3a: Cubic fit

coeff1 = polyfit(T, L, 2);

disp(['y = ', num2str(coeff1(1)), 'x^2 + ', num2str(coeff1(2)), 'x + ' num2str(coeff1(3))]);

%% Q3b: Residual error at T = 37

[p1, ~, mu1] = polyfit(T, L, 2);
f2 = polyval(p1, T, [], mu1);
resid1 = L - f2;

T37 = resid1(8)

%% Q3c: Residual Sum of Square Error (E)

e1 = sum((L - f2) .^2)

%% Q3d: Plot

eqn1 = ['y = ', num2str(coeff1(1)), 'x^2 + ', num2str(coeff1(2)), 'x + ' num2str(coeff1(3))];

figure(1)
plot(T, f2, 'm--')
legend('Data' , eqn, eqn1)
hold on

%% Q4: 

eqn2 = ['y = ', num2str(coeff(1)), 'e^', num2str(coeff1(1)), 'x'];

disp(eqn2);

%% Q5: Spline fit

yi = spline(T, L, 37.1)