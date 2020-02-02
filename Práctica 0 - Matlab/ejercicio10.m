%ejercicio10: Lee números enteros procedentes del teclado y
%cada vez que el número sea par lo eleva al cuadrado.
%El programa termina cuando el usuario introduzca 0.

numero = 1;
while numero~=0
    numero = input("Introduce un número entero: ");
    if numero~=0
        if mod(numero,2)==0
            fprintf("Número %d al cuadrado: %d\n",numero,numero^2);
        elseif mod(numero,2)~=mod(floor(numero),2)
            fprintf("%f no es un número entero\n",numero);
        end
    end
end
    