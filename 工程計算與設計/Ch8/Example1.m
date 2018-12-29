%% Implements a GUI version of Example02_11b
clear
answer = inputdlg({'Side-1', 'Side-2', 'Side-3'}, ...
    'Input data', 1, {'5', '6', '7'});
s = str2double(answer);
s = sort(s); a = s(1); b = s(2); c = s(3);
if (a+b) <= c
    errordlg('Triangle does not exsist', 'Error!', 'modal')
else
    alpha = acosd((b^2+c^2-a^2)/(2*b*c));
    beta  = acosd((c^2+a^2-b^2)/(2*c*a));
    gamma = acosd((a^2+b^2-c^2)/(2*a*b));
    message = sprintf('Three angles are %.2f, %.2f, and %.2f degrees.', ...
        alpha, beta, gamma);
    msgbox(message, 'Output data', 'modal')
end
%% Voice Recorder - Implements a GUI version of Example06_06b.
clear
y = [];
while 1
    choice = menu('Voice Recorder', ...
        'Start', 'End', 'Play', 'Save', 'Load');
    switch choice
        case 0  % The user clicks the close button
            break
        case 1  % Start recording
            recObj = audiorecorder;
            record(recObj)
        case 2  % End recording
            stop(recObj)
            y = getaudiodata(recObj);
            Fs = recObj.SampleRate;
        case 3  % Play
            if isempty(y)
                errordlg('Empty!','Error!','modal')
            else
                sound(y, Fs);
            end
        case 4  % Save
            if isempty(y)
                errordlg('Empty!','Error!','modal')
            else
                [file, path] = uiputfile('*.wav');
                if file
                    audiowrite([path, file], y, Fs)
                end
            end
        case 5  % Load
            [file, path] = uigetfile('*.wav');
            if file
                [y, Fs] = audioread([path, file]);
            end
    end
