%ejercicio9: Realiza una serie de transformaciones
%sobre la imagen 'despiste_ua.png'.

imagen=imread('ivc_practica1_imagenes/despiste_ua.png');
%Recortamos manualmente y copiamos posición
despisteRecortado=imcrop(imagen,[27.5 34.5 208 155]);

%a) Rotado
despisteRotado=imrotate(despisteRecortado,-45);
%b) Translado
despisteTransladado=imtranslate(despisteRotado,[35 40]);
%c) Sesgado
transSesgado=maketform('affine',[1 0 0;.2 1 0;0 0 1]);
despisteSesgado=imtransform(despisteTransladado,transSesgado);
%d) Escalado
transEscalado=maketform('affine',[1.5 0 0;0 1.5 0;0 0 1]);
despisteEscalado=imtransform(despisteSesgado,transEscalado);
%e) Rotación y Translado combinado
rad=deg2rad(-10);
trotacion=maketform('affine',[cos(rad) sin(rad) 0;-sin(rad) cos(rad) 0;0 0 1]);
ttranslacion=maketform('affine',[1 0 0;0 1 0;0 -40 1]);
transCombinado=maketform('composite',trotacion,ttranslacion);
despisteCombinado=imtransform(despisteEscalado,transCombinado);
imshow(despisteCombinado);
