program laboratorio;
type
  documento = record
     codigo: integer;
     cantPaginas: integer;
     dia: integer;
     mes: integer;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: documento;
     hi: arbol;
     hd: arbol;
  end;
  
  lista = ^nodoL;
  nodoL = record
     dato: documento;
     sig: lista;
  end;

procedure leerDocumento(var d: documento);
begin
  d.codigo:= random(10);
  writeln('Codigo del usuario: ', d.codigo);
  if (d.codigo <> 0) then begin
	 d.cantPaginas:= random(100);
	 writeln('Cantidad de paginas: ', d.cantPaginas);
	 d.dia:= random(31)+1;
	 writeln('Dia: ', d.dia);
	 d.mes:= random(12)+1;
	 writeln('Mes: ', d.mes);
	 writeln();
  end;
end;

procedure insertarElemento(var a: arbol; d: documento);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= d;
     a^.hi:= nil;
     a^.hd:= nil
  end
  else
     if (d.codigo <= a^.dato.codigo) then
        insertarElemento(a^.hi, d)
     else
        insertarElemento(a^.hd, d);
end;

procedure cargarArbol(var a: arbol);
var
  d: documento;
begin
  a:= nil;
  leerDocumento(d);
  while (d.codigo <> 0) do begin
     insertarElemento(a, d);
     leerDocumento(d);
  end;
end;

// Inciso b)
procedure agregarAdelante(var l: lista; d: documento);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := d;
  aux^.sig := L;
  L := aux;
end;

procedure buscarEntreDos(a: arbol; var l: lista; x, y: integer);
begin
  if (a <> nil) then begin
     if (a^.dato.codigo > x) then
       if (a^.dato.codigo < y) then begin
          agregarAdelante(l, a^.dato);
          buscarEntreDos(a^.hi, l, x, y);
	      buscarEntreDos(a^.hd, l, x, y);
	   end
	   else
	     buscarEntreDos(a^.hi, l, x, y)
	 else
	   buscarEntreDos(a^.hd, l, x, y);
  end;
end;

procedure imprimirLista(L: lista);
begin
  while (L <> nil) do begin
     writeln;
     writeln('Codigo: ', L^.dato.codigo, ' Paginas: ', L^.dato.cantPaginas);
     L:= L^.sig;
  end;
end;

// Inciso c)
function sumaTotal(l: lista): integer;
begin
  if (l = nil) then
     sumaTotal:= 0
  else
     sumaTotal:= l^.dato.cantPaginas + sumaTotal(l^.sig);
end;

var
  a: arbol;
  l: lista;
  num1, num2: integer;
begin
  l:= nil;
  cargarArbol(a);
  writeln;
  write('Ingrese un valor x: ');
  readln(num1);
  write('Ingrese un valor y: ');
  readln(num2);
  buscarEntreDos(a, l, num1, num2);
  imprimirLista(l);
  writeln;
  writeln('La suma total de las paginas impresas es: ', sumaTotal(l));
end.
