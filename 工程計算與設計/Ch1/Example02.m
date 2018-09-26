%% Runs a program in blocks
%Initial
v0 = 5; theta = 45; g = 9.81;
t = 0:0.1:1;
x = v0*cosd(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;
Table = [t;x;y];
% Write to file
file = fopen('工程計算與設計/Ch1/dat/Datafile01_11.dat','w+');
fprintf(file, '\n Time (s)   Distance (m)   Height (m)\n');
fprintf(file, '%8.1f %13.4f %13.4f\n',Table);
fclose(file);
% Read from file
file = fopen('工程計算與設計/Ch1/dat/Datafile01_11.dat','r+');
fscanf(file, '\n Time (s)   Distance (m)   Height (m)\n');
Table = fscanf(file,'%f %f %f\n',[3,11]); % [rows,cols]
fclose(file);
% Print on screen
fprintf('\n Time (s)   Distance (m)   Height (m)\n');
fprintf('%8.1f %13.4f %13.4f\n',Table);
%% Creates a trajectory table, saves all the variables to a MAT file, loads the variables from the MAT file, and prints the table on the screen.
v0 = 5; theta = 45; g = 9.81;
t = 0:0.1:1;
x = v0*cosd(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;
Table = [t;x;y];
% Write to file
save('工程計算與設計/Ch1/dat/Datafile01_12');
% Read from file
clear
load('工程計算與設計/Ch1/dat/Datafile01_12');
% Print on screen
fprintf('\n Time (s)   x (m)   y (m)\n');
fprintf('%10.1f %9.3f %9.3f\n',Table);
%% Reads an image file, displays the image on the screen, loads a sound file, plays the sound, and plots the sound audio signals.
photo = imread('工程計算與設計/Ch1/dat/text.png');
image(photo)
axis image
load handel %聲音訊號y 和取樣頻率Fs 都事先儲存在handel.mat 檔案中
% sound(y,Fs); % 播放此音訊
plot(y)
%% Creates a trajectory table and prints the table using a for-loop.
v0 = 5; theta = 45; g = 9.81;
fprintf('\n Time (s)   x (m)   y (m)\n');
for t = 0:0.1:1
    x = v0*cosd(theta)*t;
    y = v0*sind(theta)*t-g*t.^2/2;
    fprintf('%10.1f %9.3f %9.3f\n',t,x,y);
end
%% Creates a trajectory table and prints the table, using user-defined functions.
global g
v0 = 5;theta=45; g=9.81;
t = 0:0.1:1;
[distance,height] = generateTable(v0,theta,t);
printTable(t,distance,height);
%% Creates a trajectory table and prints the table using cell arrays.
v0 = 5; theta = 45; g = 9.81;
t = 0:0.1:1;
x = v0* cosd(theta)*t;
y = v0*sind(theta)*t-g*t.^2/2;
Trajectory = {v0,theta,t,x,y}
printTrajectory1(Trajectory)

%% Creates a trajectory table and prints the table using structure data.
v0 = 5; theta = 45; g = 9.81;
t = 0:0.1:1;
x = v0* cosd(theta)*t;
y = v0*sind(theta)*t-g*t.^2/2;
Trajectory.velocity = v0
Trajectory.angle = theta;
Trajectory.time = t;
Trajectory.distance = x ;
Trajectory.height = y;
printTrajectory2(Trajectory)

% function [輸出變數]=Name_of_function(輸入參數)
function [x,y] = generateTable(v0,angle,time)
    global g
    x = v0*cosd(angle)*time;
    y = v0*sind(angle)*time-g*time.^2/2;
end
function [x,y] = printTable(t,x,y)
fprintf('Time (s)   x(m)    y (m)\n');
    for k = 1:length(t)
        fprintf('%10.1f %9.3f %9.3f\n', t(k),x(k),y(k))
    end
end
function printTrajectory1 (Traj)
    fprintf('Initial velocity = %0.f m/s\n',Traj{1})
    fprintf('Elevation angle = %0.f degrees\n\n',Traj{2})
    fprintf('Time (s)   x(m)    y (m)\n')
    for k =1:length(Traj{3})
        fprintf('%10.1f %9.3f %9.3f\n', Traj{3}(k),Traj{4}(k),Traj{5}(k))
    end
end

function printTrajectory2 (Traj)
    fprintf('Initial velocity = %0.f m/s\n',Traj.velocity)
    fprintf('Elevation angle = %0.f degrees\n\n',Traj.angle)
    fprintf(' Time (s)  x(m)    y (m)\n');
    for k = 1:length(Traj.time)
        fprintf('%10.1f %9.3f %9.3f\n',Traj.time(k),Traj.distance(k),Traj.height(k))
    end    
end
    
