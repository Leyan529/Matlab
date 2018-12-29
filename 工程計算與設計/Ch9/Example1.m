%% Demonstrates the creation of symbolic numbers, variables, and expressions.
clear
a = sym(2/3)
b = sym('2/3')
isequal(a, b)
sym(pi)
x = sym('y')
x^2
x = sym('c')+sym('y')
x^2
x = sym('x')
p = x^2+2*x+3
q = diff(p)
%% Demonstrates the creation of some symbolic expressions.
clear
syms theta
f = 8*cos(theta)/sin((3*theta)/(theta+1))
syms a b c x
g = a*x^3+b*x+c
h = diff(sqrt(5*x^2+3*x+7))
syms t
M = [5*sin(t), -cos(t^2); cos(2*t), -sin(t)]
class(M)
size(M)
det(M)
%% Demonstrates the creation of symbolic functions.
clear
syms x y
f(x,y) = x^3*y^2
class(f)
f(2,3)
clear
syms f(x,y)
f(x,y) = x^3*y^2
diff(f)
diff(f,y)
syms a b
g = f(a+1,b+1)/(a+b)
h = f + x^2 + y
f(x,y) = sin(x*y)
f = sin(x*y)
class(f)
%% Demonstrates the use of some simplification functions.
clear
syms x y a b
f = (x+a)^2*(y+b)
g = expand(f)
h = factor(g)
prod(h)
collect(g)
collect(g, y)
collect(g, [a b])
simplify(g)
simplify(sin(x)^2+cos(x)^2)
simplify((x^2+2*x+1)/(x+1))
%% Demonstrates the use of some simplification functions.
clear
syms x y
combine(sqrt(3)*sqrt(x))
combine(sqrt(x)*sqrt(y))
assume(x, 'positive')
combine(sqrt(x)*sqrt(y))
clear
syms x y
combine(sqrt(x)*sqrt(y))
assumptions(x)
assume(x, 'clear')
combine(sqrt(x)*sqrt(y))
%% Calculates and plots the curvature of a curve
clear
syms t
x =  cos(2*t) + cos(t);
y = -sin(2*t) + sin(t);
fplot(x, [0, 2*pi]), hold on
fplot(y, [0, 2*pi]), hold off
fplot(x, y, [0,2*pi])
x1 = diff(x)
x2 = diff(x1)
y1 = diff(y)
y2 = diff(y1)
n = x1*y2 - y1*x2
d = (x1^2 + y1^2)^(3/2)
n = simplify(n)
d = simplify(d)
k = n / d
fplot(k, [0, 2*pi])
k = subs(k, cos(3*t), 'C')
%% Plots the p.d.f. and c.d.f. curves of the standard normal distribution.
clear
mu = 0; sigma = 1;
syms x
f = exp(-(x-mu)^2/(2*sigma^2))/(sqrt(2*pi)*sigma);
fplot(f, [-3, 3]), hold on
p = int(f, x, -inf, x);
fplot(p, [-3, 3])
axis([-3, 3, 0, 1])
xlabel('x')
title('Standard Normal Distribution')
legend('Probability Density Function', ...
       'Cumulative Distribution Function', ...
       'Location', 'northwest')
%% Demonstrates the use of the function limit.
clear
syms x h n
f(x) = sin(x);
g(x) = limit((f(x+h)-f(x))/h, h, 0)
g(x) = diff(f)
f(x) = x^n;
g(x) = limit((f(x+h)-f(x))/h, h, 0)
g(x) = diff(f)
limit(sin(x)/x, x, 0)
f(x) = limit((1+x/n)^n, n, inf)
vpa(f(1))
%% Demonstrates the use of the function taylor.
clear
syms x
f(x) = sin(x);
T1(x) = taylor(f)
T2(x) = taylor(f, x, 'Order', 8)
T3(x) = taylor(f, x, pi/4)
vpa(f(pi/4))
vpa(T1(pi/4))
vpa(T2(pi/4))
vpa(T3(pi/4))
%% Demonstrates the symbolic solution of algebraic equations.
clear
syms x a b c
eq = a*x^2+b*x+c;
solve(eq)
eq = (cos(x)==1);
solve(eq)
[sol, param, cond] = solve(eq, 'ReturnConditions', true)
syms y d e f
eq1 = a*x+b*y==c;
eq2 = d*x+e*y==f;
sol = solve(eq1, eq2)
[sol.x, sol.y]
[A, b] = equationsToMatrix(eq1, eq2, x, y)
sol = linsolve(A, b)
sol = A\b
sol = inv(A)*b
%% Hooke¡¦s Law
clear
syms E v G
K = [1/E, -v/E, -v/E,   0,   0    0;
    -v/E,  1/E, -v/E,   0,   0,   0;
    -v/E, -v/E,  1/E,   0,   0,   0;
       0,    0,    0, 1/G,   0,   0;
       0,    0,    0,   0, 1/G,   0;
       0,    0,    0,   0,   0, 1/G]
F = inv(K)
%% Obtains a general solution for a 2nd-order ODE representing an undamped free vibration but fails to obtain a particular solution.
clear
syms t m k delta omega clear
syms x(t)
x1(t) = diff(x);
x2(t) = diff(x1);
ode = m*x2+k*x==0;
x(t) = dsolve(ode)
assume([m, k], 'positive')
x(t) = dsolve(ode)
x(t) = combine(x)
x(t) = subs(x, (k/m)^(1/2), omega)
x(t) = dsolve(ode, x(0)==delta, x1(0)==0)
%% Obtains a particular solution for the 2nd-order ODE by reducing it to a system of two first-order ODEs.
clear
syms t m k delta omega clear
syms x(t) v(t)
x1(t) = diff(x);
v1(t) = diff(v);
ode1 = m*v1+k*x==0;
ode2 = x1==v;
assume([m, k], 'positive')
sol = dsolve(ode1, ode2, x(0)==delta, v(0)==0)
x(t) = sol.x
v(t) = sol.v
x(t) = combine(x)
x(t) = subs(x, (k/m)^(1/2), omega)
v(t) = combine(v)
v(t) = subs(v, (k/m)^(1/2), omega)
%% Obtains a particular solution for a 2nd-order ODE representing a damped free vibration.
clear
syms t x(t) v(t)
m = 1; c = 1; k = 100; delta = 0.2;
x1(t) = diff(x);
v1(t) = diff(v);
ode1 = m*v1+c*v+k*x==0;
ode2 = x1==v;
sol = dsolve(ode1, ode2, x(0)==delta, v(0)==0)
x(t) = sol.x
v(t) = sol.v
fplot(x, [0,2])
fplot(v, [0,2])
vpa(x, 5)
vpa(v, 5)


