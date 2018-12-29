fun = @(x,a,b)a.*x.*log10(x)-(1/b).*exp(-((b.*x-b./exp(1)).^4));
x = 0:0.01:1;
y1 = fun(x,3,30);
y2 = fun(x,2.5,36);
y3 = fun(x,2,50);
figure;
plot(y1,x,'k');
hold on
plot(y2,x,'r');
plot(y3,x);
text('Interpreter','latex',...
'String',['$$f(x) = 3xlog_{10}x-\frac{1}{30}e^{-(30x-\frac{30}'...
    '{e})^4}$$'],'Position',[-1.1,0.85],...
'FontSize',18,'color','k');
text('Interpreter','latex',...
'String',['$$g(x) = 2.5xlog_{10}x-\frac{1}{36}e^{-(36x-\frac{36}'...
    '{e})^4}$$'],'Position',[-1.1,0.6],...
'FontSize',18,'color','r');
text('Interpreter','latex',...
'String',['$$h(x) = 2xlog_{10}x-\frac{1}{50}e^{-(50x-\frac{50}'...
    '{e})^4}$$'],'Position',[-1.1,0.35],...
'FontSize',18,'color','b');
axis equal;
axis([-1.2,0,0,1])

%% 單乳房曲面（三維）
[X, Y] = meshgrid(0.01:0.01:1, 0.01:0.01:1);
Z = 11*X.*log10(X).*Y.*(Y-1)+exp(-((25 ...
            *X - 25/exp(1)).^2+(25*Y-25/2).^2).^3)./25;
figure;
surf(Y,Z,X,'FaceColor',[1 0.75 0.65],'linestyle','none');
view([116 30]);
axis equal;
camlight;
lighting phong;  % 設置光照和光照模式
title(['$$F(x,y) = 12.5x(log_{10}x)y(y-1)-\frac{1}{25}'...
    'e^{-[(25x-25/e)^2+(25y-12.5)^2]^3}$$'],...
    'Interpreter','latex','FontSize',18,'color','k');
%% 雙乳房曲面（三維）
[X, Y] = meshgrid(0.01:0.01:1, 0.01:0.01:1);
Zfun =@(x,y)12.5*x.*log10(x).*y.*(y-1)+exp(-((25 ...
            *x - 25/exp(1)).^2+(25*y-25/2).^2).^3)./25;
Z = Zfun(X,Y);
figure;
surf(Y,Z,X,'FaceColor',[1 0.75 0.65],'linestyle','none');
hold on
surf(Y+0.98,Z,X,'FaceColor',[1 0.75 0.65],'linestyle','none');
axis equal;
view([116 30]);
camlight;
lighting phong;  % 設置光照和光照模式