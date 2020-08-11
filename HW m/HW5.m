% Mary Oh
% BME 301
% HW 5

clc;
close all;

%% Q1: NR method to find pt of intersection

% J*dx = -f

n = 1;
thresh = 1e-10;

J = [2 -5 7;
    3 1 2;
    -1 6 7];
x = [1;
    1;
    1];

while (n<100)
    dx = -J\fx1(x);
    x = x + dx;
    
    if abs(fx1(x)) < thresh
        break;
    end;
end;

fprintf('x = %.4f\ny = %.4f\nz = %.4f\n', x(1), x(2), x(3));

%% Functions

% 2x - 5y + 7z = 1
% 3x + y + 2z = 1
% -x + 6y + 7z = 3

function [f] = fx1(x)
    f = zeros(3,1);
    f(1) = 2*x(1) - 5*x(2) + 7*x(3) - 1;
    f(2) = 3*x(1) + x(2) + 2*x(3) - 1;
    f(3) = - x(1) + 6*x(2) + 7*x(3) -3; 
end
