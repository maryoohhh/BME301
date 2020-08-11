% Mary Oh
% HW 3
% BME 301

clc;
clear all;
close all;

% f(x) = x^2 - a
% x0 = a
% sqrt(37)

%% 1a: roots of f starting at x0 = 37 and plot sqrt(37)

% f'(x) = 2x
% p1 = p0 - (f(p0)/f'(p0))

x(1) = 37;
thresh = 1e-5;

for i = 1:100
    x(i+1) = x(i) - ((x(i)^2 - 37)/(2*x(i)));
    if abs(x(i)^2 - 37) < thresh
        break;
    end;
end;

figure(1)
plot(x)
xlabel('Number of Iteration')
ylabel('Sqrt(x)')
title('Newton Raphson Method')
hold on

%% 1b: x0 = -37

x2(1) = -37;

for i = 1:100
    x2(i+1) = x2(i) - ((x2(i)^2 - 37)/(2*x2(i)));
    if abs(x2(i)^2 - 37) < thresh
        break;
    end;
end;

figure(1)
plot(x2)
legend('x0 = 37', 'x0 = -37')

%% 1c: x0 = 0

% Because NR iteration function is p1 = p0 - (f(p0)/f'(p0)), and derivative
% is zero at point x = 0 which would leave iteration function undefined.

%% 2a

% Since according to the limitation, derivative is uncomputable, secant
% method is a good option since it does not involve calculating f'.

%% 2b: Pseudo code using secant method

% pk+1 = g(pk, pk-1) = pk - ((f(pk)(pk-pk-1))/(f(pk)-f(pk-1))

% x(1) = ;
% x(2) = ;
% fx = [];
% maxit = ;

% for n = 1:1:maxit
    % x(n+2) = x(n+1) - ((fx(n+1) * (x(n+1)-x(n)))/(fx(n+1) - fx(n)))
    % if fx(n+1) < thresh
        % break;
    % end;
% end;
