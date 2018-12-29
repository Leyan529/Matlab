clc % �M��command window
clear all % �M��WorkSpace�ܼ�
close all %  �����Ҧ�����
x1 = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
y1 = 3*x1.^8 +7*x1.^5 + 5*x1.^3 + 2*x1  
% f(x) = 3(x^8)+7(x^5)+5(x^3)+2x
% polyfit : �H�h������ƴM��t�X���Ƥ����u �䤤�欰�[���ȡAn�����������ơC��X�Ѽ�p�h���h�������Y�ơAS���S�ʯx�}
x = linspace(-5,5);
y2 = polyval(polyfit(x1, y1, 8), x);
y3 = polyval(polyfit(x1, y1, 6), x);
y4 = polyval(polyfit(x1, y1, 4), x);
y5 = polyval(polyfit(x1, y1, 2), x);
y6 = polyval(polyfit(x1, y1, 0), x);
% polyval��ƥH���͹w����
h = plot(x1, y1, 'o',... 
x, y2, '-k',...
x, y3, '-r',...
x, y4, '-g',...
x, y5, '-b',...
x, y6, '-p');
legend('points','degree 8','degree 6','degree 4','degree 2','degree 0')
title('�h�����������Ƥ����')