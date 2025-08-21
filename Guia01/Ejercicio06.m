clear 
close all
clc

[dcm,map]=dicomread('Corte.dcm');
dicomdisp('Corte.dcm')
info = dicominfo('Corte.dcm');
F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen DICOM');
imshow(dcm,map);
imcontrast;

F2 = figure(2);

set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen DICOM: Histograma');

histogram(dcm);
grid on;
% RescaleIntercept -1014
% RescaleSlope = 1