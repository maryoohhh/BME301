% Mary Oh
% BME 301
% HW 1

% Question 1

while(1)

clc;
clear all;
close all;

prompt = {'A:', 'B:', 'C:'};
dlg_title = 'g(x) = 3A^2x + 2Bx + C';

answer = inputdlg(prompt, dlg_title);
A = str2num(answer{1})
B = str2num(answer{2})
C = str2num(answer{3})

a = 3*A;
b = 2*B;
c = C;

x1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
x2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);

fprintf('x1 = %.4e \nx2 = %.4e',x1, x2)

break
end

% Question f

while(1)

clc;
clear all;
close all;

prompt = {'A:', 'B:', 'C:'};
dlg_title = 'g(x) = 3A^2x + 2Bx + C';

answer = inputdlg(prompt, dlg_title);
A = str2num(answer{1})
B = str2num(answer{2})
C = str2num(answer{3})

a = 3*A;
b = 2*B;
c = C;

g = [a, b, c];
x = roots(g)

fprintf('x1 = %.4e \nx2 = %.4e',x(1), x(2))

break
end