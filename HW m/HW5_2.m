clc;
clear all;
close all;


%% Q2: NR nonlinear

% f1(x,y) = x^3 - 3y - 0.3 = 0
% f2(x,y) = y^3 - 2x - 0.2 = 0
% x0 = 1.2, y0 = 1.2

n = 1;
x = [1.2; 1.2];
thresh = 1e-10;

while (n<100)
    dx = -jx(x)\fx2(x);
    x = x + dx;
    
    if abs (fx2(x)) < thresh
        break;
    end;
end;

fprintf('x = %.4f\ny = %.4f\n', x(1), x(2));

% f1(x,y) = x^3 - 3y - 0.3 = 0
% f2(x,y) = y^3 - 2x - 0.2 = 0

function [f] = fx2(x)
    f = zeros(2,1);
    f(1) = x(1)^3 - 3*x(2) - 0.3;
    f(2) = x(2)^3 - 2*x(1) - 0.2;
end

function [f] = jx(x)
    f = [3*x(1)^2 - 3;
        - 2 + 3*x(2)^2];
end
