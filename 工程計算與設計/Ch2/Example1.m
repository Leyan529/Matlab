%% Explores some basic concepts about unsigned integer numbers.
d = 75;
u = uint8(d) % 轉換成不帶正負號、 8 位元的整數
% bits = bitget(u, 1:8) % 返回整??? A 中位于位置 bit 的位值
% bits = fliplr(bits); % 翻轉行向量
bits = dec2bin(u)
number = bin2dec(bits)
%% Explores some basic concepts about signed integer numbers.
d = 200
u = uint8(d)
bits = dec2bin(u) % dec2bin : 以字符向量形式返回d的二進製表示形式
t = int8(u)
s = typecast(u, 'int8') % 在不更改基礎數據的情況下轉換數據類型
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
b = single(a); % single(X)將X中的值轉換為單精度
fprintf('%.20f\n', b)
%% Explores some basic concepts about characters and strings.
a = 'A';
b = a + 1;
char(65) % 將整數轉換為字符
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
c = horzcat(a, b) % 水平串聯兩個矩陣
d = [a, b]
e = b'
f = vertcat(d, e) % 垂直串聯兩個矩陣
g = [d; e]
h = fliplr(c) % 翻轉行向量
k = flipud(c) % 翻轉列向量
%% Demonstrates the use of sum, cumsum, prod, cumprod, diff, min, and max.
a = 1:5
b = sum(a) % 數組元素總和
c = cumsum(a)
% cumsum(A)從A中的第一個其大小不等於1的數組維度開始返回A的累積和。 
% 如果A是向量，則cumsum(A)返回包含A元素累積和的向量。 
% 如果A是矩陣，則cumsum(A)返回包含A每列的累積和的矩陣。 
% 如果A為多維數組，則cumsum(A)沿第一個非單一維運算。

d = prod(a) % 返回a的數組元素的乘積
e = cumprod(a)
% cumprod(A) 從A中的第一個其大小不等於1的數組維度開始返回A的累積乘積。
% 如果A是向量，cumprod(A)返回包含A元素的累計乘積的向量。
% 如果A是矩陣，則cumprod(A)返回包含A每列的累計乘積的矩陣。
% 如果A為多維數組，則cumprod(A)沿第一個非單一維運算

f = diff(a) % 差分和近似導數
A = reshape(1:9, 3, 3)
g = sum(A)
B = cumsum(A)
h = prod(A)
C = cumprod(A)
D = diff(A)
p = min(a)
q = max(a)
r = min(A) % 如果A為矩陣，則min(A)是包含每一列的最小值的行向量
s = max(A) % 如果A為矩陣，則max(A)是包含每一列的最大值的行向量

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