clear 
close all
clc

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
        'Imagen RGB y en escala de grises');

NuevaImagen = grayImageLena;
NuevaImagen(grayImageLena < 100 ) = 100;
NuevaImagen(grayImageLena > 150 ) = 150;

subplot(1,2,1);
imshow(grayImageLena)
subplot(1,2,2)
imshow(NuevaImagen)

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Region filas 100-220 y columnas 150-200');

imshow(grayImageLena(100:220,150:200))
impixelinfo;
datacursormode on
