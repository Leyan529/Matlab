%% Demonstrates multiple Axes in a Figure. (pratice)
clc 
clear all 
close all 

x = linspace(0,0.01); w = 50;
tan = (sin(w*x).^2) / (cos(w*x).^2); % calculate tan
arc_tan = 1/((sin(w*x).^2) / (cos(w*x).^2)); % calculate arctan
yyaxis left % �Ыرa��y�b���Ϫ�yyaxis left
hLine1 = plot(x, tan);
xlabel('X')
ylabel('Tan')
yyaxis right % �Ыرa��y�b���Ϫ�yyaxis right
hLine2 = plot(x, arc_tan);
ylabel('arcTan')