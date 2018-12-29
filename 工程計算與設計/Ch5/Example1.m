%% Demonstrates the parent-children relationship among graphic objects
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x = linspace(0,2*pi);
y = sin(x);
hCurve = plot(x,y);
hCurve.Parent % .Parent���plot��info
hAxes = hCurve.Parent;
hAxes.Parent
hFigure = hAxes.Parent;
hFigure.Parent
hRoot = hFigure.Parent;
hRoot.Parent
hRoot.Children
hFigure.Children
hAxes.Children
hCurve.Children
% delete(hCurve) % delete : �R��ø�Ϫ���
% delete(hAxes)
% delete(hFigure)
%% Demonstrates the parent-children relationship among graphic objects.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x = linspace(0,2*pi);
figure
axes('XLim', [0,2*pi], 'YLim', [-1,1])
hold on
plot(x, sin(x), x, cos(x))
plot([0,2*pi],[0,0])
hAxes = gca; % gca : ���o�ثe�϶b���s��
hCurve = hAxes.Children % ���o�϶baxes���U�T�Ӥl����
% delete(hCurve(1))
% delete(hCurve(2))
% delete(hAxes)
% delete(gcf)
%% Demonstrates the getting/setting of object properties.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x = linspace(0,2*pi);
hCurve = plot(x, sin(x));
get(hCurve, 'LineWidth') % ���ohCurve��LineWidth�ݩ�
% set(hCurve, 'LineWidth', 2) % LineWidth�ݩʳ]��2
hCurve.LineWidth = 2 % LineWidth�ݩʳ]��2(�P�W)
inspect(hCurve) % inspect�}���ݩ��ˬd��
propedit % propedit�}���ݩʽs�边
get(hCurve)
get(gcf)
get(gca)
%% Demonstrates some properties of Figure objects.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

scrsz = get(groot, 'ScreenSize');
h1 = figure;
    h1.Position = [20, 60, scrsz(3)/5, scrsz(4)/4];
    h1.Name = 'Bottom-left Figure Window';
h2 = figure;
    h2.Visible = 'off';
    h2.Units = 'normalized';
    h2.Position = [0.1, 0.2, 0.3, 0.4];
    h2.Visible = 'on';
    h2.Color = [0.8, 0.8, 0.8];
    h2.Name = 'A Window of Gray Background';
    h2.NumberTitle = 'off';
    h2.ToolBar = 'none';
    h2.MenuBar = 'none';
% delete(h1)
% delete(h2)
%% Demonstrates some properties of Axes objects
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

h = axes;
    xlabel('Time (sec)');
    ylabel('Displacement (mm)');
    title('Displacement vs. Time');
    axis([0, 20, 0, 10000]);
    grid on
    h.Box = 'on';
    h.YScale = 'log'; % �Hlog�����
    h.XTick = [0, 5, 10, 15, 20];
    h.XTickLabel = {'0', 'T', '2T', '3T', '4T'}; %�ק���Label
    h.FontSize = 11;
% delete(h)
% delete(gcf)
%% Demonstrates multiple Axes in a Figure. (pratice)
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

t = linspace(0,0.1); w = 50;
y = sin(w*t);
v = w*cos(w*t);
yyaxis left % �Ыرa��y�b���Ϫ�yyaxis left
hLine1 = plot(t, y);
xlabel('Time (sec)')
ylabel('Displacement (mm)')
yyaxis right % �Ыرa��y�b���Ϫ�yyaxis right
hLine2 = plot(t, v);
ylabel('Velocity (mm/s)')
% delete(hLine2)
% delete(hLine1)
% delete(gca)
% delete(gcf)
%% Demonstrates the scaling of Axes.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

t = linspace(0,2*pi);
plot(cos(t), sin(t))
axis equal
limits = axis;
axis square
axis([limits(1),limits(2),limits(1), limits(2)])
% delete(gca)
% delete(gcf)
%% Demonstrates multiple plots (subplots) in a Figure (pratice sin,cos,tan, sinh.cosh,tanh)
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

