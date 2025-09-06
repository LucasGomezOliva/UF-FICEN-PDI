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

subplot(2,2,1)
imshow(Imagen)
title('Original')

subplot(2,2,2)
imshow(ImagenBin)
title('Binarizada')

se = strel('disk',2);
closeBW = imclose(ImagenBinComplemento,se);

subplot(2,2,3);
imshow(closeBW)
title('Clausura del Complemento')

subplot(2,2,4)
imshow(closeBW)
title('Regiones marcadas')
hold on

s = regionprops(closeBW,'centroid');
centroids = cat(1,s.Centroid);
plot(centroids(:,1),centroids(:,2),'b*');
stats = regionprops("table",closeBW,"Centroid", ...
    "MajorAxisLength","MinorAxisLength","PixelList","Area","Perimeter");
stats.Radius = stats.Perimeter /(2*pi);
disp(stats);
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
viscircles(centers,radii);
Regiones = stats.PixelList;

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Recorte de las 4 monedas');

Mask = zeros(256,256,4);
moneda = zeros(256,256,4);
for l = 1:1:4
    aux = cell2mat(stats.PixelList(l));
    for k = 1:size(aux,1)
        Mask(aux(k,2), aux(k,1),l) = 1; 
    end
    subplot(2,4,l)
    imshow(Mask(:,:,l))
    title('Mascara')
    subplot(2,4,l+4)
    moneda(:,:,l) = immultiply(im2double(Imagen),im2double(Mask(:,:,l)));
    imshow(moneda(:,:,l))
    title('Mascara multiplicada imagen')
end

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio A: Monedas de colores');

[L, num] = bwlabel(closeBW);

RGB_label = label2rgb(L,'jet','k','shuffle');

subplot(1,2,1)
imshow(Imagen)
title('Original')

subplot(1,2,2)
imshow(RGB_label)
title(['Monedas de colores distintos (total = ' num2str(num) ')'])

F4 = figure(4);
set(F4,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B: Monedas en su color original y fondo negro');

subplot(1,2,1)
imshow(im2double(Imagen))
title('Original')

fondo = moneda(:,:,1) + moneda(:,:,2) + moneda(:,:,3) + moneda(:,:,4);

subplot(1,2,2)
imshow(fondo)
title('Monedas original con fondo negro')

F5 = figure(5);
set(F5,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio C: Monedas blancas con fondo negro y centro marcado');

monedasBlancas = closeBW;

centros = round(centroids);

for i = 1:size(centros,1)
    monedasBlancas(centros(i,2),centros(i,1)) = 0;
end

subplot(1,3,1)
imshow(Imagen)
title('Original')

subplot(1,3,2)
imshow(closeBW)
title('Clausura del complemento')

subplot(1,3,3)
imshow(monedasBlancas)
title('Clausura del complemento con centro')

figure(5);
figure(4);
figure(3);
figure(2);
figure(1);
