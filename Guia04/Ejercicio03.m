close all
clc
clear

Imagen  = imread('moneda.bmp');

whos Imagen

ImagenBin = imbinarize(Imagen);
ImagenBinComplemento = imcomplement(ImagenBin);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Monedas Original');

subplot(1,3,1)
imshow(Imagen)
title('Original')
%imcontrast;

subplot(1,3,2)
imshow(ImagenBin)
title('Binarizada')

subplot(1,3,3);
se = strel('disk',2);
closeBW = imclose(ImagenBinComplemento,se);
imshow(closeBW)
title('Clausura del Complemento')

s = regionprops(closeBW,'centroid');
centroids = cat(1,s.Centroid);
hold on
plot(centroids(:,1),centroids(:,2),'b*')
stats = regionprops("table",closeBW,"Centroid", ...
    "MajorAxisLength","MinorAxisLength","PixelList")
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
viscircles(centers,radii)
Regiones = stats.PixelList;

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Recorte de las 4 monedas');

Mask1 = zeros(256,256,4);
moneda = zeros(256,256,4);
for l = 1:1:4
    aux = cell2mat(stats.PixelList(l));
    for k = 1:size(aux,1)
        Mask1(aux(k,2), aux(k,1),l) = 1; 
    end
    subplot(2,4,l)
    imshow(Mask1(:,:,l))
    title('Mascara')
    subplot(2,4,l+4)
    moneda(:,:,l) = immultiply(im2double(Imagen),im2double(Mask1(:,:,l)));
    imshow(moneda(:,:,l))
    title('Mascara multiplicada imagen')
end

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B: Monedas en su color original y fondo negro');

subplot(1,2,1)
imshow(im2double(Imagen))
title('Original')
subplot(1,2,2)
fondo = moneda(:,:,1) + moneda(:,:,2) + moneda(:,:,3) + moneda(:,:,4);
imshow(fondo)
title('Monedas original con fondo negro')

