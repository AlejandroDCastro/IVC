
% Ejercicio 1
img = imread('ivc_practica3_imagenes/bacteria.tif');
imshow(bacteria);
impixelinfo;
%umbral fondo: 105
%umbral bacteria: 97
%por lo tanto el umbral medio = (105+97)/2 = 101
imhist(bacteria);
%umbral histograma: 102 

level1 = ((101*100)/255)/100;
level2 = ((102*100)/255)/100;
bw1 = im2bw(bacteria, level1);
bw2 = im2bw(bacteria, level2);
imshow(bw1);
imshow(bw2);



eight = imread('ivc_practica3_imagenes/eight.tif');
imshow(eight);
impixelinfo;
%umbral fondo: 222
%umbral bacteria: 198
%por lo tanto el umbral medio = (222+205)/2 = 214
imhist(eight);
%umbral histograma: 171, ya que el valle de pixeles intermedios es muy
%amplio, tomamos un valor intermedio aproximado

level1 = ((210*100)/255)/100;
level2 = ((171*100)/255)/100;
bw1 = im2bw(eight, level1);
bw2 = im2bw(eight, level2);
imshow(bw1);
imshow(bw2);


%Ejercicio 2
level1 = graythresh(bacteria);
bw1 = imbinarize(bacteria, level1);
level2 = graythresh(eight);
bw2 = imbinarize(eight, level2);
imshow(bw1);
imshow(bw2);

[uno,dos] = globalthresh(img, 167, 20);
dos
uno
imshow(uno);
