close all
clc
clear

%% Ejercicio A

Imagen  = imread('Lena.png');

F1 = figure(1);
set(F1,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio A: Función imtranslate');

subplot(1,3,1)
imshow(Imagen)
title('Original')

subplot(1,3,2)
ImagenTransladada = imtranslate(Imagen,[30 30], 'FillValues',0,'OutputView','full');
imshow(ImagenTransladada)
title('Transladada')

subplot(1,3,3)
ImagenTransladadaCirc = circshift(Imagen,50,2);
imshow(ImagenTransladadaCirc)
title('Transladada Circularmente')

%% Ejercicio B

F2 = figure(2);
set(F2,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B - i: Función imrotate');

subplot(1,3,1)
imshow(Imagen)
title('Original')

subplot(1,3,2)
ImagenRotada = imrotate(Imagen,45,"bicubic","loose");
imshow(ImagenRotada)
title('Rotada con loose')

subplot(1,3,3)
ImagenRotada = imrotate(Imagen,45,"bicubic","crop");
imshow(ImagenRotada)
title('Rotada con crop')

F3 = figure(3);
set(F3,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B - ii: Rotacion 45 y -45');

subplot(1,3,1)
imshow(Imagen)
title('Original')

subplot(1,3,2)
ImagenRotada = imrotate(Imagen,45,"bicubic");
imshow(ImagenRotada)
title('Rotada 45°')

subplot(1,3,3)
ImagenRotada = imrotate(ImagenRotada,-45,"bicubic");
imshow(ImagenRotada)
title('Rotada -45°')

F4 = figure(4);
set(F4,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B - iii: Rotacion 360° usando crop');

ImagenRotada = Imagen;
k = 1;
for grados = 1:1:360
    ImagenRotada = imrotate(ImagenRotada,1,"bicubic","crop");
    if mod(grados,36) == 0
        subplot(3,4,k)
        imshow(ImagenRotada)
        title(['Rotacion ',num2str(grados),'°',' con k = ',num2str(k)])
        k = k + 1;
    end
end

ImagenRotada = imrotate(Imagen,360,"bicubic","crop");
subplot(3,4,k)
imshow(ImagenRotada)
title(['Rotacion ',num2str(360),'°'])

F5 = figure(5);
set(F5,'position',[80 130 900 550],'Menubar','figure',...
        'NumberTitle','off','name',...
        'Ejercicio B - iiii: Rotacion centro arbitrario');

subplot(1,2,1)
imshow(Imagen)
title('Original')

subplot(1,2,2)
ImagenRotada = imRotateTranslate(Imagen,-45,[110 110]',1);
imshow(ImagenRotada)
title('Rotada')

figure(5);
figure(4);
figure(3);
figure(2);
figure(1);
