% BME 301
% Mary Oh
% HW 11

clc;
clear all;
close all;

%% Q1: Euler prediction - Heun corrector

t = 1:0.015:1.4;
h = 0.015;
y = zeros(size(t));

y(1) = 1;
% y(1.015) = 0.98477
y(2) = sqrt(2 - 1.015^2);
n = 2;

for i = n:length(t) - 1
    y(i+1) = y(i-1) + 2 * h * (-t(i)/y(i));
    y(i+1) = y(i) + h / 2 * (-t(i+1)/y(i+1) - t(i)/y(i));
    y(i+1) = y(i) + h / 2 * (-t(i+1)/y(i+1) - t(i)/y(i));
end

soln = (2 - t.^2).^(1/2);

figure(1)
plot(t, y, 'p')
hold on
plot(t, soln, 'g')
xlabel('t')
ylabel('y')
legend({'h = 0.015'; 'Actual';})

%% Q2a: Diff eqn as pair of first ODE

% d^2y/dx^2 = (P(L-x)/Ei)(1+(dy/dx)^2)^3/2
% y(0) = y'(0) = 0

% 1: y1' = y2 = dy/dx
% 2: y2' = (P(L-x)/Ei)(1+y2^2)^3/2

%% Q2b: use ode45, plot displacement y(x) at 20um from 0-5mm

% L = 5 mm
% P = 1 N
% E = 5*10^10 N/m^2
% i = 7*10^-8 m^4

syms y(x)

L = str2double('5e-3');
P = 1;
E = str2double('5e10');
i = str2double('7e-8');

% y1=y(t); y2=dy/dx; c=(p(L-x)/Ei)
dx = str2double('10e-6');
c = (P*L)/(E*i);

[V] = odeToVectorField(diff(y,2) == c * (1 + (diff(y)^2))^(3/2));

M = matlabFunction(V, 'vars', {'x', 'Y'});
soln = ode45(M, [0 5], [0 0]);

xval = [0:0.001:5];
yval = deval(soln, xval, 1);

figure(2)
[ax, h1, h2] = plotyy(xval, yval(:,1)*1e3, xval, yval(:,2));
xlabel('Distance along mirror (mm)')
ylabel('Displacement')

%% Bonus: Euler's method

h = 0.2;
L = 25000;
P0 = 250;
k = 3e-5;
t = [1 60];
n = (t(end)-t(1))/h;

P(1) = P0;

for i = 2:n
    P(i) = P(i-1) + h * (k * P(i-1) * (L - P(i-1)));
    Q(i) = (L - P(i));
end

figure(3)
plot(t, P, 'r')
hold on
plot(t, Q, 'g')