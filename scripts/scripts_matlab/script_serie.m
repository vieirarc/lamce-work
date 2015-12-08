
%******************CARREGAR VARIAVEIS SERIE*************%
load hs_TPAR2.mat
load lon_100_bg.prn
load lat_100_bg.prn
load costa

for j = 1:5    %Dia 1 a 5%
for i = 0:23 %Hora 00 a 23%
if i<10
eval(['HS_2014070' num2str(j) '_0' num2str(i) '0000 = double(HS_2014070' num2str(j) '_0' num2str(i) '0000);']);
else
eval(['HS_2014070' num2str(j) '_' num2str(i) '0000 = double(HS_2014070' num2str(j) '_' num2str(i) '0000);']);
end
end
end

%***********************PLOT IMAGENS SERIE*****************%

for j = 1:5    %Dia 1 a 5%
for i = 0:23 %hora 00 a 23%
if i<10
figure;
eval(['pcolor(lon_100_bg,lat_100_bg,HS_2014070' num2str(j) '_0' num2str(i) '0000); shading interp; axis equal;']);  %Looping com 'eval' variando o nome da variável com 'num2str'%
eval(['title(''Altura significativa de onda - 0' num2str(j) '/07/2014 - 0' num2str(i) 'H'')']) %Looping com 'eval' variando o dia e hora no título com 'num2str'%
contourcmap (0:0.2:4.10,'jet','colorbar','on'); %Escala%
hold on;
plot(costa_lon,costa_lat,'k');
else
figure;
eval(['pcolor(lon_100_bg,lat_100_bg,HS_2014070' num2str(j) '_' num2str(i) '0000); shading interp; axis equal;'])
eval(['title(''Altura significativa de onda - 0' num2str(j) '/07/2014 - ' num2str(i) 'H'')'])
contourcmap (0:0.2:4.10,'jet','colorbar','on');
hold on;
plot(costa_lon,costa_lat,'k');
end
end
end

pcolor(lon_100_bg,lat_100_bg, );shading interp;axis equal;
contourcmap (0:0.2:4.10,'jet','colorbar','on'); %Escala%
hold on;
plot(costa_lon,costa_lat,'k');

%****************PLOT HS DIR COPA (SERIE)***************************%

