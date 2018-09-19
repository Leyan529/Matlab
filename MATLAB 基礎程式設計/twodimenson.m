%% PUBLISH 產出報表
% *Section可新增區塊*

%% 二維平面繪圖 a
x = linspace(0,2*pi);
plot(x,sin(x),x,cos(x),x,sin(x)+cos(x));
%% 二維平面繪圖 b
y = peaks;					% 產生一個 49×49 的矩陣  
plot(y);	
%% 二維平面繪圖 c
x = peaks;  
y = x';		% 求矩陣 x 的轉置矩陣 x'  
plot(x, y);	% 取用矩陣 x 的每一行向量，與對應矩陣 y 的每一個行向量作圖

%% 三維平面繪圖
z = [0 2 1; 3 2 4; 4 4 4; 7 6 8];
mesh(z);   %mesh 可畫出立體的「網狀圖」
xlabel('X 軸 = column index');	% X 軸的說明文字
ylabel('Y 軸 = row index');	% Y 軸的說明文字
%colormap(zeros(1,3));		% 以黑色呈現
