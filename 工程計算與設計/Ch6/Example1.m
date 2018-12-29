%% Animates the 3-D line plot in Example05_10.
clear
view(3)
axis([-1, 1, -1, 1, 0, 8*pi])
xlabel x, ylabel y, zlabel z
h = gca; h.BoxStyle = 'full'; box on
grid on
axis vis3d
hold on
z = linspace(0, 8*pi, 200);
x = exp(-z/20).*cos(z);
y = exp(-z/20).*sin(z);
comet3(x,y,z)
%% Animates the 2-D streamlines in Example05_14a.
clear
x = 0:0.1:1; y = 0:0.1:1;
[X,Y] = meshgrid(x,y);
U = 0.3+X; V = 0.4-Y;
quiver(X,Y,U,V)
sx = [0:0.1:1, zeros(1,11), 0:0.1:1];
sy = [zeros(1,11), 0:0.1:1, ones(1,11)];
SL = stream2(X,Y, U,V, sx,sy);
streamline(SL)
streamparticles(SL, ...
    'Animate', 5, ...
    'FrameRate', 30, ...
    'ParticleAlignment', 'on')
sx = zeros(1,11);
sy = 0:0.1:1;
SL = stream2(X,Y, U, V, sx, sy);
streamparticles(SL, ...
    'Animate', 5, ...
    'FrameRate', 30, ...
    'ParticleAlignment', 'on')
%% Animate the 3-D streamlines in Example05_14b.
clear
x = 0:0.1:1; y = 0:0.1:1; z = 0:0.1:1;
[X,Y,Z] = meshgrid(x,y,z);
U = 0.3+X; V = 0.4-Y; W = 0.5-Z;
% quiver3(X,Y,Z,U,V,W)
sx = 0;
sy = 0:0.1:1;
sz = 0:0.1:1;
[Sx, Sy, Sz] = meshgrid(sx,sy,sz);
SL = stream3(X,Y,Z, U,V,W, Sx,Sy,Sz);
streamline(SL)
view(3), axis vis3d, box on
xlabel('x'), ylabel('y'), zlabel('z')
streamparticles(SL, ...
    'Animate', 5, ...
    'FrameRate', 30, ...
    'ParticleAlignment', 'on')

%% Creates a movie to animate an engine and saves the movie as a video file.
clear
n = 50; theta = linspace(0,2*pi,n);
a = 1.1; b = 2.7; c = 0.6; d = 0.4;
aX = a*cos(theta); aY = a*sin(theta);
p = aX+sqrt(b^2-aY.^2);
limits = [-a, a+b+d, -a, a];
cmap = colormap; nc = length(colormap)-1;
for k = 1:n
    plot(aX, aY, 'k:')
    hold on
        cylinderX = [a, a+b+d, a+b+d, a];
        cylinderY = [-c, -c, c, c];
    plot(cylinderX, cylinderY, 'k')
        pistonX = [p(k)-d, p(k)+d, p(k)+d, p(k)-d, p(k)-d];
        pistonY = [-c, -c, c, c, -c];
    fill(pistonX, pistonY, 'c')
        fuelX = [p(k)+d, a+b+d, a+b+d, p(k)+d, p(k)+d];
        fuelY = [-c, -c, c, c, -c];
        color = cmap(ceil((p(k)-b+a)/(2*a)*(nc-1)),:);
    fill(fuelX, fuelY, color)
        crankX = [0, aX(k)];
        crankY = [0, aY(k)];
    plot(crankX, crankY,'ko-', 'LineWidth', 4)
        linkX = [aX(k), p(k)];
        linkY = [aY(k), 0];
    plot(linkX, linkY,'ko-', 'LineWidth', 4)
    axis(limits)
    axis off equal
    Frames(k) = getframe;
    hold off
