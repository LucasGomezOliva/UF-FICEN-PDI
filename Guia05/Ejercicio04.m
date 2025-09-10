close all
clc
clear

%% Ejercicio A

ImagenOriginal  = imread('Lena.png');

theta = 30;
A = [cosd(theta) -sind(theta) 110; ...
     sind(theta)  cosd(theta) 0; ...
     0.001        0.0001       1];

%tform = projective2d(A'); % No recomendada por matlab
tform = projtform2d(A);

ref = imref2d(size(ImagenOriginal));
ImagenTransformada = imwarp(ImagenOriginal, tform, 'OutputView', ref);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio A: Funciones imresize e imcrop');

subplot(1,2,1)
imshow(ImagenOriginal)
title('Imagen Original')

subplot(1,2,2)
imshow(ImagenTransformada)
title('Imagen Transformada (Proyectiva)')

%% Ejercicio B

I1 = rgb2gray(ImagenOriginal);
I2 = rgb2gray(ImagenTransformada);

points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B: matchFeatures');

subplot(2,1,1)
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,"montage");
title('Imagen original e Imagen transformada en escala de grises')

subplot(2,1,2)
I1RGB = ImagenOriginal;
I2RGB = ImagenTransformada;
showMatchedFeatures(I1RGB,I2RGB,matchedPoints1,matchedPoints2,"montage");
title('Imagen original e Imagen transformada en RGB')

%% Ejercicio C

%   Utilizando las matrices con el metodo de cuadrados minimos

matched_coords1 = matchedPoints1.Location;  % Puntos validos
matched_coords2 = matchedPoints2.Location;  % Puntos validos

NQ = size(matched_coords1,1);
Q = [matched_coords1, ones(NQ,1)]';

NP = size(matched_coords2,1);
P = [matched_coords2, ones(NP,1)]'; 

T = Q * transpose(P) / (P * transpose(P));

tform_i = projtform2d(T);

ref = imref2d(size(ImagenOriginal));

ImagenReconstruida = imwarp(ImagenTransformada, tform_i, 'OutputView', ref);

%   Utilizando funcion estimateGeometricTransform2D

tform_i = estimateGeometricTransform2D(matchedPoints2, matchedPoints1, 'projective');

ImagenReconstruidaFuncionMatlab = imwarp(ImagenTransformada, tform_i, 'OutputView', ref);

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio C: Imagen reconstruida');

subplot(2,2,1)
imshow(ImagenOriginal)
title('Imagen Original')

subplot(2,2,2)
imshow(ImagenTransformada)
title('Imagen Transformada (Proyectiva)')

subplot(2,2,3)
imshow(ImagenReconstruida)
title('Imagen Reconstruida usando matrices')

subplot(2,2,4)
imshow(ImagenReconstruidaFuncionMatlab)
title('Imagen Reconstruida usando funcion matlab')
