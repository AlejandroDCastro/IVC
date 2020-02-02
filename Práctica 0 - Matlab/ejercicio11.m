%ejercicio11: Solicita un número entero e indica si es primo o no.

numero = input("Introduce un número entero: ");
for n = 1:numero
    if mod(numero,n)==0
        if (n>1 && n<numero) || numero==1
            fprintf("El número %d no es primo.\n",numero);
            break;
        elseif n==numero
           fprintf("El número %d es primo.\n",numero);
        end
    end
end