clc;
clear all;
close all;

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

figure(1)
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

figure(2)
plot(myx1,myy1-f,'b');
hold on;
plot(myx2,myy2-f,'m');
xlabel('x');
ylabel('Error');
legend('Error N=3','Error N=10','location','best')

%% Functions

function [f] = L3k(myx,x,k)
top = 1;
bot = 1;
k = k+1;
    for j=1:4
        if (j==k)
        continue;
        else
        top = top.*(myx-x(j));
        bot = bot.*(x(k)-x(j));
        end;
    end;
    f = top./bot;
end

function [f] = Lk(myx,x,N,k)
top = 1;
bot = 1;
k = k+1;
    for j=1:N+1
        if (j==k)
        continue;
        else
            top = top.*(myx-x(j));
            bot = bot.*(x(k)-x(j));
        end;
    end;
    f = top./bot;
end