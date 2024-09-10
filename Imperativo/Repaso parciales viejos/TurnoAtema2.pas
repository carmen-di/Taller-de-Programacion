program carrefour;
type
  compra = record
	 codigoCli: integer;
	 numFac: integer;
   cantProd: integer;
	 monto : real;
  end;

  compra2 = record
     numero: integer;
     cant: integer;
     monto: real;
  end;
    
  lista = ^nodoL;
  nodoL = record
     dato: compra2;
     sig: lista;
  end;
    
  cliente = record
     codigo: integer;
     lCompras: lista;
  end;
    
  arbol = ^nodo;
  nodo = record
     dato: cliente;
     hi: arbol;
     hd: arbol;
  end;
  
procedure leerCompra(var c: compra);
begin
  c.codigoCli:= random(700);
  writeln('Codigo de cliente: ', c.codigoCli); 
  if (c.codigoCli <> 0) then begin
	  c.numFac:= random(1000)+1;
	  writeln('Numero de factura: ', c.numFac);
	  c.cantProd:= random(20) + 1;
	  writeln('Cantidad de productos: ', c.cantProd); 
	  c.monto:= random(20000) / (random(10)+1);
	  writeln('Monto $: ', c.monto:5:1); 
  end;
end;

procedure agregarAdelante(var l: lista; c: compra);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.numero:= c.numFac;
  aux^.dato.cant:= c.cantProd;
  aux^.dato.monto:= c.monto;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarEnArbol(var a: arbol; c: compra);
begin
  if (a = nil) then begin
     new(a);
     a^.dato.lCompras:= nil;
     a^.dato.codigo:= c.codigoCli;
     agregarAdelante(a^.dato.lCompras, c);
     a^.hi:= nil;
     a^.hd:= nil;
   end
   else
      if (a^.dato.codigo = c.codigoCli) then
         agregarAdelante(a^.dato.lCompras, c)
      else
         if (a^.dato.codigo> c.codigoCli) then
           insertarEnArbol(a^.hi, c)
         else
           insertarEnArbol(a^.hd, c);
end;

procedure cargarArbol(var a: arbol);
var
  c: compra;
begin
  a:= nil;
  leerCompra(c);
  while (c.codigoCli <> 0) do begin
     insertarEnArbol(a, c);
     leerCompra(c);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
     writeln();
     writeln('Numero de factura: ', l^.dato.numero);
     writeln('Cantidad de productos: ', l^.dato.cant);
     writeln('Monto: ', l^.dato.monto:4:2);
	   l:= l^.sig;
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbol(a^.hi);
     writeln('------------------------------------');
	   writeln('Codigo de cliente: ', a^.dato.codigo);
	   imprimirLista(a^.dato.lCompras);
     writeln();
	   ImprimirArbol(a^.hd);
  end;
end;

// Inciso b)
procedure calcularCompras(l: lista; var cant: integer; var monto: real);
begin
  while (l <> nil) do begin
     monto:= monto + l^.dato.monto;
     cant:= cant + 1;
     l:= l^.sig;
  end;
end;

procedure buscarCliente(a: arbol; codigo: integer; var cant: integer; var cantMonto: real);
begin
  if (a <> nil) then begin
     if (a^.dato.codigo = codigo) then
        calcularCompras(a^.dato.lCompras, cant, cantMonto)
     else
        if (a^.dato.codigo > codigo) then
           buscarCliente(a^.hi, codigo, cant, cantMonto)
        else
           buscarCliente(a^.hd, codigo, cant, cantMonto);
  end;
end;

// Inciso c)
procedure buscarEntreDos(l: lista; x, y: integer);
begin
  while (l <> nil) do begin
    if (l^.dato.numero >= x) and (l^.dato.numero <= y) then begin
      writeln('Numero de factura: ', l^.dato.numero);
      writeln('Cantidad de productos: ', l^.dato.cant);
      writeln('Monto: ', l^.dato.monto:4:2);
      writeln('');
    end;
    l := l^.sig;
  end;
end;


procedure buscarFacturasEnArbol(a: arbol; x, y: integer);
begin
  if (a <> nil) then begin
    buscarEntreDos(a^.dato.lCompras, x, y);
    buscarFacturasEnArbol(a^.hi, x, y);
    buscarFacturasEnArbol(a^.hd, x, y);
  end;
end;


var
  a: arbol;
  codBuscar, cant, num1, num2: integer;
  cantMonto: real;
begin
  cargarArbol(a);
  imprimirArbol(a);
  writeln();
  write('Ingrese codigo de cliente: ');
  readln(codBuscar);
  cant:= 0;
  cantMonto:= 0;
  buscarCliente(a, codBuscar, cant, cantMonto);
  writeln('El cliente con codigo ', codBuscar, ' hizo ', cant, ' compras y gasto: ', cantMonto:0:2);
  writeln;
  write('Ingrese dos numeros de factura: ');
  readln(num1);
  readln(num2);
  writeln('Compras con numeros de factura entre ', num1, ' y ', num2, ':');
  buscarFacturasEnArbol(a, num1, num2);
end.
