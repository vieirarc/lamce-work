clear all, close all, clc

load direção.mat

kk = isnan(dir);   % cria uma matriz do mesmo tamanho de dir.Nesta, 1 substitui os elementos NaN localizados em dir e 0 os elementos restantes.
int = ones(size(dir));  % cria uma matriz de numeros 1 do mesmo tamanho de dir.

for i = 1:464
    for j = 1:350
        if kk (i,j) == 1;  % para os elementos que representao o continente em kk   
%             int (kk) = NaN;  % os elementos de kk em int sao substituidos por NaN (esses elementos sao os que representao o continente em kk)
            dir (kk) = 0; % o continente em dir e substituido por 0
            int (kk) = 0; % o continente em int e substituido por 0
        end
    end
end


uu = [];  % cria duas matrizes vazias
vv = [];

for j = 1:350
    d = squeeze(dir(:,j));  
    i = squeeze(int(:,j));
    [u v] = compass2cart(d,i);
    uu = [uu,u];
    vv = [vv,v];
end
 
% uu = uu';
% vv = vv';

for i = 1:464
    for j = 1:350
        if kk (i,j) == 1;
            uu (kk) = NaN;
            vv (kk) = NaN;
        end
    end
end

uvel = uu * (-1);
vvel = vv * (-1);

quiver(uvel,vvel)
