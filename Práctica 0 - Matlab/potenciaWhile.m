%potenciaWhile: Recibe dos n�meros, uno la base y otro el exponente
%realizando la operaci�n de potencia con esos dos n�meros.

function potencia = potenciaWhile(a, b)

potencia = 1;
a = floor(a);
b = floor(b);
n = 1;
while n<=b
   potencia = potencia*a;
   n = n + 1;
end

end