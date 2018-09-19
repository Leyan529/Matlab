%% pos array
array1 = [19 13 7 -11 2 17 5 3]
%% neg array
array2 = -[19 13 7 11 -2 17 -5 3]-3
array3 = abs(array2)
%% Vector1
x = linspace(0,10*pi)
y = sin(x)
% plot(x,y)
%% Vector2
x = linspace(0,360,50) % linspace(st,en,incerement)
y = 0:90:360 % st:interval:en)
%% 9*9 matrix
nine_nine = magic(4)
nine_nine(2:3,:) = 0
a = nine_nine'
b = inv(nine_nine)
n = norm(a)
a_b = [a,b]
aIb = [a;b]
%% random matrix
a = rand(3,4)
threeDim = rand(3,4,2)
