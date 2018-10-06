%%%%%%%%%%%%START%%%%%%%% 
clc; clear; close all;
h = input('請輸入串列長度') %% 假設有h個數字要排列
max = input('請輸入大於0的最大值')

disp('初始亂數資料')
w = ceil(max.*rand(1,h)) %% 以亂數隨機出現h個小於max的數字列w 
for n=1:h-1 
    for i=1:h-1 
        if(w(i)<=w(i+1)) % bubble sort
            c=w(i+1); 
            w(i+1)=w(i); 
            w(i)=c; 
        end 
    end
    fprintf('第 %d 次sort \n', n)
    w
end 
disp('最後出來的結果')
w %% 最後出來的結果