%% Demonstrates the screen text input/output functions input and disp.
clear
while 0
    a = input('Enter anything: ');
    if strcmp(a, 'stop') break, end
    disp(class(a))
    disp(a)
end
%% Demonstrates the formatted text output function fprintf.
clear
a = pi*10000; b = -314;
fprintf('%f %f\n', a, b)
fprintf('%.4f %.4f\n', a, b)
fprintf('%12f %12f\n', a, b)
fprintf('%12.4f %12.4f\n', a, b)
fprintf('%8.4f %8.4f\n', a, b)
fprintf('%-12.4f %-12.4f\n', a, b)
fprintf('%+12.4f %+12.4f\n', a, b)
fprintf('%e %e\n', a, b)
fprintf('%.4e %.4e\n', a, b)
fprintf('%12.4e %12.4e\n', a, b)
fprintf('%g %g\n', a, b)
fprintf('%.4g %.4g\n', a, b)
fprintf('%12.4g %12.4g\n', a, b)
fprintf('%d %d\n', b, b)
fprintf('%5d %5d\n', b, b)
fprintf('%c %c\n', 'A', 'B')
fprintf('%c %c\n', 65, 66)
fprintf('%5c %5c\n', 'A', 'B')
fprintf('%s %s\n','A','string')
fprintf('%8s %15s\n','A','string')
fprintf('%3s %3s\n','A','string')
%% Demonstrates lowlevel text file I/O.
clear
fileName = input('Enter the file name: ', 's');
fileID = fopen(fileName);
disp('0. stop')
disp('1. Read the file once for all')
disp('2. Read the file one line at a time')
disp('3. Read a line')
disp('4. Read a character')
disp('5. Rewind to the beginning')
disp('6. Move forward a character')
disp('7. Move backward a character')
while 1
    task = input('Enter task number: ');
    switch task
        case 0
            fclose(fileID);
            break
        case 1
            text = fileread(fileName);
            disp(text)
            characters = length(text);
            disp([num2str(characters), ' characters read'])
        case 2
            frewind(fileID), lines = 0; characters = 0;
            while ~feof(fileID)
                text = fgetl(fileID);
                disp(text)
                lines = lines+1;
                characters = characters+length(text);
            end
            disp([num2str(lines), ' lines read'])
            disp([num2str(characters), ' characters read'])
        case 3
            if feof(fileID)
                disp('End of file!')
            else
                text = fgetl(fileID);
                disp(text);
            end
        case 4
            if feof(fileID)
                disp('End of file!')
            else
                text = fscanf(fileID, '%c', 1);
                disp(text);
            end
        case 5
            frewind(fileID)
        case 6
            if feof(fileID)
                disp('End of file!')
            else
                fseek(fileID, 1, 'cof');
            end
        case 7
            if ftell(fileID) == 0
                disp('Beginning of file!')
            else
                fseek(fileID, -1, 'cof');
            end
    end
    position = ftell(fileID);
    disp(['File pointer at ', num2str(position)])
end
%% Demonstrates low-level binary file I/O.
clear
a = 28;
fileID = fopen('tmp.dat','w+');
fwrite(fileID, a, 'double');
frewind(fileID)
b = fread(fileID, 8, 'uint8');
disp(b')
fclose(fileID);
delete('tmp.dat')
%% Demonstrates out-of-core matrices.
clear
M = matfile('tmp');
n = 10;
for i = 1:n
    for j = 1:n
        M.A(i,j) = i+(j-1)*n;
    end
end
clear
load('tmp')
delete('tmp.mat')
disp(A)
%% Demonstrates the read/write of ASCIIdelimited files.
clear
type count.dat
A = dlmread('count.dat');
dlmwrite('tmp.dat', A)
type tmp.dat
clear
B = csvread('tmp.dat');
delete tmp.dat
csvwrite('tmp1.dat', B)
type tmp1.dat
delete tmp1.dat
%% Demonstrates the read/write of Microsoft Excel spreadsheet files.
clear
A = reshape(1:15, 5, 3);
xlswrite('tmp', A, 'Sheet1', 'A2')
title = {'First', 'Second', 'Third'};
xlswrite('tmp', title, 'Sheet1', 'A1:C1')
clear
[num, txt] = xlsread('tmp', 'Sheet1')
delete('tmp.xls')