%%  Calculates the position of a ball at t = 1 sec, given the initial velocity of the ball.
v0 = 5;
theta = 45;
g = 9.81;
t = 1;
x = v0*cosd(theta)*t;
y = v0*sind(theta)*t-g*t^2/2;
%%  Calculates the positions of the ball described in the last section  at  t = 0, 0.2, 0.4, 0.6, 0.8, and 1.0 seconds.
v0 = 5;
theta = 45;
g = 9.81;
t = 0:0.2:1
x= v0*cosd(theta)*t
y= v0*sind(theta)*t-g*t.^2/2
%% Plots a trajectory curve of the ball described before.
v0 = 5; theta = 45; g = 9.81;
t = 0:0.02:1
x= v0*cosd(theta)*t
y= v0*sind(theta)*t-g*t.^2/2
plot(x,y,'b'); grid;
title('Trajectory of a Ball')
xlabel('Distance (m)')
ylabel('Height (m)')
%% Plots a spiral curve described by the equations x =cos(θ), y=sin(θ), and z =θ 8π, where θ runs from 0 to 8π.
theta = 0:5:360*4; 
x= cosd(theta)
y= sind(theta);
z = theta/(pi);
plot3(x,y,z,'r')
%% Runs the commands in the last section as a script file.
v0=5; theta = 360/4; g =9.81
t = 0:0.02:1
x = v0*cosd(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;
disp(x)
disp(y)
plot(x,y)
title('Trajectory of a Ball')
xlabel('Distance (m)')
ylabel('Height (m)')
%% Plots the trajectory curves of the ball for elevation angles θ varying from π 8to 3π 8. The collection of  the curves form a surface in the height-distance-θ space.
v0=5; g =9.81;
time = 0:0.01:1; n = length(time);
theta = 45:1.8:135 
m = length(theta);
time_arr = repmat(time,m,1);
theta_arr = repmat(theta',1,n);
X = v0*cosd(theta_arr).*time_arr;
Z = v0*sind(theta_arr).*time_arr-g*time_arr.^2/2;
surf(X,theta_arr,Z) % 畫出立體曲面圖 

hold on % 保持原有圖形
Z = zeros(m,n); %建立51X101的matrix
mesh(X,theta_arr,Z) % 繪製3D曲面
xlabel('Distance (m)')
ylabel('Angle (radian)')
zlabel('Height (m)')
colorbar % 以不同顏色來代表曲面的高度
axis vis3d %凍結屏幕高寬比，使得一個三維對象的旋轉不會改變坐標軸的刻度顯示
%% Derives an expression for the range of the ball as a function of the elevation angle θand plots a range-versus-θcurve.  (a)

clc % 清除command window
clear all % 清除WorkSpace變數
close all %  關閉所有視窗

syms v0 theta g t % syms 指令來定義符號變數
x = v0*cosd(theta)*t
y = v0*sind(theta)*t-g*t^2/2
solutions = solve(y,t) % solve 解方程式的根
t0 = solutions(2) % solutions(index) 取第index的對應解
range = subs(x,t,t0) % subs(S,OLD,NEW) 表示將符號表達式S中的符號變量OLD替換為新的值NEW。
range = simplify(range) % 對表達式進行化簡
range = subs(range,[v0,g],[5,9.81]);
fplot(range,[360/8,360*3/8]) % fplot : 自訂函數繪圖
title('Range as Function of Angle (a)')
xlabel('Elevantion angle ')
ylabel('Range (m)')

%% Derives an expression for the range of the ball as a function of the elevation angle θand plots a range-versus-θcurve.  (b)

clc % 清除command window
clear all % 清除WorkSpace變數
close all %  關閉所有視窗

syms v0 theta g t % syms 指令來定義符號變數
x = v0*cosd(theta)*t
y = v0*sind(theta)*t-g*t^2/2
solutions = solve(y,t) % solve 解方程式的根
t0 = solutions(2) % solutions(index) 取第index的對應解
range = subs(x,t,t0) % subs(S,OLD,NEW) 表示將符號表達式S中的符號變量OLD替換為新的值NEW。
range = simplify(range) % 對表達式進行化簡
range = subs(range,[v0,g],[5,9.81])
func = matlabFunction(range)
theta = [360/8:360/200:360*(3/8)];
range = func(theta);
plot(theta*180/pi,range)
title('Range as Function of Angle (b)')
xlabel('Elevantion angle ')
ylabel('Range (m)')
%% Calculates and tabulates the positions of the ball at t = 0, 0.1, 0.2, ... , 1 sec, allowing the input of an initial speed and an elevation angle.
disp('Enter initial speed (m/s): '); 
v0 = 5
disp('Enter elevation angle: ');
theta = 45
g = 9.81; t = 0:0.1:1; 
x = v0*cosd(theta)*t; 
y = v0*sind(theta)*t-g*t.^2/2;
Table = [t',x',y'];
fprintf('\n time (s)    x (m)   y (m)\n')
fprintf('%10.1f %9.3f %9.3f\n',Table')
%% Creates a trajectory table, write the table to a text file, reads the table from the text file, and prints the table on the screen.
v0 = 5; theta = 45; g = 9.81;
t = 0:0.1:1;
x = v0*cosd(theta)*t;
y = v0*sind(theta)*t-g*t.^2/2;
Table = [t ; x ; y];
% Write to a file
file = fopen('工程計算與設計/Ch1/dat/Datafile01_10.dat','w');
fprintf(file, '  Time (s)    x (m)   y (m)\n');
fprintf(file,'%10.1f %9.3f %9.3f\n',Table');
fclose(file);
% Read from the file
file = fopen('工程計算與設計/Ch1/dat/Datafile01_10.dat','r');
fscanf(file, '  Time (s)    x (m)   y (m)\n');
Table = fscanf(file, '  %f %f %f\n',[3,11]);
fclose(file);
% Print on the screen
fprintf( '  Time (s)    x (m)   y (m)\n');
fprintf('%10.1f %9.3f %9.3f\n',Table')

