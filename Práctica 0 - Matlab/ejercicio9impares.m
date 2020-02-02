%ejercicio9impares: Imprime los números impares y sus
%cuadrados que hay entre 1 y 20.

for numImpar = 1:2:20
    fprintf("Número %d al cuadrado es: %d\n",numImpar,numImpar^2);
end