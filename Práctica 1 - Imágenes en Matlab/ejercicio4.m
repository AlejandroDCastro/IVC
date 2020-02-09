%ejercicio4: Script que lee la quinta imagen del gif
%animado “mrbean2.gif” y la transforma a escala de grises.
%A partir del histograma de esta imagen, se elige
%el valor de intensidad que más se repite y guarda
%la imagen en un archivo gif donde este valor de
%intensidad más repetido sea el color transparente.

%
[mrbean,mapa] = imread('ivc_practica1_imagenes/mrbean2.gif', 'Frames', 5);

%gif tipo de imagen indexada
imagen = ind2gray(mrbean,mapa);
[x,y] = imhist(imagen);

%Obtenemos el valor más frecuente en el array
color = mode(x);
imwrite(imagen,'ivc_practica1_imagenes/beanTransparente.gif','TransparentColor',color);