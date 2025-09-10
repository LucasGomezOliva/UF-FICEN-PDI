close all
clc
clear

%% Ejercicio A

Imagen  = imread('Lena.png');

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio A: Funciones imresize e imcrop');

subplot(2,3,1)
imshow(Imagen)
title('Original')

subplot(2,3,2)
ImagenResize04 = imresize(Imagen,0.4);
imshow(ImagenResize04)
title('Resize = 0.4')

subplot(2,3,3)
ImagenResize40 = imresize(Imagen,40);
imshow(ImagenResize40)
title('Resize = 40')

subplot(2,3,4)
ImagenCrop = imcrop(Imagen,[110 110 40 10]);
imshow(ImagenCrop)
title('Original imcrop')

subplot(2,3,5)
ImagenCrop = imcrop(ImagenResize04,0.4*[110 110 40 10]);
imshow(ImagenCrop)
title('Resize = 0.4 imcrop')

subplot(2,3,6)
ImagenCrop = imcrop(ImagenResize40,40*[110 110 40 10]);
imshow(ImagenCrop)
title('Resize = 40 imcrop')

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B: Escalado con centro arbitrario');

Imagen  = imread('Lena.png');

Y = imResize(Imagen, 4, [110 110], 'nearest');

imshow(Y)
title('Escalado 0.5x respecto al centro de la imagen')