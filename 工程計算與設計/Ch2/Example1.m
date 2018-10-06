%% Explores some basic concepts about unsigned integer numbers.
d = 75;
u = uint8(d) % �ഫ�����a���t���B 8 �줸�����
% bits = bitget(u, 1:8) % ��^��??? A ����_��m bit �����
% bits = fliplr(bits); % ½���V�q
bits = dec2bin(u)
number = bin2dec(bits)
%% Explores some basic concepts about signed integer numbers.
d = 200
u = uint8(d)
bits = dec2bin(u) % dec2bin : �H�r�ŦV�q�Φ���^d���G�i�s��ܧΦ�
t = int8(u)
s = typecast(u, 'int8') % �b������¦�ƾڪ����p�U�ഫ�ƾ�����
a = int16(u)
bits = dec2bin(a)
%% Shows how the computer stores a real number
d = 28
a = typecast(d, 'uint64')
b = dec2bin(a, 64)
%% Shows the number of significant digits of a floating-point number
format short;
format compact;
a = 1234.56789012345678901234;
fprintf('%.20f\n', a)
format long;
a;
b = single(a); % single(X)�NX�������ഫ������
fprintf('%.20f\n', b)
%% Explores some basic concepts about characters and strings.
a = 'A';
b = a + 1;
char(65) % �N����ഫ���r��
char('A' + 2)
c = ['A', 'B', 'C']
d = ['AB', 'C']
e = ['A', 66, 67]
f = 'ABC'
f(1)
f(2)
f(3)
%% Prints an ASCII Codes table.
fprintf('    0 1 2 3 4 5 6 7 8 9\n')
for row = 3:12
    fprintf('%2d  ', row)
    for column = 0:9
        code = row*10+column;
        if (code < 32) || (code > 126)
            fprintf('  ')
        else
            fprintf('%c ', code)
        end
    end
    fprintf('\n')
end
%% Explores some basic concepts about logical data.
a = true
b = false
c = 6 > 5
d = 6 < 5
e = (6 > 5)*10
f = false*10+true*2
g = (6 > 5) & (6 < 5)
h = (6 > 5) | (6 < 5)
k = logical(5)
m = 5 | 0
n = (-2) & 'A'
%% Explores some basic concepts about arrays.
a = 5
b = [5]
c = 5*ones(1,1)
D = ones(2, 3)
e = [1, 2, 3, 4, 5]
f = [1 2 3 4 5]
g = [1:5]
h = 1:5
k = 1:1:5
m = linspace(1, 5, 5)
%% Explores some basic concepts about arrays
clear all clc
a = zeros(1,5)
a(1,5) = 8
a(5) = 9
a([1, 2, 4]) = [8, 7, 6]
a(1:4) = [2, 3, 4, 5]
[rows, cols] = size(a)
len = length(a)
b = a
c = a(1:5)
d = a(3:5)
e = a(3:length(a))
f = a(3:end)
f(5) = 10
%% Explores some basic concepts about arrays.
a = [1, 2; 3, 4; 5, 6]
b = 1:6
c = reshape(b, 3, 2)
d = reshape(b, 2, 3)
e = d'
c(:,3) = [7, 8, 9]
c(4,:) = [10, 11, 12]
c(4,:) = []
c(:,2:3) = []
%% Explores some basic concepts about arrays.
a = reshape(1:6, 3, 2)
b = [7; 8; 9]
c = horzcat(a, b) % �������p��ӯx�}
d = [a, b]
e = b'
f = vertcat(d, e) % �������p��ӯx�}
g = [d; e]
h = fliplr(c) % ½���V�q
k = flipud(c) % ½��C�V�q
%% Demonstrates the use of sum, cumsum, prod, cumprod, diff, min, and max.
a = 1:5
b = sum(a) % �Ʋդ����`�M
c = cumsum(a)
% cumsum(A)�qA�����Ĥ@�Ө�j�p������1���Ʋպ��׶}�l��^A���ֿn�M�C 
% �p�GA�O�V�q�A�hcumsum(A)��^�]�tA�����ֿn�M���V�q�C 
% �p�GA�O�x�}�A�hcumsum(A)��^�]�tA�C�C���ֿn�M���x�}�C 
% �p�GA���h���ƲաA�hcumsum(A)�u�Ĥ@�ӫD��@���B��C

d = prod(a) % ��^a���Ʋդ��������n
e = cumprod(a)
% cumprod(A) �qA�����Ĥ@�Ө�j�p������1���Ʋպ��׶}�l��^A���ֿn���n�C
% �p�GA�O�V�q�Acumprod(A)��^�]�tA�������֭p���n���V�q�C
% �p�GA�O�x�}�A�hcumprod(A)��^�]�tA�C�C���֭p���n���x�}�C
% �p�GA���h���ƲաA�hcumprod(A)�u�Ĥ@�ӫD��@���B��

f = diff(a) % �t���M����ɼ�
A = reshape(1:9, 3, 3)
g = sum(A)
B = cumsum(A)
h = prod(A)
C = cumprod(A)
D = diff(A)
p = min(a)
q = max(a)
r = min(A) % �p�GA���x�}�A�hmin(A)�O�]�t�C�@�C���̤p�Ȫ���V�q
s = max(A) % �p�GA���x�}�A�hmax(A)�O�]�t�C�@�C���̤j�Ȫ���V�q

%% Demonstrates the use of arithmetic operators for matrices.
A = reshape(1:6, 2, 3)
B = reshape(7:12, 2, 3)
C = A+B
D = A-B
E = B'
F = A*E
a = [3, 6]
b = a/F
c = b*F
G = F^2
H = A.*B
K = A./B
M = A.^2
P = A+10
Q = A-10
R = A*1.5
S = A/2
%% Demonstrates the use of arithmetic operators for vectors.
a = 1:4
b = 5:8
c = a+b
d = a-b
e = a*(b')
f = (a')*b
g = a/b
h = a.*b
k = a./b
m = a.^2
%% Demonstrates the use of arithmetic operators for scalars.
a = 6
b = 4
c = a+b
d = a-b
e = a*b
f = a/b
g = a^2
h = a.*b
k = a./b
m = a.^2