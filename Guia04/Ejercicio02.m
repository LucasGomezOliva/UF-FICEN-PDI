close all
clc
clear

Imagen  = imread('RectánguloRombo.bmp');
ImagenBin = imbinarize(Imagen);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Rctangulo y Rombo');

subplot(1,3,1)
imshow(ImagenBin)
title('Original')

SE = strel('diamond',50);

Iaux = imerode(ImagenBin,SE);
ImagenRombo = imdilate(Iaux,SE);
subplot(1,3,2)
imshow(ImagenRombo);
title('Solo rombo')

SE = strel('square',80);
Iaux = imerode(ImagenBin,SE);
ImagenRectangulo = imdilate(Iaux,SE);
subplot(1,3,3)
imshow(ImagenRectangulo);
title('Solo Rectangulo')