end
movie(Frames, 5, 30)
videoObj = VideoWriter('工程計算與設計\Ch6\data\Engine');
open(videoObj);
writeVideo(videoObj, Frames);
close(videoObj);
%% Demonstrates the display of an indexed image.
clear
load earth
image(X)
colormap(map)
axis image
%% Demonstrates the creation of a colormap, an indexed image, and some operations of the image.
clear
MyMap = [1, 0, 0;  % 1. Red
         0, 1, 0;  % 2. Green
         0, 0, 1;  % 3. Blue
         1, 1, 1]; % 4. White
MyImage = [1, 2, 3, 4;
           4, 3, 2, 1];
image(MyImage)
colormap(MyMap)
axis image
delete(gcf)
save('工程計算與設計\Ch6\data\Datafile06_04b', 'MyImage', 'MyMap')
clear
load('工程計算與設計\Ch6\data\Datafile06_04b')
image(MyImage)
colormap(MyMap)
axis image
%% Demonstrates the display of a true-color image.
Photo = imread('peppers.png');
image(Photo)
save('工程計算與設計\Ch6\data\peppers.png')
axis image
%% Demonstrates the creation of a true-color image and some operations of the image.
clear
A = zeros(2,4,3);
A(1,1,1:3) = [1 0 0];  % Red
A(1,2,1:3) = [0 1 0];  % Green
A(1,3,1:3) = [0 0 1];  % Blue
A(1,4,1:3) = [1 1 1];  % White
A(2,1,1:3) = [1 1 1];  % White
A(2,2,1:3) = [0 0 1];  % Blue
A(2,3,1:3) = [0 1 0];  % Green
A(2,4,1:3) = [1 0 0];  % Red
image(A), axis image
imwrite(A, '工程計算與設計\Ch6\data\Datafile06_05b.png')
delete(gcf), clear
B = imread('工程計算與設計\Ch6\data\Datafile06_05b.png');
image(B), axis image
%% Demonstrates the play of an audio data and some operations of the audio data.
clear
load handel
sound(y, Fs)
plot(y)
audiowrite('工程計算與設計\Ch6\data\handel.wav', y, Fs)
delete(gcf), clear
[y, Fs] = audioread('工程計算與設計\Ch6\data\handel.wav');
plot(y)
sound(y, Fs)
%% Records the user’s voice, plays back the voice, saves it in a file, reads it from the file, plays back again, and plots the waves of the voice.
clear
recObj = audiorecorder;
menu('Start Recording', 'OK');
record(recObj)
menu('End recording', 'OK');
stop(recObj)
play(recObj);
y = getaudiodata(recObj);
Fs = recObj.SampleRate;
audiowrite('工程計算與設計\Ch6\data\myvoice.wav', y, Fs)
clear
[y, Fs] = audioread('工程計算與設計\Ch6\data\myvoice.wav');
sound(y, Fs)
plot(y)
%% Reads a video file in mp4 format and plays the video using the function movie.
clear
vidObj = VideoReader('xylophone.mp4');
height = vidObj.Height;
width  = vidObj.Width;
rate   = vidObj.FrameRate;
Frames.cdata = zeros(height, width, 3, 'uint8');
Frames.colormap = [];
k = 1;
while hasFrame(vidObj)
    Frames(k).cdata = readFrame(vidObj);
    k = k+1;
end
set(gcf, 'Position', [150, 150, width, height])
set(gca, 'Units', 'pixels')
set(gca, 'Position', [0, 0, width, height])
movie(Frames, 1, rate)
%% Modifies Example04_04 to include an option that plots a truss.
clear
Nodes = struct; Members = struct;
disp(' 1. Input nodal coordinates')
disp(' 2. Input connecting nodes of members')
disp(' 3. Input three supports')
disp(' 4. Input loads')
disp(' 5. Print truss')
disp(' 6. Solve truss')
disp(' 7. Print results')
disp(' 8. Save data')
disp(' 9. Load data')
disp('10. Quit')
disp('11. Plot truss')
while 1
    task = input('Enter the task number: ');
    switch task
        case 1
            Nodes = inputNodes(Nodes);
        case 2
            Members = inputMembers(Members);
        case 3
            Nodes = inputSupports(Nodes);
        case 4
            Nodes = inputLoads(Nodes);
        case 5
            printTruss(Nodes, Members)
        case 6
            [Nodes, Members] = solveTruss(Nodes, Members);
        case 7
            printResults(Nodes, Members)
        case 8
            saveAll(Nodes, Members)
        case 9
            [Nodes, Members] = loadAll;
        case 10
            break
        case 11
            plotTruss(Nodes, Members)
    end
