a1 = animatedline('Color',[0 .8 .8]); % �Ыب�����P�C�⪺�ʵe�u��
a2 = animatedline('Color',[0 .2 .9]);

axis([0 20 -1 1])
x = linspace(0,20,50000);
for k = 1:length(x);
    % first line
    xk = x(k);
    ysin = sin(xk);
    addpoints(a1,xk,ysin); % �b�`�����V�u���K�[�I

    % second line
    ycos = cos(xk);
    addpoints(a2,xk,ycos);

    % update screen
    drawnow limitrate % �b�K�[�s�I����b�̹��W��ܧ�s
end