%% String
a = char('Paulia')
b = 'Vaninda'
aa = 1+ 'a'
bb = 2 + aa
cc = aa+bb

%% numeric a
c = int8(2^8);
d = int16(c^8);
f = int8(4.4);
g = int8(4.6);
%% numeric b
c = int8(2^8);
d = double(c^8);
for i=1:5
    temp = sqrt(double(d))
    x(i) = temp
    d = temp
end