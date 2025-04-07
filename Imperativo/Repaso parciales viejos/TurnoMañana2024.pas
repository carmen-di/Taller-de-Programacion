{Un supermercado quiere llevar un registro de todas sus ventas, de cada venta se lee el codigo, dni del cliente, suscursal en la que compró (1..5) y monto gastado, la lectura se detiene con el código de venta 0, se pide:
A- crear una estructura eficiente para la busqueda por dni de cliente, de cada cliente se guarda el monto gastado en cada sucursal
B-un módulo que reciba la estructura generada en A y un número de sucursal y retorne la cantidad de clientes que no gastaron nada en la sucursal
C-un modulo que reciba la estructura generara en A y un dni y retorne el monto total general gastado por dicho dni (es decir, la suma de los montos de todas las sucursales)}

program supermercado;
type
  rango = 1..5;
  
  venta = record
     codigo: integer;
     dni: integer;
     sucursal: rango;
     monto: real;
  end;
  
  vector = array[rango] of real;
  
  cliente = record
    dni: integer; 
    montos: vector;
  end;

  arbol = ^nodo;
  nodo = record
    dato: cliente;
    hi: arbol;
    hd: arbol;
  end;
  
procedure inicializarVector(var v: vector);
var
  i: rango;
begin
  for i:= 1 to 5 do
	 v[i]:= 0;
end;

procedure leerVenta(var ven: venta);
begin
  ven.codigo:= random(100);
  writeln('Codigo de venta: ', ven.codigo); 
  if (ven.codigo <> 0) then begin
     ven.dni:= random(1000) + 1;
     writeln('Dni: ', ven.dni);
     ven.sucursal:= random(5) + 1;
	 writeln('Sucursal: ', ven.sucursal);
	 ven.monto:= random(20000) / (random(10)+1);
	 writeln('Monto $: ', ven.monto:5:1);  
	 writeln;
  end;
end;

procedure insertarElemento(var a: arbol; ven: venta);
begin
  if (a = nil) then begin
     new(a);
     inicializarVector(a^.dato.montos);
     a^.dato.dni:= ven.dni;
     a^.dato.montos[ven.sucursal]:= a^.dato.montos[ven.sucursal] + ven.monto;
     a^.hi := nil;
    a^.hd := nil;
  end
  else 
     if (a^.dato.dni = ven.dni) then
        a^.dato.montos[ven.sucursal]:= a^.dato.montos[ven.sucursal] + ven.monto
     else
        if (a^.dato.dni > ven.dni) then
           insertarElemento(a^.hi, ven)
        else
           insertarElemento(a^.hd, ven);
end;

procedure cargarArbol(var a: arbol);
var
  v: venta;
begin
  a:= nil;
  leerVenta(v);
  while (v.codigo <> 0) do begin
     insertarElemento  (a, v);
     leerVenta(v);
  end;
end;

procedure imprimirArbol(a: arbol);
var
  i: rango;
begin
  if (a <> nil) then begin
    imprimirArbol(a^.hi);
    writeln('--------------');
    writeln('Dni del cliente: ', a^.dato.dni);
    for i:= 1 to 5 do begin
      writeln('Sucursal: ',i);
      writeln('Monto: $ ', a^.dato.montos[i]:5:2);
      writeln();
    end;
    imprimirArbol(a^.hd);
  end;
end; 

// Inciso b)
function gastoCero(a: arbol; suc: integer): integer;
begin
  if (a = nil) then 
     gastoCero:= 0
  else
     if (a^.dato.montos[suc] = 0) then
       gastoCero:= gastoCero(a^.hi, suc) + gastoCero(a^.hd, suc) + 1
     else
       gastoCero:= gastoCero(a^.hi, suc) + gastoCero(a^.hd, suc);
end;

// Inciso c)
function calcularMonto(a: arbol; dni: integer): real;
var
  i: integer;
begin
  if (a = nil) then 
     calcularMonto:= 0
  else
     if (a^.dato.dni = dni) then
       for i:= 1 to 5 do
          calcularMonto:= calcularMonto + a^.dato.montos[i]
     else
       if (a^.dato.dni > dni) then
          calcularMonto:= calcularMonto(a^.hi, dni)
       else
          calcularMonto:= calcularMonto(a^.hd, dni);
end;

var
  a: arbol;
  sucursal, dni: integer;
begin
  randomize;
  cargarArbol(a);
  imprimirArbol(a);
  writeln;
  write('Ingrese un numero de sucursal: ');
  readln(sucursal);
  writeln('La cantidad de clientes que no gastaron nada: ', gastoCero(a, sucursal));
  writeln;
  write('Ingrese un numero de dni: ');
  readln(dni);
  writeln('Monto total gastado: $', calcularMonto(a, dni):5:2);
end.
