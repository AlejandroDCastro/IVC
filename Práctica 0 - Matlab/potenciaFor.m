%potenciaFor: Recibe dos n�meros, uno la base y otro el exponente
%realizando la operaci�n de potencia con esos dos n�meros.

function potencia = potenciaFor(a, b)

potencia = 1;
a = floor(a);
b = floor(b);
for n = 1:b
   potencia = potencia*a;
end

end