% Mary Oh
% BME 301
% HW 6

clc;
clear all;
close all;

%% Q1: Lagrange polynomial [0, 1]

x1 = 0;
x2 = 0.25;
x3 = 0.5;
x4 = 0.75;
x5 = 1;

y1 = 4.5*(((x1-0.25)*(x1-0.5)*(x1-0.75)*(x1-1))/((0-0.25)*(0-0.5)*(0-0.75)*(0-1)));
y2 = 3.0*(((x2-0)*(x2-0.5)*(x2-0.75)*(x2-1))/((0.25-0)*(0.25-0.5)*(0.25-0.75)*(0.25-1)));
y3 = 3.25*(((x3-0)*(x3-0.25)*(x3-0.75)*(x3-1))/((0.5-0)*(0.5-0.25)*(0.5-0.75)*(0.5-1)));
y4 = 3.5*(((x4-0)*(x4-0.25)*(x4-0.5)*(x4-1))/((0.75-0)*(0.75-0.25)*(0.75-0.5)*(0.75-1)));
y5 = 5.0*(((x5-0)*(x5-0.25)*(x5-0.5)*(x5-0.75))/((1-0)*(1-0.25)*(1-0.5)*(1-0.75)));

x = [x1 x2 x3 x4 x5];
y = [y1 y2 y3 y4 y5];

figure(1)
plot(x(), y(), 'c')
hold on
plot(x3, y3, 'd')
hold on

%% Q2a: N = 3

x = [-5 -2 1 4];
y = [0.0399 0.2353 0.5 0.0623];

myx1 = [-5:0.1:5];
N = 3;

myy1 = Lk(myx1,x,N,3)*y(4) + Lk(myx1,x,N,2)*y(3) + Lk(myx1,x,N,1)*y(2) + Lk(myx1,x,N,0)*y(1);

%% Q2b: N = 10

x = [-5:1:5];
y = [0.0399 0.0623 0.1098 0.2353 0.5 0 0.5 0.2353 0.1098 0.0623 0.0399];
N = 10;

myy2 = 0;
myx2 = [-5:0.1:5];

for i=1:1:11
    myy2 = myy2 + Lk(myx2,x,N,i-1)*y(i);
end

%% Q2c: plot

figure(2)
plot(myx1,myy1,'c');
hold on;
f = myx1.^2./(1+myx1.^4);
plot(myx1,f,'b');
hold on
plot(myx2,myy2,'m');
hold on;
plot(x,y,'r*')
legend('N=3','x^2/(1+x^4)','N=10','Anchor points','location','best')
xlabel('x');
ylabel('P_N(x)');

%% Q2d: error

figure(3)
plot(myx1,myy1-f,'b');
hold on;
plot(myx2,myy2-f,'m');
xlabel('x');
ylabel('Error');
legend('Error N=3','Error N=10','location','best')

%% Functions

function [f] = L3k(myx,x,k)
numerator = 1;
denominator = 1;
k = k+1;
    for j=1:4
        if (j==k)
        continue;
        else
        numerator = numerator.*(myx-x(j));
        denominator = denominator.*(x(k)-x(j));
        end;
    end;
    f = numerator./denominator;
end

function [f] = Lk(myx,x,N,k)
numerator = 1;
denominator = 1;
k = k+1;
    for j=1:N+1
        if (j==k)
        continue;
        else
            numerator = numerator.*(myx-x(j));
            denominator = denominator.*(x(k)-x(j));
        end;
    end;
    f = numerator./denominator;
end