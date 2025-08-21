clear 
close all
clc

rgbImageLena = imread("Lena.png");
grayImageLena= rgb2gray(rgbImageLena);

LUT = GenerarLUT(10, 1.2);

I_out = AplicarLUT(grayImageLena, LUT);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen RGB y en escala de grises');

subplot(1,2,1);
imshow(grayImageLena);
title('Original');
subplot(1,2,2);
imshow(I_out);
title('Brillo +50, Contraste 1.2');

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen RGB y en escala de grises');

subplot(2,1,1);
plot(grayImageLena, I_out, '.');
title('LUT')
xlabel('Intensidades de la imagen')
ylabel('Intensidades de la Representación')
grid on;
subplot(2,1,2);
plot(LUT);
title('LUT')
xlabel('Intensidades de la imagen')
ylabel('Intensidades de la Representación')
grid on;

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio C: Imagen en negativo');

LUT_negativo = 255:-1:0;
Imagen_negativa = AplicarLUT(grayImageLena, LUT_negativo);
subplot(2,3,1);
imshow(grayImageLena);
title('Original');
subplot(2,3,2)
imshow(Imagen_negativa)
title('Negativo aplicando LUT')
subplot(2,3,3)
imshow(imcomplement(grayImageLena))
title('Negativo con funcion imcomplement')
subplot(2,3,[4 5 6]);
plot(LUT_negativo);
title('LUT')
xlabel('Intensidades de la imagen')
ylabel('Intensidades de la Representación')
grid on;

% Otra forma de obtener el negativo:
%
% Imagen_negativa = 256 - grayImageLena;
%

F4 = figure(4);
set(F4,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio D: Contrast Stretching con dos puntos');

I1 = 50;
O1 = 50;
O2 = 200;
I2 = 100;
LUT_dos_puntos = zeros(1,256);
for k = 0:1:255
    if k < I1
        LUT_dos_puntos(k+1) = (O1/I1) * k;
    elseif k <= I2
        LUT_dos_puntos(k+1) = O1 + ( (O2 - O1) / (I2 - I1) ) * (k - I1);
    else
        LUT_dos_puntos(k+1) = O2 + ( (255 - O2) / (255 - I2) ) * (k - I2);
    end
end

subplot(2,2,1)
imshow(grayImageLena)
title('Original');
subplot(2,2,2)
ImagenEjercicioD = AplicarLUT(grayImageLena, LUT_dos_puntos);
imshow(ImagenEjercicioD)
title('Imagen modificada');
subplot(2,2,[3 4])
plot(0:255,LUT_dos_puntos);
grid on;
hold on;
plot(0,0,'bo');
plot(I1,O1,'bo');
plot(I2,O2,'bo');
plot(255,255,'bo');
title('LUT');
xlabel('Intensidades de la imagen');
ylabel('Intensidades de la Representación');

F5 = figure(5);
set(F5,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio E: Histograma acumulado');

[counts, binLocations] = imhist(grayImageLena);
cumulativeCounts = cumsum(counts);
cumulativeCounts = cumulativeCounts / max(cumulativeCounts);  % Normalizar
plot(binLocations, cumulativeCounts, 'b', 'LineWidth', 2);
hold on;
plot(binLocations, linspace(0, 1, length(binLocations)), 'r--', 'LineWidth', 2);
grid on;
hold off;
xlabel('Intensidad de pixel');
ylabel('Probabilidad acumulada');
title('Histograma Acumulado de Lena');
legend('Histograma Acumulado', 'Recta Identidad');

F6 = figure(6);
set(F6,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio F: Binarizo una imagen');



