program ej4;
type
  reclamo = record
     codigo: integer;
     dni: integer;
     anio: integer;
     tipo: integer;
  end;
  
  infoReclamo = record
	 codigo: integer;
	 anio: integer;
	 tipoReclamo:integer;
  end;
    
  lista = ^nodo;
  nodo = record
	 dato: infoReclamo;
     sig: lista;
  end;
  
  dniReclamo = record
     dni: integer;
     reclamo: lista;
     cantReclamos: integer;
  end;
  
  arbol = ^nodoA;
  nodoA = record
     dato: dniReclamo;
     hi: arbol;
     hd: arbol;
  end;
  
procedure leerReclamo(var r: reclamo);
begin
  r.codigo:= random(30);
  writeln('Codigo: ', r.codigo);
  if (r.codigo <> 0) then begin
	 r.dni:= random(40) + 1;
     writeln('DNI: ', r.dni);
	 r.anio:= random(24) + 2000;
	 writeln('Anio: ', r.anio);
	 r.tipo:= random(5)+1;
	 writeln('Reclamo: ', r.tipo);
	 writeln();
  end;
end;

procedure agregarAdelante(var l: lista; r: reclamo);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.codigo:= r.codigo;
  aux^.dato.anio:= r.anio;
  aux^.dato.tipoReclamo:= r.tipo;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarElemento(var a: arbol; r: reclamo);
begin
  if (a = nil) then begin
     new(a);
     a^.dato.reclamo:= nil;
     a^.dato.dni:= r.dni;
     a^.dato.cantReclamos:= 1; // incializo la cantidad
     agregarAdelante(a^.dato.reclamo, r);
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else begin
     if (a^.dato.dni = r.dni) then begin
         agregarAdelante(a^.dato.reclamo, r);
         a^.dato.cantReclamos:= a^.dato.cantReclamos + 1;
     end
     else
         if (a^.dato.dni > r.dni) then
             insertarElemento(a^.hi, r)
         else
             insertarElemento(a^.hd, r);
  end;
end;

procedure cargarArbol(var a: arbol);
var
  r: reclamo;
begin
  leerReclamo(r);
  while (r.codigo <> 0) do begin
      insertarElemento(a, r);
      leerReclamo(r);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
     writeln();
     writeln('Codigo: ', l^.dato.codigo);
     writeln('Anio: ',l^.dato.anio);
	 writeln('Tipo de reclamo: ', l^.dato.tipoReclamo);
	 l:= l^.sig;
  end;
end;

procedure ImprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     ImprimirArbol(a^.hi);
     writeln('------------------------------------');
	 writeln('Dni: ', a^.dato.dni);
	 writeln('Cantidad de reclamos: ', a^.dato.cantReclamos);
	 imprimirLista(a^.dato.reclamo);
     writeln();
	 ImprimirArbol(a^.hd);
  end;
end;

// Inciso b)
function cantReclamosDni(a: arbol; dni: integer): integer;
begin
  if (a = nil) then
     cantReclamosDni:= 0
  else
     if (a^.dato.dni = dni) then 
       cantReclamosDni:= a^.dato.cantReclamos
     else
       if (a^.dato.dni > dni) then
         cantReclamosDni:= cantReclamosDni(a^.hi, dni)
       else
         cantReclamosDni:= cantReclamosDni(a^.hd, dni);
end;

procedure buscarDni(a: arbol);
var
  dni: integer;
begin
  write('Ingrese un dni: ');
  readln(dni);
  cantReclamosDni(a, dni);
  writeln('La cantidad de reclamos para el dni ', dni, ' es: ', cantReclamosDni(a, dni));
end;

// Inciso c)
procedure cantReclamos(a: arbol; dni1, dni2: integer; var cant: integer);
begin
  if (a <> nil) then begin
     if (a^.dato.dni >= dni1) and (a^.dato.dni <= dni2) then begin
        cant:= a^.dato.cantReclamos + cant;
        cantReclamos(a^.hi, dni1, dni2, cant);
        cantReclamos(a^.hd, dni1, dni2, cant);
     end
     else
	    if (a^.dato.dni > dni1) then
		   cantReclamos(a^.hi, dni1, dni2, cant)
		else
		   if (a^.dato.dni < dni2) then
			  cantReclamos(a^.hd, dni1, dni2, cant);
  end;
end;

procedure entreDosDni(a: arbol);
var 
  dni1, dni2, cant: integer;
begin
  cant:= 0;
  writeln('Ingrese dos dni: ');
  readln(dni1);
  readln(dni2);
  cantReclamos(a, dni1, dni2, cant);
  writeln('La cantidad de reclamos entre los dos dni es: ', cant);
end;

// Inciso d)

var
  a: arbol;
begin
  randomize;
  cargarArbol(a);
  ImprimirArbol(a);
  writeln();
  buscarDni(a);
  writeln();
  entreDosDni(a);
end.
