%potenciaWhile: Recibe dos números, uno la base y otro el exponente
%realizando la operación de potencia con esos dos números.

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