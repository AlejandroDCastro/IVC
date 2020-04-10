%globalthresh.m: Algoritmo básico de umbralización global


function [imagen, tf] = globalthresh(img, t0, et)

%Averiguamos el tamanyo de la matriz
[m,n] = size(img);
tf = t0;

%Calculamos el nuevo umbral
while tf>=et
    m1 = 0;
    cont1 = 0;
    m2 = 0;
    cont2 = 0;
    for x = 1:m
        for y = 1:n
            if img(x,y)>tf %Claros
                m1 = m1 + img(x,y);
                cont1 = cont1 + 1;
            else           %Oscuros
                m2 = m2 + img(x,y);
                cont2 = cont2 + 1;
            end
        end
    end
    
    %Calculamos la media de los valores de intensidad
    m1 = m1/cont1;
    m2 = m2/cont2;
    
    %Nuevo umbral
    tf = 0.5*(m1+m2);
end

%Creamos la imagen
imagen = imbinarize(img, tf);
