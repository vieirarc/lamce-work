
%% ***** CARREGA VARIAVEIS DIR **** %%


for j = 18:19    %Dia%
for i = 0:3:21 %Hora%
  if i<12
   eval(['DIR_201508' num2str(j) '_0' num2str(i) '0000 = double(DIR_201508' num2str(j) '_0' num2str(i) '0000);'])
  else
   eval(['DIR_201508' num2str(j) '_' num2str(i) '0000 = double(DIR_201508' num2str(j) '_' num2str(i) '0000);'])
  end
end
end

%*******************RECORTAR DIR COPA ********************%

for j = 18:19
for i = 0:3:21
  if i < 12
   eval(['DIR_201508' num2str(j) '_0' num2str(i) '0000 = DIR_201508' num2str(j) '_0' num2str(i) '0000(1:120,100:300);'])
  else
   eval(['DIR_201508' num2str(j) '_' num2str(i) '0000 = DIR_201508' num2str(j) '_' num2str(i) '0000(1:120,100:300);'])
  end
end
end

%% *** TRANSFORMA U e V **** %%

for y = 18:19;     %DIAS%
for x = 0:3:21;  %HORAS%
  if x < 12;
   eval(['kk = isnan(DIR_201508' num2str(y) '_0' num2str(x) '0000);'])   %*** VARI�VEL 'DIR' ***%
   eval(['int = ones(size(DIR_201508' num2str(y) '_0' num2str(x) '0000));'])  %*** VARI�VEL 'DIR' ***%
for i = 1:120
for j = 1:201
  if kk (i,j) == 1;
%             int (kk) = NaN;
eval(['DIR_201508' num2str(y) '_0' num2str(x) '0000 (kk) = 0;'])  %*** VARI�VEL 'DIR' ***%
int (kk) = 0;
  end
end
end
uu = [];
vv = [];
for j = 1:201
   eval(['c = DIR_201508' num2str(y) '_0' num2str(x) '0000;'])  %*** VARI�VEL 'DIR' ***%
   d = squeeze(c(:,j));
   i = squeeze(int(:,j));
   [u v] = compass2cart(d,i);
   uu = [uu,u];
   vv = [vv,v];
end
% uu = uu';
% vv = vv';
for i = 1:120
for j = 1:201
  if kk (i,j) == 1;
   uu (kk) = NaN;
   vv (kk) = NaN;
  end
end
end
   eval(['uvel_201508' num2str(y) '_0' num2str(x) '0000 = uu * (-1);']) %*** VARI�VEL RESULTANTE ***%
   eval(['vvel_201508' num2str(y) '_0' num2str(x) '0000 = vv * (-1);']) %*** VARI�VEL RESULTANTE ***%
else
   eval(['kk = isnan(DIR_201508' num2str(y) '_' num2str(x) '0000);']) %*** VARI�VEL 'DIR' ***%
   eval(['int = ones(size(DIR_201508' num2str(y) '_' num2str(x) '0000));'])  %*** VARI�VEL 'DIR' ***%
for i = 1:120
for j = 1:201
  if kk (i,j) == 1;
%             int (kk) = NaN;
   eval(['DIR_201508' num2str(y) '_' num2str(x) '0000 (kk) = 0;'])  %*** VARI�VEL 'DIR' ***%
   int (kk) = 0;
  end
end
end
uu = [];
vv = [];
for j = 1:201
   eval(['c = DIR_201508' num2str(y) '_' num2str(x) '0000;'])  %*** VARI�VEL 'DIR' ***%
   d = squeeze(c(:,j));
   i = squeeze(int(:,j));
   [u v] = compass2cart(d,i);
   uu = [uu,u];
   vv = [vv,v];
end
% uu = uu';
% vv = vv';
for i = 1:120
for j = 1:201
  if kk (i,j) == 1;
   uu (kk) = NaN;
   vv (kk) = NaN;
  end
end
end
eval(['uvel_201508' num2str(y) '_' num2str(x) '0000 = uu * (-1);'])  %*** VARI�VEL RESULTANTE ***%
eval(['vvel_201508' num2str(y) '_' num2str(x) '0000 = vv * (-1);'])  %*** VARI�VEL RESULTANTE ***%
end
end
end
clear *DIR*


