program playstation;
type
  sub_dia = 1..31;
  sub_mes = 1..12;
  compra = record
    videojuego: integer;
	 cliente: integer;
	 dia: sub_dia;
	 mes: sub_mes;
  end;
  
  arbol = ^nodo;
  nodo = record
	 dato: compra;
	 hi: arbol;
	 hd: arbol;
  end;
  
  vector = array [sub_mes] of integer;
  
  compra2 = record
     videojuego: integer;
     dia: integer;
     mes: integer;
  end;
  
  lista = ^nodoL;
  nodoL = record
     dato: compra2;
     sig: lista;
  end;
  
procedure leerCompra(var c : compra);
begin
  c.cliente := Random(100);
  writeln('Cliente : ', c.cliente );
  if (c.cliente <> 0) then begin
    c.dia:= Random(31) + 1;
    writeln('Dia: ', c.dia);
    c.mes:= Random(12) + 1;
    writeln('Mes: ', c.mes );
    c.videojuego:= Random(20000) + 1;
    writeln('Videojuego: ', c.videojuego);
  end;
end;

procedure inicializarVector(var v: vector);
var
  i: sub_mes;
begin
  for i:= 1 to 12 do
	 v[i]:= 0;
end;

procedure insertarAlArbol(var a: arbol; c: compra);
begin
  if (a = nil) then begin
	 new(a);
	 a^.dato:= c;
	 a^.hi:= nil;
	 a^.hd:= nil;
  end
  else
	 if (c.cliente <= a^.dato.cliente) then
	    insertarAlArbol(a^.hi, c)
	 else
		insertarAlArbol(a^.hd, c);
end;

procedure generarEstructuras(var a: arbol; var v: vector);
var
  c: compra;
begin
  a:= nil;
  inicializarVector(v);
  leerCompra(c);
  while (c.cliente <> 0) do begin
      v[c.mes]:= v[c.mes] + 1;
      insertarAlArbol(a, c);
      leerCompra(c);
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
    imprimirArbol(a^.hi);
    writeln('Codigo de videojuego : ', a^.dato.videojuego);
    writeln('Cliente: ', a^.dato.cliente);
    writeln('Dia : ', a^.dato.dia);
    writeln('Mes : ', a^.dato.mes);
    writeln('-------------------');
    imprimirArbol(a^.hd);
  end;
end;

procedure imprimirVector(v: vector);
var
  i: sub_mes;
begin
  for i:= 1 to 12 do begin
    writeln('Mes : ', i);
    writeln('Cantidad de compras realizadas: ', v[i]);
    writeln('------------------- ');
  end;
end;

// Inciso b)
procedure agregarAdelante(var l: lista; c: compra);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.videojuego:= c.videojuego;
  aux^.dato.dia:= c.dia;
  aux^.dato.mes:= c.mes;
  aux^.sig:= l;
  l:= aux;
end;

{procedure comprasClientes(a: arbol; codigo: integer; var l: lista);
begin
  l:= nil;
  if (a <> nil) then begin
     if (a^.dato.cliente = codigo) then
        agregarAdelante(l, a^.dato)
     else
        if (codigo < a^.dato.cliente) then
           comprasClientes(a^.hi, codigo, l)
        else
           comprasClientes(a^.hd, codigo, l);
  end;
end;}
procedure comprasClientes(a: arbol; codigo: integer; var l: lista);
begin
  if (a <> nil) then begin
    comprasClientes(a^.hi, codigo, l);
    if (a^.dato.cliente = codigo) then
      agregarAdelante(l, a^.dato);
    comprasClientes(a^.hd, codigo, l);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
    writeln('Videojuego: ', l^.dato.videojuego);
    writeln('Dia: ', l^.dato.dia);
    writeln('Mes: ', l^.dato.mes);
	  l:=l^.sig;
  end;
end;

// Inciso c)
procedure ordenarVector(var v: vector);
var
  i, j, pos, item: integer;
begin
  for i:= 1 to 11 do begin
	 pos:= i;
	 for j:= i + 1 to 12 do
		if (v[j] > v[pos]) then 
		   pos:= j;
	 item:= v[pos];
	 v[pos]:= v[i];
	 v[i]:= item;
  end;
end;

var
  a: arbol;
  v: vector;
  l: lista;
  codigo: integer;
begin
  generarEstructuras(a, v);
  imprimirArbol(a);
  writeln();
  write('Ingrese un codigo de cliente: ');
  readln(codigo);
  comprasClientes(a, codigo, l);
  writeln('Compras del cliente con codigo ', codigo,':');
  imprimirLista(l);
  writeln();
  imprimirVector(v);
  ordenarVector(v);
  writeln();
  writeln('Vector ordenado');
  imprimirVector(v);
end.
