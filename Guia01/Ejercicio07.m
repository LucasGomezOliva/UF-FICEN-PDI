clear 
close all
clc

[dcm,map]=dicomread('Corte.dcm');
info = dicominfo('Corte.dcm');
F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen DICOM');
imshow(dcm,map)
mx=max(dcm(:));
mn=min(dcm(:));
disp("Maximo:")
disp(mx)
disp("Minimo:")
disp(mn)

% RescaleIntercept -1014
% RescaleSlope = 1

% Leemos el archivo dicom. En info tenemos una estructura con informaci�n
% relevante del corte de la tomograf�a, como por ejemplo la resoluci�n
% espacial (cuantos mil�metros tiene cada pixel en ancho y alto).
info = dicominfo('Corte.dcm');
% En TC tenemos la matriz de valores con las Unidades Hounsfield (HU).
TC = int16(dicomread(info));

%% Corregir valores HU

% Este corte tomogr�fico viene con una pendiente y una ordenada al origen
% para corregir los valores del estudio. Simplemente al aplicar la ecuaci�n
% de la recta pueden convertir los valores de 0 a 2333 a los reales en HU
% (-1024 a 1309).
TC = TC * info.RescaleSlope + info.RescaleIntercept;


figure()
imshow(TC,[]);

figure(3)
TCdcm = int16(dcm) * info.RescaleSlope + info.RescaleIntercept;
imshow(TCdcm,[]);
