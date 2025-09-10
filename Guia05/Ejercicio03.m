close all
clc
clear

Imagen  = imread('Lena.png');

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio A: Funciones imresize e imcrop');

subplot(1,3,1)
imshow(Imagen)
title('Imagen Original')

T = [110; 110]; % Punto arbitrario

k1 = 0.5;   % coeficiente de cizallamiento horizontal
k2 = 0.4;   % coeficiente de cizallamiento vertical

R = [1 k1; k2 1];            % matriz 2x2 de cizallamiento

T_ = R * (-T) + T;  % T prima es mi vector de traslacion del centro
A = [R T_; 0 0 1];  % Armo mi matriz de transformacion

tform = affine2d(A');
ref = imref2d(size(Imagen(:,:,1)));
ImagenCizallamiento = imwarp(Imagen,tform,'OutputView',ref);

subplot(1,3,2)
imshow(ImagenCizallamiento);
title('Cizallamiento')

tform_inv = invert(tform);  % calcula la inversa de la transformación
ImagenOriginal = imwarp(ImagenCizallamiento, tform_inv, 'OutputView', ref);

subplot(1,3,3)
imshow(ImagenOriginal)
title('Imagen usando A inversa')
