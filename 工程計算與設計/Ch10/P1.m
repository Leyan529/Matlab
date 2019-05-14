%% 二維散佈點內插法

% griddata主要的作用是插值網格數據，與interp2功能相同
% 在本練習中以此函數實作二維亂數分布內插

x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'cubic');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;
%% 'nearest'：鄰近點內插法
x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'nearest');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;
%%  'linear'：線性內插法
x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'linear');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;


%% 'spline'：片段式的三次 Spline 內插法
x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'spline');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;
%% 'pchip'：保持形狀的片段式三次內插
x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'pchip');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;
%% 'cubic'：和'pchip' 一樣
x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'cubic');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;
%% 'v5cubic'：MATLAB 5 所用的三次內插法
x = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
y = 6*rand(100, 1)-3;	% [-3, 3] 之間的 100 個均勻分佈亂數  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'linear');
mesh(xi, yi, zi);			             % 畫出曲面
hold on; plot3(x, y, z, 'o'); hold off		% 畫出資料點
axis tight; hidden off;




