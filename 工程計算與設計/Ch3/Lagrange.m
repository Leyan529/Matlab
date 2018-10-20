%% Lagrange interpolation

t=[0:0.1:14];
x =[0 1 2 6 7 8 10 12 14];
y = [12 45 2 36 72 65 23 69 3];
plot(x,y,'r*');hold on %�ХX�Ҧ���(x,y)�y���I
plot(t,LagrangePol(t,x,y)); % �e�X�I(x1,y1)���I(x2,y2)������Lagrange���u

function y = LagrangePol(x,px,py)
    n = size(px,2) 
    % m = size(X,dim);%��^�x�}����ƩΦC�ơAdim=1��^��ơAdim=2��^�C��
    L=ones(n,size(x,2)); % ones(n1,n2)�@�Ȥ@n1xn2�x�}�A�����Ȭ�1
    for i=1:n
        for j=1:n
            if (i~=j)
                L(i,:) = L(i,:).*(x-px(j))/(px(i)-px(j)); 
                % �p��px�����w�����۹�~�t�A�ç�sLagrange equation coefficient
            end
        end
    end
    y = 0;
    for i=1:n
        y = y + py(i)*L(i,:); % �p����C�@��y���۹��X
    end
end