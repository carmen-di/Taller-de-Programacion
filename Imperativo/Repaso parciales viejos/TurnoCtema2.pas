program supermercado;
type
  sub_mes = 1..12;
  compra = record
     monto: real;
	   cliente: integer;
	   mes: sub_mes;
  end;
  
  vector = array [sub_mes] of real;
	
  cliente = record
	   codigo: integer;
	   vec: vector;
  end;
	
  arbol = ^nodo;
  nodo = record
	   dato: cliente;
	   hi: arbol;
	   hd: arbol;
  end;

procedure inicializarVector(var v: vector);
var
  i: sub_mes;
begin
  for i:= 1 to 12 do
	 v[i]:= 0;
end;

procedure leerCompra(var c: compra);
begin
  c.cliente:= random(100);
  writeln('Codigo: ', c.cliente); 
  if (c.cliente <> 0) then begin
	  c.monto:= random(20000) / (random(10)+1);
	  writeln('Monto $: ', c.monto:5:1); 
	  c.mes:= random(12) + 1;
	  writeln('Mes: ',c.mes); 
  end;
end;

procedure insertarAlArbol(var a: arbol; c: compra); 
begin
  if (a = nil) then begin
	 new(a);
	 inicializarVector(a^.dato.vec);
   a^.dato.codigo:= c.cliente;
   a^.dato.vec[c.mes]:= a^.dato.vec[c.mes] + c.monto;
	 a^.hi:= nil;
	 a^.hd:= nil;
  end
  else
     if (c.cliente = a^.dato.codigo) then
         a^.dato.vec[c.mes]:= a^.dato.vec[c.mes] + c.monto
     else
	 if (c.cliente < a^.dato.codigo) then
	     insertarAlArbol(a^.hi, c)
	 else
		   insertarAlArbol(a^.hd, c);
end;

procedure cargarArbol(var a: arbol);
var
  c: compra;
begin
  a:= nil;
  leerCompra(c);
  while (c.cliente <> 0) do begin
     insertarAlArbol(a, c);
     leerCompra(c);
  end;
end;

procedure imprimirArbol(a: arbol);
var
  i: sub_mes;
begin
  if (a <> nil) then begin
    imprimirArbol(a^.hi);
    writeln('Codigo: ', a^.dato.codigo);
    for i:= 1 to 12 do begin
      writeln('Mes: ',i);
      writeln('Monto: $ ', a^.dato.vec[i]:5:2);
      writeln('--------------')
    end;
    writeln();
    imprimirArbol(a^.hd);
  end;
end;

// Inciso b)
function maximo(v: vector): integer;
var
  i, mesMax: integer; 
  max: real;
begin
  max:= -1;
  for i:= 1 to 12 do begin
     if (v[i] > max) then begin
        max:= v[i];
        mesMax:= i;
     end;
     maximo:= mesMax;
  end;
end; 

function mayorGasto(a: arbol; codigo: integer): integer;
begin
  if (a = nil) then
     mayorGasto:= -1
  else
     if (codigo = a^.dato.codigo) then
        mayorGasto:= maximo(a^.dato.vec)
     else
        if (codigo < a^.dato.codigo) then
          mayorGasto:= mayorGasto(a^.hi, codigo)
        else
          mayorGasto:= mayorGasto(a^.hd, codigo);	
end; 

procedure mayorGasto(a: arbol);
var
  codCliente, mes: integer;
begin
  write('Ingrese un codigo de cliente: ');
  readln(codCliente);
  mes:= mayorGasto(a, codCliente);
  writeln('El mes con mayor gasto del cliente con codigo ', codCliente, ' es: ', mes);
end;

// Inciso c)
function calcularCant(a: arbol; mes: integer): integer;
begin
  if (a = nil) then
     calcularCant:= 0
  else
     if (a^.dato.vec[mes] = 0) then
        calcularCant:= calcularCant(a^.hi, mes) + calcularCant(a^.hd, mes) + 1
     else
        calcularCant:= calcularCant(a^.hi, mes) + calcularCant(a^.hd, mes);
end;

procedure gastoCero(a: arbol);
var
  mes, cant: integer;
begin
  write('Ingrese un numero de mes: ');
  readln(mes);
  cant:= calcularCant(a, mes);
  writeln('Para el mes ', mes, ' la cantidad de clientes que no gastaron en dicho mes es: ', cant);
end;

var
  a: arbol;
begin
  randomize;
  cargarArbol(a);
  imprimirArbol(a);
  writeln();
  mayorGasto(a);
  writeln();
  gastoCero(a);
end.
