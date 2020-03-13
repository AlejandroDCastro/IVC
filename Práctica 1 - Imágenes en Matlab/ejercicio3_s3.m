%ejercicio3_s3: 3.	Implementar un script que permita
%los puntos de las líneas en la imagen “puntosylineas.gif”.
%Utilizar para ello los distintos filtros de morfología
%vistos en clase que más interesen para la aplicación.

puntosylineas=imread('ivc_practica1_imagenes/puntosylineas.gif');
se = strel('disk',6);
circulo = imopen(img,se);

se2 = strel('disk',1);
circuloDilatado=imdilate(circulo,se2);
lineas=img-circuloDilatado;

complementaria=imcomplement(img);

linea1 = strel('line',100,0);
elinea1=imclose(complementaria,linea1);
clinea1 = imcomplement(elinea1);

linea2 = strel('line',60,80);
elinea2=imclose(complementaria,linea2);
clinea2 = imcomplement(elinea2);

linea3 = strel('line',60,90);
elinea3=imclose(complementaria,linea3);
clinea3 = imcomplement(elinea3);

linea4 = strel('line',40,10);
elinea4=imclose(complementaria,linea4);
clinea4 = imcomplement(elinea4);

linea5 = strel('line',30,350);
elinea5=imclose(complementaria,linea5);
clinea5 = imcomplement(elinea5);

linea6 = strel('line',40,140);
elinea6=imclose(complementaria,linea6);
clinea6 = imcomplement(elinea6);

linea7 = strel('line',60,130);
elinea7=imclose(complementaria,linea7);
clinea7 = imcomplement(elinea7);



imFinal=lineas+clinea1+clinea2+clinea3+clinea4+clinea5+clinea6+clinea7;
figure, imshow(elinea1), figure, imshow(clinea1), 
%imgFin=lineaCerrada+lineaCerrada2+lineas;

%figure, imshow(img), figure, imshow(circulo), 
%figure, imshow(lineas), figure, imshow(imgFin)