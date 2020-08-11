% Mary Oh
% BME 301
% HW 9

clc;
clear all;
close all;

%% Q1a: Plot f(t) = 9t^2 cos^2(2*pi*ft + 0.1)

t = 0:0.01:10;
f = 0.8; % Hz

func = @(t) 9 * t.^2. * (cos(2 * pi * f * t + 0.1)).^2;

figure(1)
plot(t, func(t))
xlabel('Time (s)')
ylabel('f (Hz)')
title('Signal sampled over 10 sec')

%% Q1b: Minima of function, range 0 to 10

% interval chosen [5, 6]

a = 5;
b = 6;
r = (-1 + sqrt(5)) / 2;
c = a + r * (1 - r) * (b - a);
d = b - r^2 * (b - a);

fc = 9 * c.^2. * (cos(2 * pi * f * c + 0.1)).^2;
fd = 9 * d.^2. * (cos(2 * pi * f * d + 0.1)).^2;

N = 100;
thresh = 1e-10;
n = 5;

g(1) = 9 * a.^2. * (cos(2 * pi * f * a + 0.1)).^2;
g(2) = fc;
g(3) = fd;
g(4) = 9 * b.^2. * (cos(2 * pi * f * b + 0.1)).^2;

while (n < N)
    if (fc <= fd)
        a = a;
        b = d;
        fb = fd;
        d = c;
        fd = fc;
        c = a + r * (1 - r) * (b - a);
        fc = 9 * c.^2. * (cos(2 * pi * f * c + 0.1)).^2;
        g(n) = fc;
    else
        a = c;
        fa = fc;
        b = b;
        c = d;
        fc = fd;
        d = b - r^2 * (b - a);
        fd = 9 * d.^2. * (cos(2 * pi * f * d + 0.1)).^2;
        g(n) = fd;
    end
    
    if (abs(c-d) < thresh)
        break
    end
    
    n = n + 1;
end

minima = fc

%% Q1c: Plot interval containing minimum

figure(2)
plot([n:N, g])
xlabel('Number of evaluation')
ylabel('f(x)')
title('Plot of interval containing minimum')

%% Q2a: Plot f(x,y) = 50(y-x^2)^4 + (1-x)^2

ffunc =@(x, y) 50 * (y - x.^2).^4 + (1 - x).^2;
[x, y] = meshgrid(-5:0.5:5);

figure(3)
surf(x, y, ffunc(x, y))
colorbar
title('Banana function')

%% Q2b, c, d: fminsearch, iterations, and fval

ff = @(x) 50 * (x(2) - x(1).^2).^4 + (1 - x(1)).^2;
opt = optimset('display', 'iter', 'plotfcns', @optimplotfval);
[x, fval, exitflag, output] = fminsearch(ff, [0, 0], opt)