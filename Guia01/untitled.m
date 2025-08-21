clear 
close all
clc
%% 7)
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
%%
% Aqu� pueden visualizar la imagen. Con imcontrast pueden jugar un poco con
% los valores como para ver los distintos tejidos, variando el centro y
% ancho. Esto nos va a servir para verificar que estamos haciendo las cosas
% bien en el inciso d).
figure()
imshow(TC,[]);
imcontrast
%% a)
% Convertimos a double para despues poder trabajar con decimales en la
% pendiente y en la ordenada al origen.
min_HU = double(min(TC(:)));
max_HU = double(max(TC(:)));
%% b)

% Necesitamos una LUT para el rango de valores de entrada, es decir, desde
% el minimo hasta el m�ximo. La pendiente podemos calcularla entendiendo
% que tenemos 256 valores posibles a la salida y que a la entrada tenemos
% 2334. La ordenada al origen la calculamos a partir de la pendiente y del
% valor m�nimo.
in = min_HU:max_HU;
c = (256/(max_HU - min_HU + 1));
b = -c*min_HU;

% Rellenamos la LUT con los valores de c y b correspondientes.
LUT = uint8(c*in + b);
% Calculamos los valores de la salida en funci�n de los valores de entrada
% simplemente consultando cada valor en la LUT. Tenemos que tener en cuenta
% que la indexaci�n en matlab no admite el 0 o numeros negativos. Por eso
% debemos restar el minimo y sumar 1 (En caso de que el m�nimo fuera un
% valor por encima de 0 esta formula tambi�n funciona).
out = LUT(TC - min_HU + 1);

figure()
imshow(out)

%% c)
% Ahora podemos facilmente modificar los valores de c y b con valores
% coherentes a partir de los originales. Por ejemplo, aqu� estamos
% duplicando el contraste y sumandole 50 al brillo de salida.
c = 2 * (256/(max_HU - min_HU + 1));
b = 50 + (256/(max_HU - min_HU + 1)) * abs(min_HU);

LUT = uint8(c*in + b);

out = LUT(TC - min_HU + 1);

figure()
imshow(out)
%% d)
% Utilizar el centro y ancho en tomograf�a computada es mucho m�s �til ya
% que las HU nos hablan del nivel de energ�a capturada por cada uno de los
% pixeles. En 0 tenemos el agua. Todo lo que est� por encima del 0 ser� m�s
% radiopaco, permitiendo que los rayos X pasen de un lado a otro con menor
% energ�a (por ejemplo: el hueso). Todo lo que est� por debajo del 0 ser�
% m�s radiolucido, permitiendo que los rayos X pasen de un lado a otro con
% mayor energ�a (por ejemplo: el aire en los pulmones).

% Para poder traducir nuestras coordenadas de centro y ancho a brillo y
% contraste debemos hacer las siguientes cuentas:
centro = 200;
ancho = 600;

% El contraste no depende del centro en el que est� ubicado. Depende
% �nicamente del ancho definido, ya que debemos cubrir los 256 valores de
% la salida para ese ancho. Mientras m�s acotado sea el ancho, mayor
% contraste tendremos entre las estructuras.
c = 256/ancho;
% En cambio, la ordenada al origen, depende tanto del ancho como del
% centro. La manera m�s sencilla de verlo es la siguiente: debemos recorrer
% en X los valores desde el m�nimo hasta 0. El m�nimo puede estar tanto a
% la derecha como a la izquierda del 0, por lo que los signos son
% importantes aqu�. La cantidad de pasos que debemos dar est� delimitado
% por el centro y el ancho/2 (graficar para entender).
% Una vez que sabemos cuantos pasos debemos desplazarnos, simplemente
% multiplicamos por la pendiente recientemente definida y obtenemos la
% ordenada al origen.
b = 256/ancho * (ancho/2 - centro);

LUT = uint8(c*in + b);

out = LUT(TC - min_HU + 1);

figure()
imshow(out)