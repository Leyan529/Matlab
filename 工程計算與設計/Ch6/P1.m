a1 = animatedline('Color',[0 .8 .8]); % 創建兩條不同顏色的動畫線條
a2 = animatedline('Color',[0 .2 .9]);

axis([0 20 -1 1])
x = linspace(0,20,50000);
for k = 1:length(x);
    % first line
    xk = x(k);
    ysin = sin(xk);
    addpoints(a1,xk,ysin); % 在循環中向線條添加點

    % second line
    ycos = cos(xk);
    addpoints(a2,xk,ycos);

    % update screen
    drawnow limitrate % 在添加新點之後在屏幕上顯示更新
end