scale = 0.5;
for j = 1:5    %Dia 1 a 5%
  
   for i = 0:23 %hora 0 a 23%
    if i<10
     figure; 
     eval(['quiver (lon_copa_100 (1:2:end,1:2:end),lat_copa_100 (1:2:end,1:2:end),uvel_2014070' num2str(j) '_0' num2str(i) '0000 (1:2:end,1:2:end),vvel_2014070' num2str(j) '_0' num2str(i) '0000(1:2:end,1:2:end),scale,''k'')']);
    hold on;
     eval(['pcolor(lon_copa_100,lat_copa_100,HS_2014070' num2str(j) '_0' num2str(i) '0000); shading interp; axis equal;']);  %Looping com 'eval' variando o nome da variável com 'num2str'%
     eval(['title('' Altura Significativa e Direção Média de onda - Praia de Copacabana - Dia ' num2str(j) ' - 0' num2str(i) 'h'');']); %Looping com 'eval' variando o dia e hora no título com 'num2str'%
     contourcmap (0:0.2:5.4,'jet','colorbar','on'); %Escala%
     text(-43.1835,-22.9715,'Praia de','FontSize',10','Rotation',36,'fontWeight','bold')
     text(-43.1807,-22.9695,'Copacabana','FontSize',10','Rotation',30,'fontWeight','bold')
     text(-43.168,-22.962,'Leme','FontSize',10','fontWeight','bold')
     text(-43.194,-22.985,'Forte de','FontSize',10','fontWeight','bold')
     text(-43.194,-22.986,'Copacabana','FontSize',10','fontWeight','bold')
     hold on;
     plot(lon_costa_copa,lat_costa_copa,'k');
    else
     figure; 
     eval(['quiver (lon_copa_100(1:2:end,1:2:end),lat_copa_100(1:2:end,1:2:end),uvel_2014070' num2str(j) '_' num2str(i) '0000(1:2:end,1:2:end),vvel_2014070' num2str(j) '_' num2str(i) '0000(1:2:end,1:2:end),scale,''k'')']); 
     hold on;
     eval(['pcolor(lon_copa_100,lat_copa_100,HS_2014070' num2str(j) '_' num2str(i) '0000); shading interp; axis equal;'])
     eval(['title('' Altura Significativa e Direção Média de onda - Praia de Copacabana - Dia ' num2str(j) ' - ' num2str(i) 'h'');']);
     contourcmap (0:0.2:5.4,'jet','colorbar','on');
     text(-43.1835,-22.9715,'Praia de','FontSize',10','Rotation',36,'fontWeight','bold')
     text(-43.1807,-22.9695,'Copacabana','FontSize',10','Rotation',30,'fontWeight','bold')
     text(-43.168,-22.962,'Leme','FontSize',10','fontWeight','bold')
     text(-43.194,-22.985,'Forte de','FontSize',10','fontWeight','bold')
     text(-43.194,-22.986,'Copacabana','FontSize',10','fontWeight','bold')
     hold on;
     plot(lon_costa_copa,lat_costa_copa,'k');
   end
   end
  
end

for k = 1:120
 saveas(k,['HS_' num2str(k) '.png']);
end
close all

%****************PLOT HS DIR COPA 12H***********************%
scale = 0.5;
for j = 1:5    %Dia 1 a 8%
for i = 12 %hora 00 a 21%
figure;
eval(['quiver (lon_copa_100(1:2:end,1:2:end),lat_copa_100(1:2:end,1:2:end),uvel_2014070' num2str(j) '_' num2str(i) '0000(1:2:end,1:2:end),vvel_2014070' num2str(j) '_' num2str(i) '0000(1:2:end,1:2:end),scale,''k'')']);
hold on;
eval(['pcolor(lon_copa_100,lat_copa_100,HS_2014070' num2str(j) '_' num2str(i) '0000); shading interp; axis equal;'])
eval(['title('' Altura Significativa e Direção Média de onda - Praia de Copacabana - Dia ' num2str(j) ' - ' num2str(i) 'h'');']);
contourcmap (0:0.2:5.4,'jet','colorbar','on');
hold on;
plot(lon_costa_copa,lat_costa_copa,'k');
text(-43.187,-22.97,'Praia de Copacabana','FontSize',9','fontWeight','bold')
text(-43.168,-22.962,'Leme','FontSize',9','fontWeight','bold')
text(-43.194,-22.985,'Forte de','FontSize',9','fontWeight','bold')
text(-43.194,-22.986,'Copacabana','FontSize',9','fontWeight','bold')
end
end

%***************ESCREVER VALORES DOS PONTOS ****************%

%P1 = (101,150) - (-22.977800°,-43.181100°)
%P5 = (94,146) - (-22.984100°,-43.184700°)


for j = 1:5;
    for i = 0:23;
     if i < 10;
       eval(['HS_2014070' num2str(j) '_0' num2str(i) '0000 = HS_2014070' num2str(j) '_0' num2str(i) '0000 (101,150)']);
     else 
       eval(['HS_2014070' num2str(j) '_' num2str(i) '0000 = HS_2014070' num2str(j) '_' num2str(i) '0000 (101,150)']);
     end
    end
end


%*****************SERIE TEMPORAL PONTO P1**************%

   
    %PONTO 1 (P1 (101,150) - (-22.977800° , -43.181100°) (22°58'40.08"S ,  43°10'51.96"O)

    %DIA 1%
    A1 = [0.0201 0.7425 1.0158 1.1652 1.2433 1.2942 1.2992 1.2823 1.2584 1.2418 1.2352 ...
        1.2639 1.3170 1.3684 1.4158 1.4199 1.3914 1.3359 1.2839 1.2289 1.2289 1.2463 ...
        1.2752 1.2618];
    
    %DIA 2%
    B1 = [1.2462 1.2576 1.2899 1.3336 1.3403 1.3129 1.2728 1.2677 1.2649 1.2516 1.2599 ...
        1.2690 1.2848 1.3106 1.3406 1.3480 1.3707 1.3659 1.3518 1.3400 1.3547 1.3835 ...
        1.3727 1.3637];
    
    %DIA 3%
    C1 = [1.3368 1.2940 1.3026 1.3704 1.3784 1.3903 1.4217 1.4014 1.3536 1.3350 1.3601 ...
        1.3454 1.3315 1.3342 1.3491 1.3676 1.3858 1.3962 1.4090 1.4323 1.4498 1.4646 ...
        1.4921 1.5365];
    
    %DIA 4% 
    D1 = [1.5719 1.6091 1.6470 1.6179 1.6272 1.6882 1.6721 1.6026 1.5813 1.6169 1.5945 ...
        1.6010 1.6956 1.7810 1.8598 1.9218 2.0258 2.1061 2.2085 2.2312 2.3065 2.3979 ...
        2.4637 2.4355];
    
    %DIA 5%
    E1 = [2.4152 2.3852 2.3891 2.4062 2.4262 2.4486 2.4811 2.4660 2.4217 2.3534 2.2945 ...
        2.2767 2.2448 2.1916 2.1712 2.1261 2.0819 2.0245 1.9607 1.8762 1.7955 1.7512 ...
        1.7146 1.6821];


%*************SERIE SEMANA P1****************%

S_P1 = [0.0201 0.7425 1.0158 1.1652 1.2433 1.2942 1.2992 1.2823 1.2584 1.2418 1.2352 ...
        1.2639 1.3170 1.3684 1.4158 1.4199 1.3914 1.3359 1.2839 1.2289 1.2289 1.2463 ...
        1.2752 1.2618 1.2462 1.2576 1.2899 1.3336 1.3403 1.3129 1.2728 1.2677 1.2649 1.2516 1.2599 ...
        1.2690 1.2848 1.3106 1.3406 1.3480 1.3707 1.3659 1.3518 1.3400 1.3547 1.3835 ...
        1.3727 1.3637 1.3368 1.2940 1.3026 1.3704 1.3784 1.3903 1.4217 1.4014 1.3536 1.3350 1.3601 ...
        1.3454 1.3315 1.3342 1.3491 1.3676 1.3858 1.3962 1.4090 1.4323 1.4498 1.4646 ...
        1.4921 1.5365 1.5719 1.6091 1.6470 1.6179 1.6272 1.6882 1.6721 1.6026 1.5813 1.6169 1.5945 ...
        1.6010 1.6956 1.7810 1.8598 1.9218 2.0258 2.1061 2.2085 2.2312 2.3065 2.3979 ...
        2.4637 2.4355 2.4152 2.3852 2.3891 2.4062 2.4262 2.4486 2.4811 2.4660 2.4217 2.3534 2.2945 ...
        2.2767 2.2448 2.1916 2.1712 2.1261 2.0819 2.0245 1.9607 1.8762 1.7955 1.7512 ...
        1.7146 1.6821];

%******************************************PONTO P5************************************************%


%************SERIE TEMPORAL PONTO P5**********%

%P5 = (94,146) - (-22.984100°,-43.184700°)

A5 = [0.0201 0.8478 1.1446 1.3028 1.3843 1.4377 1.4400 1.4194 1.3928 1.3760 1.3700 ...
     1.4041 1.4643 1.5211 1.5731 1.5745 1.5404 1.4771 1.4189 1.3573 1.3611 1.3822 ...
     1.4155 1.3981];
 
 
B5 = [1.3815 1.3966 1.4337 1.4820 1.4863 1.4530 1.4073 1.4039 1.4014 1.3867 1.3979 ...
     1.4082 1.4258 1.4541 1.4877 1.4949 1.5217 1.5148 1.4987 1.4854 1.5028 1.5351 ...
     1.5200 1.5093];


C5 = [1.4787 1.4302 1.4430 1.5214 1.5265 1.5391 1.5747 1.5490 1.4944 1.4752 1.5060 ...
      1.4880 1.4731 1.4775 1.4946 1.5142 1.5326 1.5418 1.5549 1.5792 1.5964 1.6102 ...
      1.6385 1.6833];
  
D5 = [1.7159 1.7479 1.7792 1.7437 1.7475 1.8017 1.7812 1.7139 1.6917 1.7283 1.7036 ...
    1.7097 1.8038 1.8733 1.9314 1.9664 2.0251 2.0597 2.0980 2.0986 2.1250 2.1617 ...
    2.1841 2.1819];


E5 = [2.1793 2.1711 2.1724 2.1815 2.1931 2.2054 2.2201 2.2162 2.1986 2.1698 2.1413 ...
     2.1302 2.1174 2.0942 2.0854 2.0675 2.0475 2.0169 1.9829 1.9335 1.8798 1.8463 ...
     1.8207 1.7972];

    
%****************SERIE SEMANA P5************%

S_P5 = [0.0201 0.8478 1.1446 1.3028 1.3843 1.4377 1.4400 1.4194 1.3928 1.3760 1.3700 ...
     1.4041 1.4643 1.5211 1.5731 1.5745 1.5404 1.4771 1.4189 1.3573 1.3611 1.3822 ...
     1.4155 1.3981 1.3815 1.3966 1.4337 1.4820 1.4863 1.4530 1.4073 1.4039 1.4014 1.3867 1.3979 ...
     1.4082 1.4258 1.4541 1.4877 1.4949 1.5217 1.5148 1.4987 1.4854 1.5028 1.5351 ...
     1.5200 1.5093 1.4787 1.4302 1.4430 1.5214 1.5265 1.5391 1.5747 1.5490 1.4944 1.4752 1.5060 ...
     1.4880 1.4731 1.4775 1.4946 1.5142 1.5326 1.5418 1.5549 1.5792 1.5964 1.6102 ...
     1.6385 1.6833 1.7159 1.7479 1.7792 1.7437 1.7475 1.8017 1.7812 1.7139 1.6917 1.7283 1.7036 ...
     1.7097 1.8038 1.8733 1.9314 1.9664 2.0251 2.0597 2.0980 2.0986 2.1250 2.1617 ...
     2.1841 2.1819 2.1793 2.1711 2.1724 2.1815 2.1931 2.2054 2.2201 2.2162 2.1986 2.1698 2.1413 ...
     2.1302 2.1174 2.0942 2.0854 2.0675 2.0475 2.0169 1.9829 1.9335 1.8798 1.8463 ...
     1.8207 1.7972];


%***************RECORTAR CAMPOS DE COPACABANA******************%

HS_20140701_120000 = HS_20140701_120000(83:120,140:177);

%**************%PLOTAR HS COPACABANA**********************%

load lat_copa.prn
load lon_copa.prn

pcolor(lon_copa2,lat_copa2,HS_20140701_120000);shading interp; axis equal;
contourcmap (0:0.2:3.2,'jet','colorbar','on');
title ('Altura Significativa de onda - Praia de Copacabana - Dia 1 - 12h');
figure;
pcolor(lon_copa2,lat_copa2,HS_20140702_120000);shading interp; axis equal;
contourcmap (0:0.2:3.2,'jet','colorbar','on');
title ('Altura Significativa de onda - Praia de Copacabana - Dia 2 - 12h');
figure;
pcolor(lon_copa2,lat_copa2,HS_20140703_120000);shading interp; axis equal;
contourcmap (0:0.2:3.2,'jet','colorbar','on');
title ('Altura Significativa de onda - Praia de Copacabana - Dia 3 - 12h');
figure;
pcolor(lon_copa2,lat_copa2,HS_20140704_120000);shading interp; axis equal;
contourcmap (0:0.2:3.2,'jet','colorbar','on');
title ('Altura Significativa de onda - Praia de Copacabana - Dia 4 - 12h');
figure
pcolor(lon_copa2,lat_copa2,HS_20140705_120000);shading interp; axis equal;
contourcmap (0:0.2:3.2,'jet','colorbar','on');
title ('Altura Significativa de onda - Praia de Copacabana - Dia 5 - 12h');
















