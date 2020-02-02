%ejercicio11funcion: Recibe un entero y devuelve un resultado
%logico para indicar si el número es primo o no.

function primo = ejercicio11funcion(numero)

for n = 1:numero
    if mod(numero,n)==0
        if (n>1 && n<numero) || numero==1
            primo = false;
            break;
        elseif n==numero
            primo = true;
        end
    end
end

end