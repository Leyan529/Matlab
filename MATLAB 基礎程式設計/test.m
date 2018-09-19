%% inline分段
% clc : 清除command window
% clear all 清除WorkSpace變數
% close all 關閉所有視窗
%=> 可用shortcut 建立微型聚集

%% 迴圈+陣列
for i =1:100:5
    x(i) = i^2;
    y(i) = x(i)^2    
end

%% BMI
high = 1.87
weight = 60

%% 計算BMI
bmi = weight/(high^2)
disp(bmi)