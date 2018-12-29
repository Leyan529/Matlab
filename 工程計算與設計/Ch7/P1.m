%% P1
clear
while 1
    a = input('Enter anything: ','s');
    if contains(a,'stop') break, end
    disp(class(a))
    if (length(a) >1) 
        disp(eval(a))     
    else
        disp(double(a))    
    end
end
%% P2
load patients.mat
T = table(LastName,Age,Weight,Smoker);
T(1:5,:)
filename = 'patientdata.xlsx' ;
writetable(T,filename, 'Sheet' ,1, 'Range' , 'D1' )