%% Calculates the area and centroid bounded by two curves
clc % 清除command window
clear all % 清除WorkSpace變數
close all %  關閉所有視窗
syms x y
fx = x+2;
gx = x^2;
fplot(fx), hold on, fplot(gx)
axis([-3,3,0,6])
legend('y = x+2', 'y = x^2', 'Location', 'southeast')
title('Two Curves')
eq1 = (y == fx);
eq2 = (y == gx);
sol = solve(eq1, eq2);
x1 = double(sol.x(1))
x2 = double(sol.x(2))
y1 = double(sol.y(1))
y2 = double(sol.y(2))
funA = @(x) abs((x+2)-(x.^2));
A = integral(funA,x1,x2)
funXc = @(x) x.*abs((x+2)-(x.^2));
funYc = @(x) abs((x+2).^2-(x.^4));
xc = integral(funXc,-1,2)/A
yc = integral(funYc,-1,2)/(2*A)
%% Demonstrates numerical integration with the function trapz, which uses a trapezoidal rule.
clc % 清除command window
clear all % 清除WorkSpace變數
close all %  關閉所有視窗
n = 100;
x = linspace(0,15,n);
theta = 3.5
y1 = 3*(5*sin(x).*5 + 5*cos(x).*5);
y2 = 3*(3*sin(x+theta).*5 + 3*cos(x+theta).*5);
y3 = 2*(2*sin(x+2*theta).*5 + 2*cos(x+2*theta).*5);
plot(x, y1, 'g'), hold on
plot([x;x], [zeros(1,n);y1], 'g')
plot(x, y2, 'r'), hold on
plot([x;x], [zeros(1,n);y2], 'r')
plot(x, y3, 'b'), hold on
plot([x;x], [zeros(1,n);y3], 'b')
axis([0, 15, 0, 120])
xlabel('x')
ylabel('y = 20+x^2')
A1 = abs(trapz(x, y1))
A2 = abs(trapz(x, y2))
A3 = abs(trapz(x, y3))
text(0.5, 110, ['Area1 = ', num2str(A1)])
text(2, 70, ['Area2 = ', num2str(A2)])
text(5, 35, ['Area3 = ', num2str(A3)])
