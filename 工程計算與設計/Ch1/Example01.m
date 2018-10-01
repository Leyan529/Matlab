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
%% Plots a spiral curve described by the equations x =cos(�c), y=sin(�c), and z =�c 8�k, where �c runs from 0 to 8�k.
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
%% Plots the trajectory curves of the ball for elevation angles �c varying from �k 8to 3�k 8. The collection of  the curves form a surface in the height-distance-�c space.
v0=5; g =9.81;
time = 0:0.01:1; n = length(time);
theta = 45:1.8:135 
m = length(theta);
time_arr = repmat(time,m,1);
theta_arr = repmat(theta',1,n);
X = v0*cosd(theta_arr).*time_arr;
Z = v0*sind(theta_arr).*time_arr-g*time_arr.^2/2;
surf(X,theta_arr,Z) % �e�X���馱���� 

hold on % �O���즳�ϧ�
Z = zeros(m,n); %�إ�51X101��matrix
mesh(X,theta_arr,Z) % ø�s3D����
xlabel('Distance (m)')
ylabel('Angle (radian)')
zlabel('Height (m)')
colorbar % �H���P�C��ӥN����������
axis vis3d %�ᵲ�̹����e��A�ϱo�@�ӤT����H�����ण�|���ܧ��жb��������
%% Derives an expression for the range of the ball as a function of the elevation angle �cand plots a range-versus-�ccurve.  (a)

clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

syms v0 theta g t % syms ���O�өw�q�Ÿ��ܼ�
x = v0*cosd(theta)*t
y = v0*sind(theta)*t-g*t^2/2
solutions = solve(y,t) % solve �Ѥ�{������
t0 = solutions(2) % solutions(index) ����index��������
range = subs(x,t,t0) % subs(S,OLD,NEW) ��ܱN�Ÿ���F��S�����Ÿ��ܶqOLD�������s����NEW�C
range = simplify(range) % ���F���i���²
range = subs(range,[v0,g],[5,9.81]);
fplot(range,[360/8,360*3/8]) % fplot : �ۭq���ø��
title('Range as Function of Angle (a)')
xlabel('Elevantion angle ')
ylabel('Range (m)')

%% Derives an expression for the range of the ball as a function of the elevation angle �cand plots a range-versus-�ccurve.  (b)

clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

syms v0 theta g t % syms ���O�өw�q�Ÿ��ܼ�
x = v0*cosd(theta)*t
y = v0*sind(theta)*t-g*t^2/2
solutions = solve(y,t) % solve �Ѥ�{������
t0 = solutions(2) % solutions(index) ����index��������
range = subs(x,t,t0) % subs(S,OLD,NEW) ��ܱN�Ÿ���F��S�����Ÿ��ܶqOLD�������s����NEW�C
range = simplify(range) % ���F���i���²
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
file = fopen('�u�{�p��P�]�p/Ch1/dat/Datafile01_10.dat','w');
fprintf(file, '  Time (s)    x (m)   y (m)\n');
fprintf(file,'%10.1f %9.3f %9.3f\n',Table');
fclose(file);
% Read from the file
file = fopen('�u�{�p��P�]�p/Ch1/dat/Datafile01_10.dat','r');
fscanf(file, '  Time (s)    x (m)   y (m)\n');
Table = fscanf(file, '  %f %f %f\n',[3,11]);
fclose(file);
% Print on the screen
fprintf( '  Time (s)    x (m)   y (m)\n');
fprintf('%10.1f %9.3f %9.3f\n',Table')

