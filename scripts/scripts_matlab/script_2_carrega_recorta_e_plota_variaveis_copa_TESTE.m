

for j = 1:31    %Dias%
for i = 0:3:21 %Hora%
	 if j < 10
     if i < 12
        eval(['HS_2015090' num2str(j) '_0' num2str(i) '0000 = double(HS_2015090' num2str(j) '_0' num2str(i) '0000);']);
     elseif   
     else 
       eval(['HS_201509' num2str(j) '_' num2str(i) '0000 = double(HS_201509' num2str(j) '_' num2str(i) '0000);']);
     end
    end 
end