end
%% Voice Recorder - Enhances the Voice Recorder by using UI-Controls
function Example08_02
y = []; Fs = 0; recObj = [];
figure('Position', [300, 300, 200, 300], ...
    'Name', 'Voice Recorder', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off');
uicontrol('Style', 'pushbutton', ...
    'String', 'Start', ...
    'Position', [50, 250, 100, 20], ...
    'Callback', @cbStart)
uicontrol('Style', 'pushbutton', ...
    'String', 'End', ...
    'Position', [50, 210, 100, 20], ...
    'Callback', @cbEnd)
uicontrol('Style', 'pushbutton', ...
    'String', 'Play', ...
    'Position', [50, 170, 100, 20], ...
    'Callback', @cbPlay)
uicontrol('Style', 'pushbutton', ...
    'String', 'Save', ...
    'Position', [50, 130, 100, 20], ...
    'Callback', @cbSave)
uicontrol('Style', 'pushbutton', ...
    'String', 'Load', ...
    'Position', [50, 90, 100, 20], ...
    'Callback', @cbLoad)
uicontrol('Style', 'pushbutton', ...
    'String', 'Quit', ...
    'Position', [50, 50, 100, 20], ...
    'Callback', @cbQuit)

    function cbStart(~, ~)
        recObj = audiorecorder;
        record(recObj)
    end

    function cbEnd(~, ~)
        stop(recObj)
        y = getaudiodata(recObj);
        Fs = recObj.SampleRate;
    end

    function cbPlay(~, ~)
        if isempty(y)
            errordlg('Empty voice!', 'modal')
        else
            sound(y, Fs);
        end
    end

    function cbSave(~, ~)
        if isempty(y)
            errordlg('Empty voice!', 'modal')
        else
            [file, path] = uiputfile('*.wav');
            if file
                audiowrite([path, file], y, Fs)
            end
        end
    end

    function cbLoad(~, ~)
        [file, path] = uigetfile('*.wav');
        if file
            [y, Fs] = audioread([path, file]);
        end
    end

    function cbQuit(~, ~)
        close
    end
end
%% Image Viewer - Opens and displays an image file. 
function Example08_03
Photo = [];
figure('Position', [30, 30, 600, 400], ...
    'Name', 'Image Viewer', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off');
axes('Position', [.1 .1 .7 .8]);
uicontrol('Style', 'pushbutton', ...
    'String', 'Open...', ...
    'Callback', @cbOpen, ...
    'Units', 'normalized', ...
    'Position', [.825, .6, .15, .1])
hSaveAs = uicontrol('Style', 'pushbutton', ...
    'String', 'Save As...', ...
    'Callback', @cbSaveAs, ...
    'Enable', 'off', ...
    'Units', 'normalized', ...
    'Position', [.825, .4, .15, .1]);
uicontrol('Style', 'pushbutton', ...
    'String', 'Quit', ...
    'Callback', 'close', ...
    'Units', 'normalized', ...
    'Position', [.825, .2, .15, .1])

    function cbOpen(~, ~)
        [file, path] = uigetfile( ...
        {'*.png', 'Portable Network Graphics (*.png)'; ...
         '*.jpg;*.jpeg', 'Joint Photographic Experts Group (*.jpg;*.jpeg)'; ...
         '*.tif;*.tiff', 'Tagged Image File Format (*.tif;*.tiff)'});
        if file
            Photo = imread([path, file]);
            image(Photo);
            axis off image
            hSaveAs.Enable = 'on';
        end
    end

    function cbSaveAs(~, ~)
        [file, path] = uiputfile( ...
        {'*.png', 'Portable Network Graphics (*.png)'; ...
         '*.jpg', 'Joint Photographic Experts Group (*.jpg)'; ...
         '*.tif', 'Tagged Image File Format (*.tif)'});
        if file
            imwrite(Photo, [path, file])
        end
    end
end
%% Image Viewer - Implements an Image Viewer using pulldown menus. 
function Example08_04
Photo = [];
figure('Position', [30, 30, 600, 400], ...
    'Name', 'Image Viewer', ...
    'ToolBar', 'none', ...
    'NumberTitle', 'off');
axes('Position', [.15 .1 .7 .8]);
hImage = uimenu('Label', 'Image');
    uimenu(hImage, 'Label', 'Open...', 'Callback', @cbOpen)
    hSaveAs = uimenu(hImage, 'Label', 'Save As', 'Enable', 'off');
        hPNG = uimenu(hSaveAs, 'Label', 'PNG', 'Callback', @cbSaveAs);
        hJPG = uimenu(hSaveAs, 'Label', 'JPG', 'Callback', @cbSaveAs);
        hTIF = uimenu(hSaveAs, 'Label', 'TIF', 'Callback', @cbSaveAs);
    uimenu(hImage, 'Label', 'Quit', 'Callback', 'close')

    function cbOpen(~, ~)
        [file, path] = uigetfile( ...
        {'*.png', 'Portable Network Graphics (*.png)'; ...
         '*.jpg;*.jpeg', 'Joint Photographic Experts Group (*.jpg;*.jpeg)'; ...
         '*.tif;*.tiff', 'Tagged Image File Format (*.tif;*.tiff)'});
        if file
            Photo = imread([path, file]);
            image(Photo);
            axis off image
            hSaveAs.Enable = 'on';
        end
    end

    function cbSaveAs(h, ~)
        if h == hPNG
            [file, path] = uiputfile({'*.png', 'Portable Network Graphics (*.png)'});
        elseif h == hJPG
            [file, path] = uiputfile({'*.jpg', 'Joint Photographic Experts Group (*.jpg)'});
        else
            [file, path] = uiputfile({'*.tif', 'Tagged Image File Format (*.tif)'});
        end
        if file
            imwrite(Photo, [path, file])
        end
    end
end
%% Sorting and Searching - Implements a GUI version of Example03_13. 
function Example08_05
figure('Position', [30, 30, 400, 400], ...
    'Name', 'Sorting and Searching', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off', ...
    'Resize', 'off')
uicontrol('Style', 'text', ...
    'String', 'List of Numbers', ...
    'Units', 'normalized', ...
    'Position', [.1 .8 .25 .1])
hList = uicontrol('Style', 'listbox', ...
    'Units', 'normalized', ...
    'Position', [.1 .1 .25 .75]);
hPanel1 = uipanel('Position', [.4 .725 .55 .2]);
    uicontrol(hPanel1, 'Style', 'text', ...
        'String', 'Enter a Number', ...
        'Units', 'normalized', ...
        'Position', [.1 .6 .35 .2])
    uicontrol(hPanel1, 'Style', 'edit', ...
        'Callback', @cbEnter, ...
        'Units', 'normalized', ...
        'Position', [.1 .1 .35 .4])
    hSort = uicontrol(hPanel1, 'Style', 'checkbox', ...
        'String', 'Sort', ...
        'Callback', @cbSort, ...
        'Value', true, ...
        'Units', 'Normalized', ...
        'Position', [.6 .4 .35 .2]);
hPanel2 = uipanel('Position', [.4 .4 .55 .3]);
    uicontrol(hPanel2, 'Style', 'text', ...
        'String', 'Find a Number', ...
        'Units', 'Normalized', ...
        'Position', [.1 .6 .35 .2])
    hFind = uicontrol(hPanel2, 'Style', 'edit', ...
        'Callback', @cbFind, ...
        'Enable', 'off', ...
        'Units', 'normalized', ...
        'Position', [.1 .35 .35 .25]);
    hGroup = uibuttongroup(hPanel2, ...
        'Position', [.5, .2, .45, .6]);
        uicontrol(hGroup, 'Style', 'radiobutton', ...
            'String', 'Keep', ...
            'Value', true, ...
            'Units', 'normalized', ...
            'Position', [.2 .6 .7 .3])
        hRemove = uicontrol(hGroup, 'Style', 'radiobutton', ...
            'String', 'Remove', ...
            'Units', 'normalized', ...
            'Position', [.2 .1 .7 .3]);
uicontrol('Style', 'pushbutton', ...
    'String', 'Open...', ...
    'Callback', @cbOpen, ...
    'Units', 'normalized', ...
    'Position', [.45 .3 .2 .075])
hSaveAs = uicontrol('Style', 'pushbutton', ...
    'String', 'Save As...', ...
    'Callback', @cbSaveAs, ...
    'Enable', 'off', ...
    'Units', 'normalized', ...
    'Position', [.45 .2 .2 .075]);
uicontrol('Style', 'pushbutton', ...
    'String', 'Quit', ...
    'Callback', 'close', ...
    'Units', 'Normalized', ...
    'Position', [.45 .1 .2 .075]);

    function cbEnter(h, ~)
        number = str2double(h.String);
        h.String = [];
        if isempty(hList.String)
            a = [];
        else
            a = str2double(hList.String);
        end
        if search(a, number) > 0
            errordlg('The number exists!')
        else
            a(length(a)+1) = number;
            if hSort.Value
                a = sort(a);
            end
            hList.String = num2cell(a);
        end
        hSaveAs.Enable = 'on';
        hFind.Enable = 'on';
    end

    function cbSort(~, ~)
        a = str2double(hList.String);
        if hSort.Value && ~isempty(a)
            a = sort(a);
            hList.String = num2cell(a);
        end
    end

    function cbFind(h, ~)
        number = str2double(h.String);
        h.String = [];
        a = str2double(hList.String);
        k = search(a, number);
        if k == 0
            errordlg('The number not exist!')
        else
            hList.Value = k;
            if hRemove.Value
                n = length(a);
                b(1:n-1,1) = [a(1:k-1);a(k+1:n)];
                hList.String = num2cell(b);
            end
        end
    end

    function cbOpen(~, ~)
        [file, path] = uigetfile('*.mat');
        if file
            load([path, file], 'a');
            hList.String = num2cell(a);
            hSaveAs.Enable = 'on';
            hFind.Enable = 'on';
        end
    end

    function cbSaveAs(~, ~)
        [file, path] = uiputfile('*.mat');
        if file
            a = str2double(hList.String);
            save([path, file], 'a');
        end
    end
end

function out = sort(a)
n = length(a);
for i = n-1:-1:1
    for j = 1:i
        if a(j) > a(j+1)
            tmp = a(j);
            a(j) = a(j+1);
            a(j+1) = tmp;
        end
    end
end
out = a;
end

function found = search(a, key)
n = length(a);
low = 1;
high = n;
found = 0;
while low <= high && ~found
    mid = floor((low+high)/2);
    if key == a(mid)
        found = mid;
    elseif key < a(mid)
        high = mid-1;
    else
        low = mid+1;
    end
end
end
%% Demonstrates the use of a slider to change the value of an input data.
function Example08_06
figure('Position', [50, 50, 400, 400], ...
    'Name', 'Slider Demo', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off')
axes('Position', [.1 .5 .8 .4])
omega = 1;
sinewave(omega);
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
    'Max', 10, ...
    'SliderStep', [0.01, 0.1]);

    function cbEdit(h, ~)
        omega = str2double(h.String);
        hSlider.Value = omega;
        sinewave(omega);
    end

    function cbSlider(h, ~)
        omega = h.Value;
        hEdit.String = num2str(omega);
        sinewave(omega);
    end

    function sinewave(omega)
        t = linspace(0, 2*pi);
        y = sin(omega*t);
        plot(t, y)
        axis([0, 2*pi, -1, 1])
    end
end
%% Demonstrate the use of UI-table to input the truss data.
function Example08_07a
Nodes = struct('x', 0, 'y', 0, ...
    'supportx', false, 'supporty', false, ...
    'loadx', 0, 'loady', 0, ...
    'reactionx', 0, 'reaction', 0);
figure('Position', [30, 30, 590, 200], ...
    'Name', 'Nodal Data', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off')
data = struct2cell(Nodes)';
columnName = {'X', 'Y', 'SupportX', 'SupportY', ...
    'LoadX', 'LoadY', 'ReactionX', 'ReactionY'};
columnFormat = {'numeric', 'numeric', ...
    'logical', 'logical', ...
    'numeric', 'numeric', 'numeric', 'numeric'};
columnEditable = logical([1 1 1 1 1 1 0 0]);
uitable('Data', data, ...
    'KeyPressFcn', @cbKeyPressNodes, ...
    'ColumnName', columnName, ...
    'ColumnFormat', columnFormat, ...
    'ColumnEditable', columnEditable, ...
    'ColumnWidth', {60}, ...
    'Units', 'normalized', ...
    'Position', [.05 .1 .9 .8]);

    function cbKeyPressNodes(hTable, hKey)
        if strcmpi(hKey.Key, 'downarrow')
            n = size(hTable.Data, 1);
            hTable.Data(n+1,:) = {0 0 false false 0 0 0 0};
        end
    end
end
function Example08_07b
Members = struct('node1', 0, 'node2', 0, 'force', 0);
figure('Position', [30, 30, 260, 200], ...
    'Name', 'Member Data', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off')
uitable('Data', struct2cell(Members)', ...
    'KeyPressFcn', @cbKeyPressMembers, ...
    'ColumnName', {'Node1', 'Node2', 'Force'}, ...
    'ColumnEditable', logical([1 1 0]), ...
    'ColumnWidth', {60}, ...
    'Units', 'normalized', ...
    'Position', [.05 .1 .9 .8]);

    function cbKeyPressMembers(hTable, hKey)
        if strcmpi(hKey.Key, 'downarrow')
            n = size(hTable.Data, 1);
            hTable.Data(n+1,:) = {0 0 0};
        end
    end
end
%% Implements a GUI version of Example06_08. 
function Example08_08
Nodes = struct('x', 0, 'y', 0, ...
    'supportx', false, 'supporty', false, ...
    'loadx', 0, 'loady', 0, ...
    'reactionx', 0, 'reactiony', 0);
Members = struct('node1', 0, 'node2', 0, 'force', 0);
hf = figure('Position', [40, 20, 590, 450], ...
    'Name', 'Planar Truss: Untitled', ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off');
axes('Position', [.05 .05 .475 .575]), axis off
data = struct2cell(Nodes)';
columnName = {'X', 'Y', 'SupportX', 'SupportY', ...
    'LoadX', 'LoadY', 'ReactionX', 'ReactionY'};
columnFormat = {'numeric', 'numeric', ...
    'logical', 'logical', ...
    'numeric', 'numeric', 'numeric', 'numeric'};
columnEditable = logical([1 1 1 1 1 1 0 0]);
hNodes = uitable('Data', data, ...
    'KeyPressFcn', @cbKeyPressNodes, ...
    'ColumnName', columnName, ...
    'ColumnFormat', columnFormat, ...
    'ColumnEditable', columnEditable, ...
    'ColumnWidth', {45 45 60 60 60 60 72 72}, ...
    'Units', 'normalized', ...
    'Position', [.05 .65 .9 .275]);
hMembers = uitable('Data', struct2cell(Members)', ...
    'KeyPressFcn', @cbKeyPressMembers, ...
    'ColumnName', {'Node1', 'Node2', 'Force'}, ...
    'ColumnEditable', logical([1 1 0]), ...
    'ColumnWidth', {54, 54, 72}, ...
    'Units', 'normalized', ...
    'Position', [.55 .325 .4 .275]);
uicontrol('Style', 'pushbutton', ...
    'String', 'Plot', ...
    'Callback', @cbPlot, ...
    'Units', 'normalized', ...
    'Position', [.55 .225 .175 .075])
uicontrol('Style', 'pushbutton', ...
    'String', 'Solve', ...
    'Callback', @cbSolve, ...
    'Units', 'normalized', ...
    'Position', [.55 .135 .175 .075])
uicontrol('Style', 'pushbutton', ...
    'String', 'Open', ...
    'Callback', @cbOpen, ...
    'Units', 'normalized', ...
    'Position', [.775 .225 .175 .075])
uicontrol('Style', 'pushbutton', ...
    'String', 'Save As', ...
    'Callback', @cbSaveAs, ...
    'Units', 'normalized', ...
    'Position', [.775 .135 .175 .075])
uicontrol('Style', 'pushbutton', ...
    'String', 'Quit', ...
    'Callback', 'close', ...
    'Units', 'normalized', ...
    'Position', [.775 .05 .175 .075])
uicontrol('Style', 'text', ...
    'String', 'Nodal Data', ...
    'Units', 'normalized', ...
    'Position', [.425 .925 .2 .04])
uicontrol('Style', 'text', ...
    'String', 'Member Data', ...
    'Units', 'normalized', ...
    'Position', [.65 .6 .2 .04])

    function cbPlot(~, ~)
        Nodes = cell2struct(hNodes.Data, fieldnames(Nodes), 2)';
        Members = cell2struct(hMembers.Data, fieldnames(Members), 2)';
        plotTruss(Nodes, Members)
    end

    function cbSolve(~, ~)
        Nodes = cell2struct(hNodes.Data, fieldnames(Nodes), 2)';
        Members = cell2struct(hMembers.Data, fieldnames(Members), 2)';
        [Nodes, Members] = solveTruss(Nodes, Members);
        hNodes.Data = permute(struct2cell(Nodes), [1 3 2])';
        hMembers.Data = permute(struct2cell(Members), [1 3 2])';
    end

    function cbOpen(~, ~)
        [file, path] = uigetfile('*.mat');
        if file
            Nodes = []; Members = [];
            load([path, file])
            hNodes.Data = permute(struct2cell(Nodes), [1 3 2])';
            hMembers.Data = permute(struct2cell(Members), [1 3 2])';
            hf.Name = ['Planar Truss: ', file];
        end
    end

    function cbSaveAs(~, ~)
        [file, path] = uiputfile('*.mat');
        if file
            Nodes = cell2struct(hNodes.Data, fieldnames(Nodes), 2)';
            Members = cell2struct(hMembers.Data, fieldnames(Members), 2)';
            save([path, file], 'Nodes', 'Members')
            hf.Name = ['Planar Truss: ', file];
        end
    end

    function cbKeyPressNodes(hTable, hKey)
        if strcmpi(hKey.Key, 'downarrow')
            n = size(hTable.Data, 1);
            hTable.Data(n+1,:) = {0 0 false false 0 0 0 0};
        end
    end

    function cbKeyPressMembers(hTable, hKey)
        if strcmpi(hKey.Key, 'downarrow')
            n = size(hTable.Data, 1);
            hTable.Data(n+1,:) = {0 0 0};
        end
    end
end

function [outNodes, outMembers] = solveTruss(Nodes, Members)
n = size(Nodes,2); m = size(Members,2);
if (m+3) < 2*n
    disp('Unstable!')
    outNodes = 0; outMembers = 0; return
elseif (m+3) > 2*n
    disp('Statically indeterminate!')
    outNodes = 0; outMembers = 0; return
end
A = zeros(2*n, 2*n); loads = zeros(2*n,1); nsupport = 0;
for i = 1:n
    for j = 1:m
        if Members(j).node1 == i || Members(j).node2 == i
            if Members(j).node1 == i
                n1 = i; n2 = Members(j).node2;
            elseif Members(j).node2 == i
                n1 = i; n2 = Members(j).node1;
            end
            x1 = Nodes(n1).x; y1 = Nodes(n1).y;
            x2 = Nodes(n2).x; y2 = Nodes(n2).y;
            L = sqrt((x2-x1)^2+(y2-y1)^2);
            A(2*i-1,j) = (x2-x1)/L;
            A(2*i,  j) = (y2-y1)/L;
        end
    end
    if (Nodes(i).supportx == 1)
        nsupport = nsupport+1;
        A(2*i-1,m+nsupport) = 1;
    end
    if (Nodes(i).supporty == 1)
        nsupport = nsupport+1;
        A(2*i, m+nsupport) = 1;
    end
    loads(2*i-1) = -Nodes(i).loadx;
    loads(2*i)   = -Nodes(i).loady;
end
forces = A\loads;
for j = 1:m
    Members(j).force = forces(j);
end
nsupport = 0;
for i = 1:n
    Nodes(i).reactionx = 0;
    Nodes(i).reactiony = 0;
    if (Nodes(i).supportx == 1)
        nsupport = nsupport+1;
        Nodes(i).reactionx = forces(m+nsupport);
    end
    if (Nodes(i).supporty == 1)
        nsupport = nsupport+1;
        Nodes(i).reactiony = forces(m+nsupport);
    end
end
outNodes = Nodes; outMembers = Members;
disp('Solved successfully.')
end

function plotTruss(Nodes, Members)
if (size(fieldnames(Nodes),1)<6 || size(fieldnames(Members),1)<2)
    disp('Truss data not complete'); return
end
n = length(Nodes); m = length(Members);
minX = Nodes(1).x; maxX = Nodes(1).x;
minY = Nodes(1).y; maxY = Nodes(1).y;
for k = 2:n
    if (Nodes(k).x < minX) minX = Nodes(k).x; end
    if (Nodes(k).x > maxX) maxX = Nodes(k).x; end
    if (Nodes(k).y < minY) minY = Nodes(k).y; end
    if (Nodes(k).y > maxY) maxY = Nodes(k).y; end
end
rangeX = maxX-minX; rangeY = maxY-minY;
axis([minX-rangeX/5, maxX+rangeX/5, minY-rangeY/5, maxY+rangeY/5])
ha = gca; delete(ha.Children)
axis equal off
hold on
for k = 1:m
    n1 = Members(k).node1; n2 = Members(k).node2;
    x = [Nodes(n1).x, Nodes(n2).x];
    y = [Nodes(n1).y, Nodes(n2).y];
    plot(x,y,'k-o', 'MarkerFaceColor', 'k')
end
for k = 1:n
    if Nodes(k).supportx
        x = [Nodes(k).x, Nodes(k).x-rangeX/20, Nodes(k).x-rangeX/20, Nodes(k).x];
        y = [Nodes(k).y, Nodes(k).y+rangeX/40, Nodes(k).y-rangeX/40, Nodes(k).y];
        plot(x,y,'k-')
    end
    if Nodes(k).supporty
        x = [Nodes(k).x, Nodes(k).x-rangeX/40, Nodes(k).x+rangeX/40, Nodes(k).x];
        y = [Nodes(k).y, Nodes(k).y-rangeX/20, Nodes(k).y-rangeX/20, Nodes(k).y];
        plot(x,y,'k-')
    end
end
end
%% Creates a GUI for the previous program, using GUIDE.
function varargout = Example08_09(varargin)
% EXAMPLE08_09 MATLAB code for Example08_09.fig
%      EXAMPLE08_09, by itself, creates a new EXAMPLE08_09 or raises the existing
%      singleton*.
%
%      H = EXAMPLE08_09 returns the handle to a new EXAMPLE08_09 or the handle to
%      the existing singleton*.
%
%      EXAMPLE08_09('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE08_09.M with the given input arguments.
%
%      EXAMPLE08_09('Property','Value',...) creates a new EXAMPLE08_09 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Example08_09_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Example08_09_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Example08_09

% Last Modified by GUIDE v2.5 15-Oct-2015 17:36:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Example08_09_OpeningFcn, ...
                   'gui_OutputFcn',  @Example08_09_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Example08_09 is made visible.
function Example08_09_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Example08_09 (see VARARGIN)

% Choose default command line output for Example08_09
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Example08_09 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Example08_09_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global hf Nodes Members
hf = hObject;
Nodes = struct('x', 0, 'y', 0, ...
    'supportx', false, 'supporty', false, ...
    'loadx', 0, 'loady', 0, ...
    'reactionx', 0, 'reactiony', 0);
Members = struct('node1', 0, 'node2', 0, 'force', 0);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
axis off


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global hNodes
hNodes = hObject;


% --- Executes on key press with focus on uitable1 and none of its controls.
function uitable1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmpi(eventdata.Key, 'downarrow')
    n = size(hObject.Data, 1);
    hObject.Data(n+1,:) = {0 0 false false 0 0 0 0};
end


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global hMembers
hMembers = hObject;


% --- Executes on key press with focus on uitable2 and none of its controls.
function uitable2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmpi(eventdata.Key, 'downarrow')
    n = size(hObject.Data, 1);
    hObject.Data(n+1,:) = {0 0 0};
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Nodes Members hNodes hMembers
Nodes = cell2struct(hNodes.Data, fieldnames(Nodes), 2)';
Members = cell2struct(hMembers.Data, fieldnames(Members), 2)';
plotTruss(Nodes, Members)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Nodes Members hNodes hMembers
Nodes = cell2struct(hNodes.Data, fieldnames(Nodes), 2)';
Members = cell2struct(hMembers.Data, fieldnames(Members), 2)';
[Nodes, Members] = solveTruss(Nodes, Members);
hNodes.Data = permute(struct2cell(Nodes), [1 3 2])';
hMembers.Data = permute(struct2cell(Members), [1 3 2])';

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Nodes Members hNodes hMembers hf
[file, path] = uigetfile('*.mat');
if file
    Nodes = []; Members = [];
    load([path, file])
    hNodes.Data = permute(struct2cell(Nodes), [1 3 2])';
    hMembers.Data = permute(struct2cell(Members), [1 3 2])';
    hf.Name = ['Planar Truss: ', file];
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Nodes Members hNodes hMembers hf
[file, path] = uiputfile('*.mat');
if file
    Nodes = cell2struct(hNodes.Data, fieldnames(Nodes), 2)';
    Members = cell2struct(hMembers.Data, fieldnames(Members), 2)';
    save([path, file], 'Nodes', 'Members')
    hf.Name = ['Planar Truss: ', file];
end

function [outNodes, outMembers] = solveTruss(Nodes, Members)
n = size(Nodes,2); m = size(Members,2);
if (m+3) < 2*n
    disp('Unstable!')
    outNodes = 0; outMembers = 0; return
elseif (m+3) > 2*n
    disp('Statically indeterminate!')
    outNodes = 0; outMembers = 0; return
end
A = zeros(2*n, 2*n); loads = zeros(2*n,1); nsupport = 0;
for i = 1:n
    for j = 1:m
        if Members(j).node1 == i || Members(j).node2 == i
            if Members(j).node1 == i
                n1 = i; n2 = Members(j).node2;
            elseif Members(j).node2 == i
                n1 = i; n2 = Members(j).node1;
            end
            x1 = Nodes(n1).x; y1 = Nodes(n1).y;
            x2 = Nodes(n2).x; y2 = Nodes(n2).y;
            L = sqrt((x2-x1)^2+(y2-y1)^2);
            A(2*i-1,j) = (x2-x1)/L;
            A(2*i,  j) = (y2-y1)/L;
        end
    end
    if (Nodes(i).supportx == 1)
        nsupport = nsupport+1;
        A(2*i-1,m+nsupport) = 1;
    end
    if (Nodes(i).supporty == 1)
        nsupport = nsupport+1;
        A(2*i, m+nsupport) = 1;
    end
    loads(2*i-1) = -Nodes(i).loadx;
    loads(2*i)   = -Nodes(i).loady;
end
forces = A\loads;
for j = 1:m
    Members(j).force = forces(j);
end
nsupport = 0;
for i = 1:n
    Nodes(i).reactionx = 0;
    Nodes(i).reactiony = 0;
    if (Nodes(i).supportx == 1)
        nsupport = nsupport+1;
        Nodes(i).reactionx = forces(m+nsupport);
    end
    if (Nodes(i).supporty == 1)
        nsupport = nsupport+1;
        Nodes(i).reactiony = forces(m+nsupport);
    end
end
outNodes = Nodes; outMembers = Members;
disp('Solved successfully.')

function plotTruss(Nodes, Members)
if (size(fieldnames(Nodes),1)<6 || size(fieldnames(Members),1)<2)
    disp('Truss data not complete'); return
end
n = length(Nodes); m = length(Members);
minX = Nodes(1).x; maxX = Nodes(1).x;
minY = Nodes(1).y; maxY = Nodes(1).y;
for k = 2:n
    if (Nodes(k).x < minX) minX = Nodes(k).x; end
    if (Nodes(k).x > maxX) maxX = Nodes(k).x; end
    if (Nodes(k).y < minY) minY = Nodes(k).y; end
    if (Nodes(k).y > maxY) maxY = Nodes(k).y; end
end
rangeX = maxX-minX; rangeY = maxY-minY;
axis([minX-rangeX/5, maxX+rangeX/5, minY-rangeY/5, maxY+rangeY/5])
ha = gca; delete(ha.Children)
axis equal off
hold on
for k = 1:m
    n1 = Members(k).node1; n2 = Members(k).node2;
    x = [Nodes(n1).x, Nodes(n2).x];
    y = [Nodes(n1).y, Nodes(n2).y];
    plot(x,y,'k-o', 'MarkerFaceColor', 'k')
end
for k = 1:n
    if Nodes(k).supportx
        x = [Nodes(k).x, Nodes(k).x-rangeX/20, Nodes(k).x-rangeX/20, Nodes(k).x];
        y = [Nodes(k).y, Nodes(k).y+rangeX/40, Nodes(k).y-rangeX/40, Nodes(k).y];
        plot(x,y,'k-')
    end
    if Nodes(k).supporty
        x = [Nodes(k).x, Nodes(k).x-rangeX/40, Nodes(k).x+rangeX/40, Nodes(k).x];
        y = [Nodes(k).y, Nodes(k).y-rangeX/20, Nodes(k).y-rangeX/20, Nodes(k).y];
        plot(x,y,'k-')
    end
end