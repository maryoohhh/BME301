% Mary Oh
% BME 301
% HW 2

% f(x) = x - cos(x)

clc;
clear all;
close all;

%% 2a: plot the function -0.5 <= x <= 1.4

x = [-0.5:0.01:1.4];

figure (1)
plot(x, f(x))
xlabel('x');
ylabel('f(x)');
title('f(x) = x - cos(x)');

function fx = f(x)
	y = x - cos(x);
	fx = y;
end