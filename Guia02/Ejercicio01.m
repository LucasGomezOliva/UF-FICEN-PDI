clear 
close all
clc

rgbImageLena = imread("Lena.png");

whos rgbImageLena

grayImageLena= rgb2gray(rgbImageLena);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen RGB y en escala de grises');

subplot(1,2,1)
imshow(rgbImageLena);
title('Imagen RGB');
subplot(1,2,2)
grayImageLena= rgb2gray(rgbImageLena);
imshow(grayImageLena);
title('Imagen en escala de grises');

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Histograma de escala de grises');

histogram(grayImageLena,256);
grid on;

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Histograma RGB');

subplot(3,1,1)
histogram(rgbImageLena(:,:,1),256);
title("Rojo");
grid on;
subplot(3,1,2)
histogram(rgbImageLena(:,:,2),256);
title("Verde");
grid on;
subplot(3,1,3)
histogram(rgbImageLena(:,:,3),226);
title("Azul")
grid on;

Prob_verde_137 = sum(sum(rgbImageLena(:,:,2) == 137))/( 220 * 220 );
disp(['Probabilidad de elegir un pixel al azar y que su intensidad ' ...
    'en el canal verde sea de 137 es de:',num2str(Prob_verde_137)]);

Casos_ok = sum(sum(20 < rgbImageLena(:,:,1)& rgbImageLena(:,:,1)< 180));
Prob_rojo_20_180 = Casos_ok/( 220 * 220 );
disp(['Probabilidad de elegir un pixel al azar y que su intensidad ' ...
    'en el canal rojo este entre 20-180 es:',num2str(Prob_rojo_20_180)]);

Casos_ok_rojo =  sum(sum(100 < rgbImageLena(:,:,1)&rgbImageLena(:,:,1)< 120));
Prob_rojo_20_180 = Casos_ok_rojo /(220*220);
Casos_ok_azul =  sum(sum(80 < rgbImageLena(:,:,3)& rgbImageLena(:,:,3)< 100));
Prob_azul_20_180 = Casos_ok_azul /(220*220);
Prob_rojo_azul = Prob_rojo_20_180 * Prob_azul_20_180;
disp(['Probabilidad de elegir un pixel al azar y que su intensidad ' ...
    ['en el canal rojo este entre 100-120 y que tambien su intensidad' ...
    'en el canal azul este entre 80-100:'],num2str(Prob_rojo_azul)]);
