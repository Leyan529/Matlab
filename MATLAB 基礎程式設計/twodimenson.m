%% PUBLISH ���X����
% *Section�i�s�W�϶�*

%% �G������ø�� a
x = linspace(0,2*pi);
plot(x,sin(x),x,cos(x),x,sin(x)+cos(x));
%% �G������ø�� b
y = peaks;					% ���ͤ@�� 49��49 ���x�}  
plot(y);	
%% �G������ø�� c
x = peaks;  
y = x';		% �D�x�} x ����m�x�} x'  
plot(x, y);	% ���ίx�} x ���C�@��V�q�A�P�����x�} y ���C�@�Ӧ�V�q�@��

%% �T������ø��
z = [0 2 1; 3 2 4; 4 4 4; 7 6 8];
mesh(z);   %mesh �i�e�X���骺�u�����ϡv
xlabel('X �b = column index');	% X �b��������r
ylabel('Y �b = row index');	% Y �b��������r
%colormap(zeros(1,3));		% �H�¦�e�{
