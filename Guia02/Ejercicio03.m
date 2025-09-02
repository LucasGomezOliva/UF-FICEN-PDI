clear 
close all
clc

rgbImageLena = imread("Lena.png");
grayImageLena= rgb2gray(rgbImageLena);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen RGB y en escala de grises');

ImagenResultado = OperacionImagenes(rgbImageLena,rgbImageLena,'Suma');

imshow(ImagenResultado)

figure()
imshow(imadd(rgbImageLena,rgbImageLena))
