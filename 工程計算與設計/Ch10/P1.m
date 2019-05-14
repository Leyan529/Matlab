%% �G�����G�I�����k

% griddata�D�n���@�άO���Ⱥ���ƾڡA�Pinterp2�\��ۦP
% �b���m�ߤ��H����ƹ�@�G���üƤ�������

x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'cubic');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;
%% 'nearest'�G�F���I�����k
x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'nearest');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;
%%  'linear'�G�u�ʤ����k
x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'linear');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;


%% 'spline'�G���q�����T�� Spline �����k
x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'spline');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;
%% 'pchip'�G�O���Ϊ������q���T������
x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'pchip');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;
%% 'cubic'�G�M'pchip' �@��
x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'cubic');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;
%% 'v5cubic'�GMATLAB 5 �ҥΪ��T�������k
x = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
y = 6*rand(100, 1)-3;	% [-3, 3] ������ 100 �ӧ��ä��G�ü�  
z = peaks(x, y);  
[xi, yi] = meshgrid(-3:0.2:3, -3:0.2:3);  
zi = griddata(x, y, z, xi, yi,'linear');
mesh(xi, yi, zi);			             % �e�X����
hold on; plot3(x, y, z, 'o'); hold off		% �e�X����I
axis tight; hidden off;




