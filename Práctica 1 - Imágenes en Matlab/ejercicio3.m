%ejercicio3: Script que permite obtener el histograma
%de una imagen en escala de grises.
%Comparar el resultado con el histograma que se obtiene
%al utilizar la función imhist y comentar las diferencias.

mano = imread('imagenes/mano_ua.jpg');
imagen = rgb2gray(mano);

%Obtenemos el número de elementos de la matriz
totalPixeles = numel(imagen);

% Y creamos el histograma
histograma = zeros(256,1);
for i = 1:totalPixeles
    valor = imagen(i);
    histograma(valor+1) = histograma(valor+1) + 1;
end

%Mostramos los resultados en una nueva ventana
bar(m,'r');
title('Histograma de script');
figure, imhist(imagen);
title('Histograma de función');