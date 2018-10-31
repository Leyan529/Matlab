sexs = {'woman', 'man', 'man', 'woman', 'man', 'man', 'woman', 'woman', 'woman', 'woman'}'; 
times = {'light', 'night', 'night', 'night', 'light', 'light', 'night', 'night', 'light', 'light'}';
expers = [13, 7, 13, 12, 19, 15, 8, 22, 12, 20]';
sizes = {'medium', 'small', 'big', 'big', 'big', 'medium', 'medium', 'small', 'medium', 'big'}';
incoms = {'N', 'N', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'N'}';
accidents = {1, 1, 1, 0, 1, 1, 0, 0, 0, 0};
for i=1:length(accidents)
    if accidents{i} == 1
        accidents{i}= 'True'    
    else 
        accidents{i}= 'False'
    end
end
accidents = accidents';
accidient_data = table(sexs,times,expers,sizes,incoms,accidents) % Table array with named variables that can contain different types
