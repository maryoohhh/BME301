% BME 301
% Mary Oh
% HW 10

clc;
clear all;
close all;

%% Q1: Steps use to minimize function

% 1: Find Jacobian
% 2: Choose a starting point
% 3: Compute a first update dx, dy
% 4: Use the new versions of x, y to repeat process
% 5: Find where the derivative is zero

%% Q2a: ODE de/dt = y, h = 0.2

h = 0.2;
t = 0:h:1;
n = (t(end)-t(1))/h;
y1(1) = 1;

for i = 1:n
    y1(i+1) = y1(i) + h * y1(i);
end

ans = find(t==1);

fprintf('y(h=0.2) = %0.4f\n', y1(ans));

%% Q2b: ODE de/dt = y, h = 0.1

h = 0.1;
t = 0:h:1;
n = (t(end)-t(1))/h;
y2(1) = 1;

for i = 1:n
    y2(i+1) = y2(i) + h * y2(i);
end

ans = find(t==1);

fprintf('y(h=0.1) = %0.4f\n', y2(ans));

%% Q2c: which h gives smaller error

% dy/dt = 1
% d(ln(y))/dt = dt/dt
% d(ln(y)) = dt
% ln(y) = t + c
% y = ce^t
%   y(0) = 1, c = 1
% y = e^t
% @ t = 1, y = e
% y = 2.72

% Comparing this from the results from a and b, h = 0.1 gives a smaller
% error.

%% Q3a: h = 0.01 s

h = 0.01;
t = 0:h:18;
n = (t(end)-t(1))/h;
v1(1) = 0;

for i = 1:n
    v1(i+1) = v1(i) + h * (10 - 0.01 * (v1(i))^(3/2));
end

ans = find(t==10);

fprintf('vf(h=0.01) = %0.4f\n', v1(ans));

%% Q3b: h = 0.1 s

h = 0.1;
t = 0:h:18;
n = (t(end)-t(1))/h;
v2(1) = 0;

for i = 1:n
    v2(i+1) = v2(i) + h * (10 - 0.01 * (v2(i))^(3/2));
end

ans = find(t==10);

fprintf('vf(h=0.1) = %0.4f\n', v2(ans));

%% Extra Credit(a): No air resistance, equation?

% no air resistance = v^3/2 = 0
% Hence, v' = 10

%% Extra Credit(b): vf

h = 0.01;
t = 0:h:18;
n = (t(end)-t(1))/h;
v3(1) = 0;

for i = 1:n
    v3(i+1) = v3(i) + h * 10;
end

ans = find(t==10);

fprintf('vf(h=0.01, no air resistance) = %0.1f\n', v3(ans));

h = 0.1;
t = 0:h:18;
n = (t(end)-t(1))/h;
v4(1) = 0;

for i = 1:n
    v4(i+1) = v4(i) + h * 10;
end

ans = find(t==10);

fprintf('vf(h=0.1, no air resistance) = %0.1f\n', v4(ans));