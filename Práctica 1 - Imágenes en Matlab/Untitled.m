%Ejercicio 8
%a

barco=imread('ivc_practica1_imagenes/barco_ruido1.gif');

%Especificamos filtros, m�scaras y desviaciones t�picas
fmedia=fspecial('average',3);
fgaussiano1=fspecial('gaussian',5,0.2);
fgaussiano2=fspecial('gaussian',5,0.5);
fgaussiano3=fspecial('gaussian',5,0.9);

barcoMedia=imfilter(barco,fmedia);
barcoGaussiano1=imfilter(barco,fgaussiano1);
barcoGaussiano2=imfilter(barco,fgaussiano2);
barcoGaussiano3=imfilter(barco,fgaussiano3);
barcoMediana=medfilt2(barco);

figure, imshow(barcoMedia), figure, imshow(barcoGaussiano1);
figure, imshow(barcoGaussiano2), figure, imshow(barcoGaussiano3);
figure, imshow(barcoMediana);

%El mejor filtro para mejorar el ruido es el filtro de mediana


%b
colina=imread('ivc_practica1_imagenes/colina_ruido2.gif');
fmedia3=fspecial('average',3);
fmedia5=fspecial('average',5);
fgaussiano1=fspecial('gaussian',5,0.25);
fgaussiano2=fspecial('gaussian',5,0.5);
fgaussiano3=fspecial('gaussian',5,0.75);

colinaMedia3=imfilter(colina,fmedia3);
colinaMedia5=imfilter(colina,fmedia5);
colinaGaussiano1=imfilter(colina,fgaussiano1);
colinaGaussiano2=imfilter(colina,fgaussiano2);
colinaGaussiano3=imfilter(colina,fgaussiano3);
colinaMediana3=medfilt2(colina, [3 3]);
colinaMediana5=medfilt2(colina, [5 5]);

figure, imshow(colinaMedia3), figure, imshow(colinaMedia5);
figure, imshow(colinaGaussiano1), figure, imshow(colinaGaussiano2);
figure, imshow(colinaGaussiano3);
figure, imshow(colinaMediana3), figure, imshow(colinaMediana5);

%A medida que el filtro es m�s potente podemos eliminar m�s
%cantidad de ruido, sin embargo, las im�genes pierden nitidez.
%La clave es buscar un equilibrio entre ambos factores.
%El filtro que cumple al l�mite dicha estabilidad podr�a
%ser el filtro Gaussiano con desviaci�n 0.5.

%Lo que sucede debe ser que el filtro de gauss se aplica
%mejor a las im�genes con una gran cantidad de ruido
%peque�o (tama�o p�xel menor, mayor cantidad p�xeles).
%Mientras que los filtros de mediana son mejores para
%im�genes con el ruido menos granulado y el gr�nulo m�s grande.


