%detectarForma.m: Detecta una forma especifica en una imagen


function [numforma,imgd] = detectarForma(imgo,forma)

%Encontramos los objetos en la imagen
img = rgb2gray(imgo);

%Especificamos un nivel muy bajo para que no reduzca la intensidad los
%colores más oscuros a negro
imgbw = imbinarize(imcomplement(img), 0.01);
cc = bwconncomp(imgbw);
%imshow(labelmatrix(cc));

%Hallamos las formas posibles
if forma==1 %Circulos
    stats = regionprops(cc, 'Area', 'Perimeter');
    area = [stats.Area];  perimeter = [stats.Perimeter];
    circularidad = (4*pi*area)./(perimeter.^2);
    idx = find(circularidad >= 1.0);
elseif forma==2 %Triangulos
    stats = regionprops(cc, 'Area', 'Perimeter', 'Extent');
    area = [stats.Area];  perimeter = [stats.Perimeter];
    relacion = [stats.Extent];
    circularidad = (4*pi*area)./(perimeter.^2);
    idx = find(relacion~=1 & circularidad<1.0);
elseif forma==3 %Cuadrados
    
    %Calculamos tambien la circularidad y no la relacion extent por si el
    %cuadrado tiene una oriencion diferente. En caso, contrario el
    %boundingbox no instanciaria dicha orientacion
    stats = regionprops(cc, 'MajorAxisLength', 'MinorAxisLength', 'Area', 'Perimeter');
    ejemax = [stats.MajorAxisLength];  ejemin = [stats.MinorAxisLength];
    area = [stats.Area];  perimeter = [stats.Perimeter];
    circularidad = (4*pi*area)./(perimeter.^2);
    idx = find(ejemax==ejemin & circularidad<1.0);
elseif forma==4 %Cuadrados
    
    %En este caso, usamos extent por simplicidad
    stats = regionprops(cc, 'MajorAxisLength', 'MinorAxisLength', 'Extent');
    ejemax = [stats.MajorAxisLength];  ejemin = [stats.MinorAxisLength];
    relacion = [stats.Extent];
    idx = find(ejemax~=ejemin & relacion==1);
end

%Averiguamos el numero de formas
[x,y] = size(idx);
numforma = y*x;

%Y la imagen con dichas formas
imgd = ismember(labelmatrix(cc), idx);