t = linspace(0,0.1); w = 50;
y = sin(w*t);
v = w*cos(w*t);
a = -w*w*sin(w*t);
h1 = subplot(2,2,1);
plot(t,y), xlabel('Time'), ylabel('Displacement')
h2 = subplot(2,2,2);
plot(t,v), xlabel('Time'), ylabel('Velocity')
h3 = subplot(2,2,3);
plot(t,a), xlabel('Time'), ylabel('Acceleration')
h4 = subplot(2,2,4);
plot(y,a), xlabel('Displacement'), ylabel('Acceleration')
% delete(h1)
% delete(h2)
% delete(h3)
% delete(h4)
% delete(gcf)
%% Demonstrates the use of line styles, colors, and marker types. (pratice �h�����^�k)
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x1 = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
y1 = [23.9, 18.5, 10.7, 4.31, -0.26, -0.87, 0.82, 4.79, 7.67, 13.7, 23.5];
p = polyfit(x1, y1, 2) 
% polyfit : �H�h������ƴM��t�X���Ƥ����u �䤤�欰�[���ȡAn�����������ơC��X�Ѽ�p�h���h�������Y�ơAS���S�ʯx�}
x2 = linspace(-5,5);
y2 = polyval(p, x2);
% polyval��ƥH���͹w����
h = plot(x1, y1, 'or', x2, y2, '-k');
% delete(h(1))
% delete(h(2))
% delete(gca)
% delete(gcf)
%% Demonstrates additional line properties. (update 5*y) pratice
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x = linspace(0,2*pi);
y = sin(x);
h = plot(x, y);
axis([0, 2*pi, -10, 10])
h.YData = 5*y;
% h.YData = 10*sin(x);
%% Demonstrates some Text properties.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

alpha = linspace(0, pi);
phi = sin(alpha).*cos(alpha);
plot(alpha, phi)
axis([0, pi, -1, 1])
hx = xlabel('\alpha (rad)');
hy = ylabel('\phi(\alpha)');
ht = title('\phi = sin(\alpha)\timescos(\alpha)');
    hx.FontSize = 16;
    hy.FontSize = 16;
    ht.FontSize = 18;
[value, index] = max(phi); % ���phi���̰��Ivalue�Mindex
hmax = text(alpha(index), value, ['Max \phi = ', num2str(value)]);
    hmax.HorizontalAlignment = 'center';
    hmax.VerticalAlignment = 'bottom';
[value, index] = min(phi); % ���phi���̧C�Ivalue�Mindex
hmin = text(alpha(index), value, ['Min \phi = ', num2str(value)]);
    hmin.HorizontalAlignment = 'center';
    hmin.VerticalAlignment = 'top';
% delete(hx)
% delete(hy)
% delete(ht)
% delete(hmax)
% delete(hmin)
% delete(gcf)
%% Demonstrates more Text properties.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x1 = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
y1 = [23.9, 18.5, 10.7, 4.31, -0.26, -0.87, 0.82, 4.79, 7.67, 13.7, 23.5];
p = polyfit(x1, y1, 2)
x2 = linspace(-5,5);
y2 = polyval(p, x2);
h = plot(x1, y1, 'or', x2, y2, '-k');
for k = 1:length(x1)
    txt{k} = sprintf('(%g,%g)', x1(k), y1(k)); % ���ͱ���ܪ�����r��
end
text(x1, y1-0.5, txt, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
%% Modifies Example02_12e to include a Legend in the Figure.
clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����

x = linspace(0,pi/2,20);
n = 4;
k = (1:n);
[X, K] = meshgrid(x, k);
sinx =cumsum(((-1).^(K-1)).*(X .^ (2*K-1))./factorial(2*K-1)) % cumsum��Ƴq�`�Ω�p��@�ӼƲզU�檺�֥[��
plot(x*180/pi, sinx(1,:), '+-', ...
     x*180/pi, sinx(2,:), 'x-', ...
     x*180/pi, sinx(3,:), '*', ...
     x*180/pi, sinx(4,:), 'o', ...
     x*180/pi, sin(x))
title('Approximation of sin(x)')
xlabel('x (deg)')
ylabel('sin(x) (dimensionless)')
h = legend('1 term', '2 terms', '3 terms', '4 terms', 'Exact');
    h.Position = [0.6, 0.2, 0.25, 0.2];
    h.FontSize = 16;
    h.String{5} = 'sin(x)';
    h.Box = 'off';
