%% inline���q
% clc : �M��command window
% clear all �M��WorkSpace�ܼ�
% close all �����Ҧ�����
%=> �i��shortcut �إ߷L���E��

%% �j��+�}�C
for i =1:100:5
    x(i) = i^2;
    y(i) = x(i)^2    
end

%% BMI
high = 1.87
weight = 60

%% �p��BMI
bmi = weight/(high^2)
disp(bmi)