end

function output = inputNodes(Nodes)
while 1
    data = input('Enter [node, x, y] or 0 to stop: ');
    if data(1) == 0
        break
    else
        Nodes(data(1)).x = data(2);
        Nodes(data(1)).y = data(3);
    end
end
output = Nodes;
end

function output = inputMembers(Members)
m = 0;
while 1
    data = input('Enter [node1, node2] or 0 to stop: ');
    if data(1) == 0
        break
    else
        m = m+1;
        Members(m).node1 = data(1);
        Members(m).node2 = data(2);
    end
end
output = Members;
end

function output = inputSupports(Nodes)
for i = 1:size(Nodes,2)
    Nodes(i).supportx = 0;
    Nodes(i).supporty = 0;
end
for k = 1:3
    data = input('Enter [node, dir] (dir: ''x'' or ''y''): ');
    if data(2) == 'x'
        Nodes(data(1)).supportx = 1;
    elseif data(2) == 'y'
        Nodes(data(1)).supporty = 1;
    end
end
output = Nodes;
end

function output = inputLoads(Nodes)
for i = 1:size(Nodes,2)
    Nodes(i).loadx = 0;
    Nodes(i).loady = 0;
end
while 1
    data = input('Enter [node, load-x, load-y] or 0 to stop: ');
    if data(1) == 0
        break
    else
        Nodes(data(1)).loadx = data(2);
        Nodes(data(1)).loady = data(3);
    end
end
output = Nodes;
end

function printTruss(Nodes, Members)
if (size(fieldnames(Nodes),1)<6 || size(fieldnames(Members),1)<2)
    disp('Truss data not complete'); return
end
fprintf('\nNodal Data\n')
fprintf('Node        x        y  Support-x  Support-y   Load-x   Load-y\n')
for k = 1:size(Nodes,2)
    fprintf('%4.0f%9.2f%9.2f%11.0f%11.0f%9.0f%9.0f\n', ...
        k, Nodes(k).x, Nodes(k).y, ...
        Nodes(k).supportx, Nodes(k).supporty, ...
        Nodes(k).loadx, Nodes(k).loady)
end
fprintf('\nMember Data\n')
fprintf('Member  Node1    Node2\n')
for k = 1:size(Members,2)
    fprintf('%4.0f%9.0f%9.0f\n', k, Members(k).node1, Members(k).node2)
end
end

function printResults(Nodes, Members)
if (size(fieldnames(Nodes),1)<8 || size(fieldnames(Members),1)<3)
    disp('Results not available!'), return
end
fprintf('\nReaction Forces\n')
fprintf('Node  Reaction-x  Reaction-y\n')
for k = 1:size(Nodes,2)
    fprintf('%4.0f%12.2f%12.2f\n', k, Nodes(k).reactionx, Nodes(k).reactiony)
end
fprintf('\nMember Forces\n')
fprintf('Member     Force\n')
for k = 1:size(Members,2)
    fprintf('%4.0f%12.2f\n', k, Members(k).force)
end
end

function saveAll(Nodes, Members)
fileName = input('Enter file name (default Datafile): ', 's');
if isempty(fileName)
    fileName = 'Datafile';
end
save(fileName, 'Nodes', 'Members')
end

function [Nodes, Members] = loadAll
fileName = input('Enter file name (default Datafile): ', 's');
if isempty(fileName)
    fileName = 'Datafile';
end
load(fileName)
end

