clear 
close all
clc

itest = imread("test.bmp");
itestdouble = im2double(itest);
whos itest itestdouble

%% Filtro media movil

media_movil_2x2 = fspecial("average",[2 2]);
media_movil_3x3 = fspecial("average",[3 3]);
media_movil_5x5 = fspecial("average",[5 5]);

imagen_filtrada1 = filter2(media_movil_2x2,itestdouble);
imagen_filtrada2 = filter2(media_movil_3x3,itestdouble);
imagen_filtrada3 = filter2(media_movil_5x5,itestdouble);

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro de media movil');

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_filtrada1);
title('Imagen con filtro [2 2]');
subplot(2,2,3)
imshow(imagen_filtrada2);
title('Imagen con filtro [3 3]');
subplot(2,2,4)
imshow(imagen_filtrada3);
title('Imagen con filtro [5 5]');

%% Filtro Gaussiano

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro Gaussiano');

gaussiano_sigma_01_3x3 = fspecial("gaussian",[3 3],0.1);
gaussiano_sigma_04_3x3 = fspecial("gaussian",[3 3],0.4);
gaussiano_sigma_04_5x5 = fspecial("gaussian",[5 5],0.4);

imagen_filtrada1 = filter2(gaussiano_sigma_01_3x3,itestdouble);
imagen_filtrada2 = filter2(gaussiano_sigma_04_3x3,itestdouble);
imagen_filtrada3 = filter2(gaussiano_sigma_04_5x5,itestdouble);

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_filtrada1);
title('Imagen con filtro con alfa = 0.1');
subplot(2,2,3)
imshow(imagen_filtrada2);
title('Imagen con filtro con alfa = 0.5');
subplot(2,2,4)
imshow(imagen_filtrada3);
title('Imagen con filtro con alfa = 0.8');

%% Filtro Laplaciano

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro laplaceano');

laplacian_alfa_01 = fspecial("laplacian",0.1);
laplacian_alfa_05 = fspecial("laplacian",0.5);
laplacian_alfa_08 = fspecial("laplacian",0.8);

imagen_laplacian_1 = filter2(laplacian_alfa_01,itestdouble);
imagen_laplacian_2 = filter2(laplacian_alfa_05,itestdouble);
imagen_laplacian_3 = filter2(laplacian_alfa_08,itestdouble);

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_laplacian_1);
title('Imagen con filtro con alfa = 0.1');
subplot(2,2,3)
imshow(imagen_laplacian_2);
title('Imagen con filtro con alfa = 0.5');
subplot(2,2,4)
imshow(imagen_laplacian_3);
title('Imagen con filtro con alfa = 0.8');

%% Filtro LoG

F4 = figure(4);
set(F4,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro Log');

log_sigma_01_3x3 = fspecial("log",[3 3],0.1);
log_sigma_04_3x3 = fspecial("log",[3 3],0.4);
log_sigma_04_8x8 = fspecial("log",[8 8],0.4);

imagen_filtrada1 = filter2(log_sigma_01_3x3,itestdouble);
imagen_filtrada2 = filter2(log_sigma_04_3x3,itestdouble);
imagen_filtrada3 = filter2(log_sigma_04_8x8,itestdouble);

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_filtrada1);
title('Imagen con filtro con sigma = 0.1');
subplot(2,2,3)
imshow(imagen_filtrada2);
title('Imagen con filtro con sigma = 0.4');
subplot(2,2,4)
imshow(imagen_filtrada3);
title('Imagen con filtro con sigma = 0.4');

%% Filtro Prewitt

F5 = figure(5);
set(F5,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro Prewitt');

prewitt_horizontal = fspecial("prewitt");
prewitt_vertical = fspecial("prewitt")';

imagen_filtrada1 = filter2(prewitt_horizontal,itestdouble);
imagen_filtrada2 = filter2(prewitt_vertical,itestdouble);

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_filtrada1);
title('Imagen con filtro prewitt horizontal');
subplot(2,2,3)
imshow(imagen_filtrada2);
title('Imagen con filtro prewitt vertical');

%% Filtro sobel

F6 = figure(6);
set(F6,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro sobel');

sobel_horizontal = fspecial("sobel");
sobel_vertical = fspecial("sobel")';

imagen_filtrada1 = filter2(sobel_horizontal,itestdouble);
imagen_filtrada2 = filter2(sobel_vertical,itestdouble);

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_filtrada1);
title('Imagen con filtro sobel horizontal');
subplot(2,2,3)
imshow(imagen_filtrada2);
title('Imagen con filtro sobel vertical');

%% Filtro pasa altos de 3x3

F7 = figure(7);
set(F7,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Filtro pasa altos de 3x3');

KernelIdentidad = [ 0 0 0 ; 0 1 0 ; 0 0 0 ];

Filtro_pasa_altos = KernelIdentidad - media_movil_3x3;

imagen_filtrada_hp = filter2(Filtro_pasa_altos,itestdouble);

subplot(1,2,1)
imshow(itest);
title('Imagen Original');
subplot(1,2,2)
imshow(imagen_filtrada_hp);
title('Imagen con filtro pasa altos');

%% Filtro High-Boost

F8 = figure(8);
set(F8,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Imagen con Filtro High-Boost');

KernelIdentidad = [ 0 0 0 ; 0 1 0 ; 0 0 0];

Filtro_High_Boost_01 = 1 * KernelIdentidad - media_movil_3x3;
Filtro_High_Boost_02 = 2 * KernelIdentidad - media_movil_3x3;
Filtro_High_Boost_08 = 8 * KernelIdentidad - media_movil_3x3;


imagen_filtrada_HB_01 = filter2(Filtro_High_Boost_01,itestdouble);
imagen_filtrada_HB_02 = filter2(Filtro_High_Boost_02,itestdouble);
imagen_filtrada_HB_08 = filter2(Filtro_High_Boost_08,itestdouble);

subplot(2,2,1)
imshow(itest);
title('Imagen Original');
subplot(2,2,2)
imshow(imagen_filtrada_HB_01);
title('Imagen con Filtro High-Boost con A = 1');
subplot(2,2,3)
imshow(imagen_filtrada_HB_02);
title('Imagen con Filtro High-Boost con A = 2');
subplot(2,2,4)
imshow(imagen_filtrada_HB_08);
title('Imagen con Filtro High-Boost con A = 8');
