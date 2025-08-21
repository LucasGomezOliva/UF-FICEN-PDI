close all
clc
clear

rgbImageLena = imread("Lena.png");

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
        'Canales');

subplot(2,3,1)
canal_rojo = rgbImageLena(:,:,1);
imshow(canal_rojo);
title('Canal Rojo');
subplot(2,3,2)
canal_verde = rgbImageLena(:,:,2);
imshow(canal_verde);
title('Canal Verde');
subplot(2,3,3)
canal_azul = rgbImageLena(:,:,3);
imshow(canal_azul);
title('Canal Azul');
subplot(2,3,4)
vector_zeros = zeros(size(canal_rojo));
imshow(cat(3,canal_rojo,vector_zeros,vector_zeros));
title('Canal Rojo');
subplot(2,3,5)
canal_verde = rgbImageLena(:,:,2);
imshow(cat(3,vector_zeros,canal_verde,vector_zeros));
title('Canal Verde');
subplot(2,3,6)
canal_azul = rgbImageLena(:,:,3);
imshow(cat(3,vector_zeros,vector_zeros,canal_azul));
title('Canal Azul');