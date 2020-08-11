% Mary Oh
% BME 301
% HW 12

clc;
clear all;
close all;

% f(x,y,z) = 2x^2 + y^2 + z^3 - 2xy + yz - 7y -4z

%% a: evaluate value of f at any pt

f = @(x, y, z) 2*x^2 + y^2 + z^3 - 2*x*y + y*z - 7*y - 4*z;
p0 = [1, 1, 1];
f0 = f(p0(1), p0(2), p0(3));
p = p0;

fprintf('f = %.1f\n', f0);

%% b: evaluate the gradient

dx = 4*p(1) - 2*p(2);
dy = 2*p(2) - 2*p(1) + p(3) - 7;
dz = 3*(p(3))^2 + p(2) - 4;

A = sqrt(dx^2 + dy^2 + dz^2);
s = [-dx/A, -dy/A, -dz/A];

fprintf('gradient = %.4f %.4f %.1f\n', s(1), s(2), s(3));

%% c&d: define unimodal and use lambda 0.25

lambda = 0.25;

pask = p0 + s * lambda;
fask = f(pask(1), pask(2), pask(3));

fprintf('f* = %.4f. f* is smaller than f0.\n', fask);

%% e: compute two extra points (1-r)lambda & r(lambda)

r = (sqrt(5) - 1)/2;

p1 = p0 + s * (1 - r) * lambda;
p2 = p0 + s * r * lambda;

f1 = f(p1(1), p1(2), p1(3));
f2 = f(p2(1), p2(2), p2(3));

ff = [f0 f1 f2 fask];

figure(1)
plot(ff, '-g')
legend('Not Unimodal')

%% f: double lambda, find f is unimodal

for j = 1:4
    lambda = 2 * lambda;
    
    for i = 1:100
        p = p0 + i * lambda * 1e-2 * s;
        fe(i) = f(p(1), p(2), p(3));
    end
    
    figure(2)
    plot(fe, '-b')
    legend('Unimodal')
end

pask2 = p0 + s * lambda;

fprintf('Unimodal at lambda = %.2f.\n', lambda);

%% g: golden ratio for min of function

r = (-1 + sqrt(5))/2;

a = [p0(1), p0(2), p0(3)];
b = [pask2(1), pask2(2), pask2(3)];
c = a + (1 - r) * (b - a);
d = a + r * (b - a);

fc = f(c(1), c(2), c(3));
fd = f(d(1), d(2), d(3));

N = 100;
thresh = 1e-10;
n = 1;

while (n < N)
    if (fc <= fd)
        a = a;
        b = d;
        fb = fd;
        d = c;
        fd = fc;
        c = a + (1 - r) * (b - a);
        fc = f(c(1), c(2), c(3));
        
    else
        a = c;
        fa = fc;
        b = b;
        c = d;
        fc = fd;
        d = (1 - r) * a + r * b;
        fd = f(d(1), d(2), d(3));
    end;
    
    if (abs(c - d) < thresh)
        break;
    end;
    
    n = n + 1;
end;

fprintf('Minimum is at %.4f.\n', fc);

%% h: min = p1, gradient at p1

p1 = c;

dx = 4*p1(1) - 2*p1(2);
dy = 2*p1(2) - 2*p1(1) + p1(3) - 7;
dz = 3 * (p1(3))^2 + p1(2) - 4;

A = sqrt(dx^2 + dy^2 + dz^2);
s = [-dx/A, -dy/A, -dz/A];

fprintf('gradient at p1 = %.4f %.4f %.4f\n', s(1), s(2), s(3));