program aerolineas;
type
  pasaje = record
     vuelo: integer;
     cliente: integer;
     destino: integer;
     monto: real;
  end;
  
  pasaje2 = record
	 codVuelo: integer;
	 codCliente: integer;
	 monto: real;
  end;
	
  lista = ^nodoL;
  nodoL = record
	 dato: pasaje2;
	 sig: lista;
  end;
	
  vuelo = record
	 codDestino: integer;
	 lPasaje: lista;
  end;
	
  arbol = ^nodo;
  nodo = record
	 dato: vuelo;
	 hi: arbol;
	 hd: arbol;
  end;

procedure leerPasaje(var p: pasaje);
begin 
  p.monto:= random(9999) / (random(10)+1);
  writeln('monto: $ ', p.monto:5:2);
  if (p.monto <>  0) then begin
	 p.vuelo:= random(7000);
	 writeln('Vuelo: ', p.vuelo);
	 p.cliente:= random(100)+1;
	 writeln('Cliente: ', p.cliente);
	 p.destino:= random(500)+1;
	 writeln('Destino: ', p.destino);
	 writeln('');
  end;
end;

procedure agregarAdelante(var l: lista; p: pasaje);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.codVuelo:= p.vuelo;
  aux^.dato.codCliente:= p.cliente;
  aux^.dato.monto:= p.monto;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarElemento(var a: arbol; p: pasaje);
begin
  if (a = nil) then begin
     new(a);
     a^.dato.codDestino:= p.destino;
     a^.dato.lPasaje:= nil;
     agregarAdelante(a^.dato.lPasaje, p);
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else
     if (a^.dato.codDestino = p.destino) then
        agregarAdelante(a^.dato.lPasaje, p)
     else
        if (a^.dato.codDestino > p.destino) then
           insertarElemento(a^.hi, p)
        else
           insertarElemento(a^.hd, p);
end;

procedure cargarArbol(var a: arbol);
var
  p: pasaje;
begin
  a:= nil;
  leerPasaje(p);
  while (p.monto <>  0) do begin
     insertarElemento(a, p);
     leerPasaje(p);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
     writeln();
     writeln('Codigo de vuelo: ', l^.dato.codVuelo);
     writeln('Codigo de cliente: ',l^.dato.codCliente);
	 writeln('Monto: ', l^.dato.monto:4:2);
	 l:= l^.sig;
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbol(a^.hi);
     writeln('------------------------------------');
	 writeln('Codigo ciudad destino: ', a^.dato.codDestino);
	 imprimirLista(a^.dato.lPasaje);
     writeln();
	 imprimirArbol(a^.hd);
  end;
end;

// Inciso b)
procedure buscarDestino(a: arbol; codDestino: integer; var l: lista);
begin
  if (a = nil) then
     l := nil  
  else 
     if (a^.dato.codDestino = codDestino) then
        l:= a^.dato.lPasaje
     else 
        if (codDestino < a^.dato.codDestino) then
           buscarDestino(a^.hi, codDestino, l)
        else
           buscarDestino(a^.hd, codDestino, l);
end;

// Inciso c)
function obtenerMax(l: lista): integer;
var
  cant: integer;
begin
  cant:= 0;
  while (l <> nil) do begin
     cant:= cant + 1;
     l:= l^.sig;
  end;
  obtenerMax:= cant;
end;


procedure maxVendidos(a: arbol;var  codigo: integer; var cantMax: integer);
var
  cantActual: integer;
begin 
  if (a <> nil) then begin 
	 cantActual:= obtenerMax(a^.dato.lPasaje);
     if (cantActual > cantMax) then begin
		cantMax:= cantActual;
	    codigo:= a^.dato.codDestino;
	 end;
      maxVendidos(a^.hi, codigo, cantMax);
      maxVendidos(a^.hd, codigo, cantMax);
  end;
end;

var
  a: arbol;
  l: lista;
  codigo, codeMax, cantMax: integer;
begin
  randomize;
  cargarArbol(a);
  imprimirArbol(a);
  writeln();
  write('Ingrese un codigo de ciudad destino: ');
  readln(codigo);
  buscarDestino(a, codigo, l);
  if (l <> nil) then begin
     writeln('Para el codigo de ciudad destino ', codigo,' todos los pasajes son: ');
     imprimirLista(l);
  end; 
  writeln();
  cantMax:= -1;
  maxVendidos(a, codeMax, cantMax);
  writeln('El codigo de ciudad de destino con mayor cantidad de pasajes vendidos es: ', codeMax);
end.
