% Mary Oh
% BME 301
% HW 8

clc;
clear all;
close all;

%% Q1: data points

T = [30:1:42];
L = [5.6 5.75 5.82 5.87 5.9 5.92 5.94 5.94 5.95 5.96 5.97 6 6.03];

%% Q1a: central difference formula f'(x) = (f(x+h)-f(x-h))/2h

h = 1;

for i = 2:12
    df(i-1) = (L(i+h) - L(i-h)) / (2*h);
end

df

%% Q1b: 2nd central diff f'(x) = (-f(x+2h)+8f(x+h)-8f(x-h)+f(x-2h))/12h

for i = 3:11
    df2(i-2) = (-L(i+(2*h)) + 8*L(i+h) - 8*L(i-h) + L(i-(2*h))) / (12*h);
end

df2

%% Q1c: plot

figure(1)
plot(T(2:12), df, 'm')
title('Length (mm) vs. Temperature (C)')
xlabel('Temperature (C)')
ylabel('Length (mm)')
hold on

figure(1)
plot(T(3:11), df2, 'b')
legend('Central Difference', 'Second Central Difference')

%% Q2: data points

t = [140:1:150];
our = [15.49 16.16 15.35 15.13 14.20 14.23 14.29 12.74 14.74 13.68 14.51];

%% Q2a: simpson's 1/3 integral

h = 1;
n = length(t);

y1 = our(2:2:n-1);
y2 = our(3:2:n-2);

Qsimp = (our(1) + 4 * sum(y1) + 2 * sum(y2) + our(n)) * h / 3

%% Q2b: find total o2 absorbed bet 141 and 146

t1 = [141:1:146];
our1 = [16.16 15.35 15.13 14.20 14.23 14.29];

h = 1;
n = length(t1);

y3 = our1(2:2:n-2);
y4 = our1(3:2:n-3);

Qsimp1 = (our1(1) + 4 * sum(y3) + 2 * sum(y4) + our1(n-1)) * h / 3;
Qtrap = (our1(n) + our1(n-1)) / 2;
Qt = Qtrap + Qsimp1

%% Q2c: use 'integral' and 'trapz'

Qint = integral(@(a) spline(t, our, a), 141, 146)
Qtrapz = trapz(t1(1:n), our1(1:n))

%% Q3: simpson's 3/8 integral

