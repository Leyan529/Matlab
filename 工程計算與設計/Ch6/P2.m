clear; close all;

% Block specification
Lx = 0.15;
Ly = 0.3;
Lz = 0.30;

% Motion data
t = [0:0.005:4]';       % Time data
r = [0*t, 0*t, 0*t];    % Position data
A = [2*pi*t, 0*t, 0*t]; % Orientation data (x-y-z Euler angle)

n_time = length(t);

% Compute propagation of vertices and patches
for i_time=1:n_time
    
    R = Euler2R(A(i_time,:));
    VertexData(:,:,i_time) = GeoVerMakeBlock(r(i_time,:),R,[Lx,Ly,Lz]);
    [X,Y,Z] = GeoPatMakeBlock(VertexData(:,:,i_time));
    PatchData_X(:,:,i_time) = X;
    PatchData_Y(:,:,i_time) = Y;
    PatchData_Z(:,:,i_time) = Z;
end

% Draw initial figure
figure(1);
h = patch(PatchData_X(:,:,1),PatchData_Y(:,:,1),PatchData_Z(:,:,1),'y');

set(h,'FaceLighting','phong','EdgeLighting','phong');
set(h,'EraseMode','normal');

% figure resize 
set(gcf,'Position',[100 100 260 220]); 
set(gcf,'unit','normalized','position',[0.5,0.5,0.32,0.32]);
set(gcf,'Units','centimeters','position',[2 2 18 18]);
set(gca,'Position',[.13 .37 .80 .44]); 


% Axes settings
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);
set(gca,'FontSize',14);
axis vis3d equal;
view([-37.5,30]);
camlight;
grid on;
xlim([-0.5,0.5]);
ylim([-0.5,0.5]);
zlim([-0.5,0.5]);

% Animation Loop
for i_time=1:n_time
    
    set(h,'XData',PatchData_X(:,:,i_time));
    set(h,'YData',PatchData_Y(:,:,i_time));
    set(h,'ZData',PatchData_Z(:,:,i_time));
    drawnow;
end

function R = Euler2R(A)
    % Euler angle -> Orientation matrix
    a1 = A(1);
    a2 = A(2);
    a3 = A(3);

    R1 = [1, 0, 0;
        0, cos(a1), -sin(a1);
        0, sin(a1), cos(a1)];

    R2 = [cos(a2), 0, sin(a2);
        0, 1, 0;
        -sin(a2), 0, cos(a2)];

    R3 = [cos(a3), -sin(a3), 0;
        sin(a3), cos(a3), 0;
        0, 0, 1];

    R = R1*R2*R3;
end

function VertexData = GeoVerMakeBlock(Location,Orientation,SideLength)

r = Location;
R = Orientation;

Lx = SideLength(1);
Ly = SideLength(2);
Lz = SideLength(3);

VertexData_0 = [Lx*ones(8,1), Ly*ones(8,1), Lz*ones(8,1)]...
    .*[0,0,0;
    1,0,0;
    0,1,0;
    0,0,1;
    1,1,0;
    0,1,1;
    1,0,1;
    1,1,1];

n_ver = 8;

for i_ver=1:n_ver
    
    VertexData(i_ver,:) = r + VertexData_0(i_ver,:)*R';
end
end

function [PatchData_X,PatchData_Y,PatchData_Z] = GeoPatMakeBlock(VertexData)

Index_Patch = ...
    [1,2,5,3;
    1,3,6,4;
    1,4,7,2;
    4,7,8,6;
    2,5,8,7;
    3,6,8,5];

n_pat = 6;

for i_pat=1:n_pat
    
    PatchData_X(:,i_pat) = VertexData(Index_Patch(i_pat,:),1);
    PatchData_Y(:,i_pat) = VertexData(Index_Patch(i_pat,:),2);
    PatchData_Z(:,i_pat) = VertexData(Index_Patch(i_pat,:),3);
end
end