function [outNodes, outMembers] = solveTruss(Nodes, Members)
n = size(Nodes,2); m = size(Members,2);
if (m+3) < 2*n
    disp('Unstable!')
    outNodes = 0; outMembers = 0; return
elseif (m+3) > 2*n
    disp('Statically indeterminate!')
    outNodes = 0; outMembers = 0; return
end
A = zeros(2*n, 2*n); loads = zeros(2*n,1); nsupport = 0;
for i = 1:n
    for j = 1:m
        if Members(j).node1 == i || Members(j).node2 == i
            if Members(j).node1 == i
                n1 = i; n2 = Members(j).node2;
            elseif Members(j).node2 == i
                n1 = i; n2 = Members(j).node1;
            end
            x1 = Nodes(n1).x; y1 = Nodes(n1).y;
            x2 = Nodes(n2).x; y2 = Nodes(n2).y;
            L = sqrt((x2-x1)^2+(y2-y1)^2);
            A(2*i-1,j) = (x2-x1)/L;
            A(2*i,  j) = (y2-y1)/L;
        end
    end
    if (Nodes(i).supportx == 1)
        nsupport = nsupport+1;
        A(2*i-1,m+nsupport) = 1;
    end
    if (Nodes(i).supporty == 1)
        nsupport = nsupport+1;
        A(2*i, m+nsupport) = 1;
    end
    loads(2*i-1) = -Nodes(i).loadx;
    loads(2*i)   = -Nodes(i).loady;
end
forces = A\loads;
for j = 1:m
    Members(j).force = forces(j);
end
nsupport = 0;
for i = 1:n
    Nodes(i).reactionx = 0;
    Nodes(i).reactiony = 0;
    if (Nodes(i).supportx == 1)
        nsupport = nsupport+1;
        Nodes(i).reactionx = forces(m+nsupport);
    end
    if (Nodes(i).supporty == 1)
        nsupport = nsupport+1;
        Nodes(i).reactiony = forces(m+nsupport);
    end
end
outNodes = Nodes; outMembers = Members;
disp('Solved successfully.')
end

function plotTruss(Nodes, Members)
if (size(fieldnames(Nodes),1)<6 || size(fieldnames(Members),1)<2)
    disp('Truss data not complete'); return
end
n = length(Nodes); m = length(Members);
minX = Nodes(1).x; maxX = Nodes(1).x;
minY = Nodes(1).y; maxY = Nodes(1).y;
for k = 2:n
    if (Nodes(k).x < minX) minX = Nodes(k).x; end
    if (Nodes(k).x > maxX) maxX = Nodes(k).x; end
    if (Nodes(k).y < minY) minY = Nodes(k).y; end
    if (Nodes(k).y > maxY) maxY = Nodes(k).y; end
end
rangeX = maxX-minX; rangeY = maxY-minY;
axis([minX-rangeX/5, maxX+rangeX/5, minY-rangeY/5, maxY+rangeY/5])
ha = gca; delete(ha.Children)
axis equal off
hold on
for k = 1:m
    n1 = Members(k).node1; n2 = Members(k).node2;
    x = [Nodes(n1).x, Nodes(n2).x];
    y = [Nodes(n1).y, Nodes(n2).y];
    plot(x,y,'k-o', 'MarkerFaceColor', 'k')
end
for k = 1:n
    if Nodes(k).supportx
        x = [Nodes(k).x, Nodes(k).x-rangeX/20, Nodes(k).x-rangeX/20, Nodes(k).x];
        y = [Nodes(k).y, Nodes(k).y+rangeX/40, Nodes(k).y-rangeX/40, Nodes(k).y];
        plot(x,y,'k-')
    end
    if Nodes(k).supporty
        x = [Nodes(k).x, Nodes(k).x-rangeX/40, Nodes(k).x+rangeX/40, Nodes(k).x];
        y = [Nodes(k).y, Nodes(k).y-rangeX/20, Nodes(k).y-rangeX/20, Nodes(k).y];
        plot(x,y,'k-')
    end
end
end