
%*****************CARREGAR VARIAVEIS DIR *************************%  



for j = 21:25    %Dia%
    for i = 0:3:21 %Hora%
     if i<12
      eval(['DIR_201509' num2str(j) '_0' num2str(i) '0000 = double(DIR_201509' num2str(j) '_0' num2str(i) '0000);'])
       else 
      eval(['DIR_201509' num2str(j) '_' num2str(i) '0000 = double(DIR_201509' num2str(j) '_' num2str(i) '0000);'])
     end
    end 
end

%*******************RECORTAR DIR COPA ********************%

for j = 21:25
for i = 0:3:21
  if i < 12
    eval(['DIR_201509' num2str(j) '_0' num2str(i) '0000 = DIR_201509' num2str(j) '_0' num2str(i) '0000(91:120,134:170);'])
  else
    eval(['DIR_201509' num2str(j) '_' num2str(i) '0000 = DIR_201509' num2str(j) '_' num2str(i) '0000(91:120,134:170);'])
  end
end
end


%% ************ CONVERTE AS VARI�VEIS 'DIR' DE GRAUS PARA METROS (U_V) LOOPING ******%
              % � NECESS�RIO ATUALIZAR AS DATAS NOS NOMES DAS VARI�VEIS %


for y = 21:25;     %DIAS%                             
for x = 0:3:21;  %HORAS%
if x < 12;
eval(['kk = isnan(DIR_201509' num2str(y) '_0' num2str(x) '0000);'])   %*** VARI�VEL 'DIR' ***%
eval(['int = ones(size(DIR_201509' num2str(y) '_0' num2str(x) '0000));'])  %*** VARI�VEL 'DIR' ***%

for i = 1:30
    for j = 1:37
        if kk (i,j) == 1;
%             int (kk) = NaN;
            eval(['DIR_201509' num2str(y) '_0' num2str(x) '0000 (kk) = 0;'])  %*** VARI�VEL 'DIR' ***%
            int (kk) = 0;
        end
    end
end


uu = [];
vv = [];

for j = 1:37
    eval(['c = DIR_201509' num2str(y) '_0' num2str(x) '0000;'])  %*** VARI�VEL 'DIR' ***%
    d = squeeze(c(:,j));
    i = squeeze(int(:,j));
    [u v] = compass2cart(d,i);
    uu = [uu,u];
    vv = [vv,v];
end
 
% uu = uu';
% vv = vv';

for i = 1:30
    for j = 1:37
        if kk (i,j) == 1;
            uu (kk) = NaN;
            vv (kk) = NaN;
        end
    end
end

eval(['uvel_201509' num2str(y) '_0' num2str(x) '0000 = uu * (-1);']) %*** VARI�VEL RESULTANTE ***%
eval(['vvel_201509' num2str(y) '_0' num2str(x) '0000 = vv * (-1);']) %*** VARI�VEL RESULTANTE ***%
else
eval(['kk = isnan(DIR_201509' num2str(y) '_' num2str(x) '0000);']) %*** VARI�VEL 'DIR' ***%
eval(['int = ones(size(DIR_201509' num2str(y) '_' num2str(x) '0000));'])  %*** VARI�VEL 'DIR' ***%

for i = 1:30
    for j = 1:37
        if kk (i,j) == 1;
%             int (kk) = NaN;
            eval(['DIR_201509' num2str(y) '_' num2str(x) '0000 (kk) = 0;'])  %*** VARI�VEL 'DIR' ***%
            int (kk) = 0;
        end
    end
end


uu = [];
vv = [];

for j = 1:37
    eval(['c = DIR_201509' num2str(y) '_' num2str(x) '0000;'])  %*** VARI�VEL 'DIR' ***%
    d = squeeze(c(:,j));
    i = squeeze(int(:,j));
    [u v] = compass2cart(d,i);
    uu = [uu,u];
    vv = [vv,v];
end
 
% uu = uu';
% vv = vv';

for i = 1:30
    for j = 1:37
        if kk (i,j) == 1;
            uu (kk) = NaN;
            vv (kk) = NaN;
        end
    end
end

eval(['uvel_201509' num2str(y) '_' num2str(x) '0000 = uu * (-1);'])  %*** VARI�VEL RESULTANTE ***%
eval(['vvel_201509' num2str(y) '_' num2str(x) '0000 = vv * (-1);'])  %*** VARI�VEL RESULTANTE ***%
end
end
end
clear *DIR*
