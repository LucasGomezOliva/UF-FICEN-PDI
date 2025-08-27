close all
clc
clear

%% Ejercicio A

BW  = imread('circles.png');
BW2 = bwmorph(BW,'close');
BW3 = bwmorph(BW,'skel',inf);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen circles.png');

subplot(1,3,1)
imshow(BW)
title('Original')

subplot(1,3,2)
imshow(BW2);
title('Close')

subplot(1,3,3)
imshow(BW3);
title('skel')

%% Ejercicio B

I = imread('Tornillo con ruido.bmp');

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen Tornillo con ruido');

subplot(1,3,1)
imshow(I);
title('Original')

Ibw = imbinarize(I);

subplot(1,3,2)
imshow(Ibw);
title('Binarizacion')

BW = bwmorph(Ibw,'close');

subplot(1,3,3)
imshow(BW);
title('Clausura de la imagen')

%% Ejercicio C

I = imread('Tornillo con ruido.bmp');

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Elementos estructurales');

subplot(3,3,1)
imshow(I);
title('Original')

Ibw = imbinarize(I);

subplot(3,3,2)
imshow(Ibw);
title('Binarizacion')

SE1 = strel('disk',9);
SE2 = strel('square',10);
SE3 = strel('diamond',9);

subplot(3,3,4)
imshow(SE1.Neighborhood)
title('Elemento estructurante disk')
subplot(3,3,5)
imshow(SE2.Neighborhood)
title('Elemento estructurante square')
subplot(3,3,6)
imshow(SE3.Neighborhood)
title('Elemento estructurante diamond')

closeBW = imclose(Ibw,SE1);
subplot(3,3,7)
imshow(closeBW)
title('Resultado disk')

closeBW = imclose(Ibw,SE2);
subplot(3,3,8)
imshow(closeBW)
title('Resultado square')

closeBW = imclose(Ibw,SE3);
subplot(3,3,9)
imshow(closeBW)
title('Resultado diamond')

%% Ejercicio D

F4 = figure(4);
set(F4,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Busco contornos');

SE1 = strel('disk',1);

ImagenErosionada = imerode(Ibw,SE1);

ContornoErosion = Ibw - ImagenErosionada;

ContornoBwmorph = bwmorph(Ibw,'remove');

subplot(1,3,1)
imshow(Ibw);
title('Binarizacion')

subplot(1,3,2)
imshow(ContornoErosion);
title('Contorno Con Disk 1')

subplot(1,3,3)
imshow(ContornoBwmorph);
title('Contorno bwmorph')
