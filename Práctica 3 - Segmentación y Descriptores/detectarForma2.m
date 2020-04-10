%detectarForma2.m: Detecta una forma especifica en una imagen


function [numforma,imgd] = detectarForma2(imgo,forma)

%Encontramos los objetos en la imagen
img = rgb2gray(imgo);

%Especificamos un nivel muy bajo para que no reduzca la intensidad los
%colores más oscuros a negro
imgbw = imbinarize(imcomplement(img), 0.01);
cc = bwconncomp(imgbw);
%imshow(labelmatrix(cc));

%Hallamos las formas posibles
stats = 0;
if forma==1 %Circulos
    stats = regionprops(cc, 'BoundingBox', 'Area', 'Perimeter', 'Centroid');
    area = [stats.Area];  perimeter = [stats.Perimeter];
    circularidad = (4*pi*area)./(perimeter.^2);
    idx = find(circularidad >= 1.0);
elseif forma==2 %Triangulos
    stats = regionprops(cc, 'BoundingBox', 'Area', 'Perimeter', 'Extent', 'Centroid');
    area = [stats.Area];  perimeter = [stats.Perimeter];
    relacion = [stats.Extent];
    circularidad = (4*pi*area)./(perimeter.^2);
    idx = find(relacion~=1 & circularidad<1.0);
elseif forma==3 %Cuadrados
    stats = regionprops(cc, 'BoundingBox', 'MajorAxisLength', 'MinorAxisLength', 'Area', 'Perimeter', 'Centroid');
    ejemax = [stats.MajorAxisLength];  ejemin = [stats.MinorAxisLength];
    area = [stats.Area];  perimeter = [stats.Perimeter];
    circularidad = (4*pi*area)./(perimeter.^2);
    idx = find(ejemax==ejemin & circularidad<1.0);
elseif forma==4 %Cuadrados
    stats = regionprops(cc, 'BoundingBox', 'MajorAxisLength', 'MinorAxisLength', 'Extent', 'Centroid');
    ejemax = [stats.MajorAxisLength];  ejemin = [stats.MinorAxisLength];
    relacion = [stats.Extent];
    idx = find(ejemax~=ejemin & relacion==1);
end

%Averiguamos el numero de formas
[x,y] = size(idx);
numforma = y*x;

%Y la imagen con dichas formas
imgd = ismember(labelmatrix(cc), idx);

%Dibujamos con el plot
imshow(imgd);
for i = 1:numforma
    hold on
    elemento = stats(idx(i));
    plot(elemento.Centroid(1), elemento.Centroid(2), 'rx');
    rectangle('Position', elemento.BoundingBox, 'EdgeColor','g', 'LineWidth',2);
    text(elemento.Centroid(1)+5, elemento.Centroid(2)+5, int2str(i), 'FontSize', 8);
end