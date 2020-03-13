%ejercicio3.m: Aplicar el algoritmo de Harris-Stephen
%y Shi-Tomasi a la imagen "ajedrez.gif"

ajedrez = imread('ivc_practica2_imagenes/ajedrez.gif');

%Matrices mx2...
harris = corner(ajedrez, 'Harris');
shi = corner(ajedrez, 'MinimumEigenvalue');
imshow(ajedrez);

%Averiguamos la cantidad de esquinas...
[h1,h2] = size(harris);
[s1,s2] = size(shi);

% Pintamos sobre la imagen...
hold on
plot(harris(:,1), harris(:,2), 'r*');
plot(shi(:,1), shi(:,2), 'b+');
hold off

fprintf('Esquinas con Harris-Stephen: %i\n', h1);
fprintf('Esquinas con Shi-Tomasi: %i\n', s1);
