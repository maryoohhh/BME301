% Mary Oh
% BME 301
% HW 2

% f(x) = x - cos(x)

clc;
clear all;
close all;

%% 2a: plot the function -0.5 <= x <= 1.4

x = [-0.5:0.1:1.4];

figure (1)
plot(x, fx(x))
xlabel('x');
ylabel('f(x)');
title('f(x) = x - cos(x)');

% function at the end of the code

%% 2b: verify near zero at x = 0.74

% on command window type the following
% fx = @(x) x - cos(x);
fprintf('2b:\n\tx = 0.74\n\tf(x) = %0.4f\n\n', fx(0.74));

%% 2c.i: simple fixed point iteration

% g(x) = cos(x)

t0 = tic;
iter = 100;

sfp(1) = 0.74;
f(1) = fx(sfp(1));
n = 2;
thresh = 1e-10;

while (n<=100)
    sfp(n) = cos(sfp(n-1));
    f(n) = fx(sfp(n));
    
    if (abs(f(n)) < thresh)
        fprintf('2c.i\n\tNumber of iteration: %i', n);
        fprintf('\n\tZero at: %0.4f\n', sfp(n));
        break;
    end;
    
    n = n + 1;
end

nsfp = n;
t1 = toc(t0);
fprintf('\tTotal time: %0.4f\n', t1);

%% 2c.ii: bisection method with starting interval [0.25, 1]

n1 = 0.25;
n2 = 1;

t2 = tic;
n=2;

bis(1) = (n1 + n2) / 2;
f2(1) = fx(bis(1));

thresh = 1e-10;

while (n<=100)
    if fx(n1) * fx(bis(n-1)) < 0
        n2 = bis(n - 1);
    else n1 = bis(n - 1);
        if abs(fx(bis(n-1))) < thresh
            fprintf('2c.ii\n\tNumber of iteration: %i', n-1);
            fprintf('\n\tZero at: %0.4f\n', bis(n-1));
            break;
        end
    end
    
    bis(n) = (n1 + n2)/2;
    f2(n) = fx(bis(n));
    n = n + 1;
end

nbm = n - 1;
t3 = toc(t2);
fprintf('\tTotal time: %0.4f\n', t3);

%% 2d: compare convergence rates and time

figure(2)
plot(1:nsfp, sfp(1:nsfp), '*');
hold on
plot(1:nsfp, f(1:nsfp));
hold on
plot(1:nbm, bis(1:nbm), '*');
hold on
plot(1:nbm, f2(1:nbm));
hold on

xlabel('Number of Iteration');
ylabel('f(x)')
title('Convergence rates and time')
legend('g(x) fixed point', 'f(x) fixed point', 'g(x) bisection', 'f(x) bisection');

%% 2a: function

function f = fx(x)
	f = x - cos(x);
end

