
%ejercicio 2
mapa=imread('ivc_practica1_imagenes/mapa.png');
mapaGris=rgb2gray(mapa);
mapaBinario=imbinarize(mapaGris);
imshow(mapaBinario);
%Usamos el elemento estructurante de disco con radio = 30
SE=strel('disk',30);
%Bottom-hat
cierre=imclose(mapaBinario,SE);
imshow(cierre);
BH=imbothat(mapaBinario,SE);
imshow(BH);
%Rellenamos los agujeros del mapa binario
mapaSinIslas=imfill(mapaBinario,'holes');
BH2=imbothat(mapaSinIslas,SE);
%La diferencia será el resultado
resultado=BH-BH2;
figure, imshow(resultado);