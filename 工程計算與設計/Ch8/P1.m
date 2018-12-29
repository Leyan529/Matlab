%% Creates a GUI for the previous program, using App Designer.
clear
%% �ϥ�GUI����h������������
clear
Example08_06()
function Example08_06
figure('Position', [50, 50, 400, 400], ...
    'Name', 'Slider Demo', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off')
axes('Position', [.1 .5 .8 .4])
omega = 1;
spiral_curve(omega); %% �ϥ�GUI����spiral curve
% ploy_plot(omega);
hEdit = uicontrol('Style', 'edit', ...
    'String', num2str(omega), ...
    'Callback', @cbEdit, ...
    'Units', 'normalized', ...
    'Position', [.4 .3 .2 .05]);
hSlider = uicontrol('Style', 'slider', ...
    'Callback', @cbSlider, ...
    'Units', 'normalized', ...
    'Position', [.2 .1 .6 .05], ...
    'Value', 1, ...
    'Min', 0, ...
    'Max', 100, ...
    'SliderStep', [0.01, 0.1]);

    function cbEdit(h, ~)
        omega = str2double(h.String);
        hSlider.Value = omega;
        spiral_curve(omega);
    end

    function cbSlider(h, ~)
        omega = h.Value;
        hEdit.String = num2str(omega);
        spiral_curve(omega);
%         ploy_plot(omega); %% �ϥ�GUI����h������������
    end

    function spiral_curve(omega)
        t = linspace(0, 2*pi);
        theta = 0:10:990;
        x= cosd(omega*t);
        y= sind(omega*t);
        z = theta/(pi);
        plot3(x,y,z,'r')
    end

    function ploy_plot(omega)
        x1 = [-5 -4 -3 -2 -1 0 1 2 3 4 5];
        y1 = 3*x1.^8 +7*x1.^5 + 5*x1.^3 + 2*x1;  
        % f(x) = 3(x^8)+7(x^5)+5(x^3)+2x
        % polyfit : �H�h������ƴM��t�X���Ƥ����u �䤤�欰�[���ȡAn�����������ơC��X�Ѽ�p�h���h�������Y�ơAS���S�ʯx�}
        x = linspace(-5,5);
        y2 = polyval(polyfit(x1, y1, round(omega)), x);
        plot(x1, y1, 'o',x, y2, '-k') 
        
    end
end

