%potenciaFor: Recibe dos números, uno la base y otro el exponente
%realizando la operación de potencia con esos dos números.

function potencia = potenciaFor(a, b)

potencia = 1;
a = floor(a);
b = floor(b);
for n = 1:b
   potencia = potencia*a;
end

end