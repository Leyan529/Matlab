%% Creates a graphical user interface for the ballthrowing program.
global g velocityBox angleBox
g = 9.81;
figure('position',[30,70,500,400]) % figure('PropertyName',PropertyValue,...) 
axes('Units','pixels','Position',[50,80,250,250]) % axes(tag,title,units)
axis([0,10,0,10])
xlabel('Distance (m)'),ylabel('Height (m)')
title('Trajectory of a Ball')

uicontrol('Style','text','String','Initial velocity (m/s)','Position',[330,300,150,20]) % uicontrol('PropertyName',PropertyValue,...)
velocityBox = uicontrol('Style','edit','String','5','Position',[363,280,80,20]);
uicontrol('Style','text','String','Elevantion angle','Position',[330,240,150,20])
angleBox = uicontrol('Style','edit','String','45','Position',[363,220,80,20]);
uicontrol('Style','pushbutton','String','Throw','Position',[363,150,80,30],'Callback',@pushbuttonCallback)

function pushbuttonCallback(pushButton, ~)
global g velocityBox angleBox
v0 = str2double(velocityBox.String);
theta = str2double(angleBox.String)*pi/180;
t1 = 2*v0*sin(theta)/g;
t = 0:0.01:t1;
x = v0*cos(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;
hold on % 保持原有圖形
comet(x, y) % 繪製質點運動軌跡
end