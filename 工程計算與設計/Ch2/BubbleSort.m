%%%%%%%%%%%%START%%%%%%%% 
clc; clear; close all;
h = input('�п�J��C����') %% ���]��h�ӼƦr�n�ƦC
max = input('�п�J�j��0���̤j��')

disp('��l�üƸ��')
w = ceil(max.*rand(1,h)) %% �H�ü��H���X�{h�Ӥp��max���Ʀr�Cw 
for n=1:h-1 
    for i=1:h-1 
        if(w(i)<=w(i+1)) % bubble sort
            c=w(i+1); 
            w(i+1)=w(i); 
            w(i)=c; 
        end 
    end
    fprintf('�� %d ��sort \n', n)
    w
end 
disp('�̫�X�Ӫ����G')
w %% �̫�X�Ӫ����G