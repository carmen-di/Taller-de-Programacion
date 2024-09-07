program ej3;
type
  {alumnoL = record
     legajo: integer;
     materia: integer;
     fecha: integer;
     nota: integer;
  end;}

  final = record
     codmateria: integer;
     fecha: integer;
     nota: integer;
  end;
  
  lista = ^nodo;
  nodo = record
     dato: final;
     sig: lista;
  end; 
  
  alumno = record
     legajo: integer;
     finales: lista;
  end;
  
  arbol= ^nodoA;
  nodoA = record
     dato: alumno;
	 hi: arbol; 
	 hd: arbol;
  end;

procedure leerFinal(var f: final; var legajo: integer);
begin
  writeln('Ingrese el legajo: ');
  readln(legajo);
  if (legajo <> 0) then begin
     f.codmateria:= random(101);
     f.fecha:= random(31)+1;
     f.nota:= random(9)+2;
  end;
end;

procedure agregarLista(var l: lista; f: final);
var 
  aux: lista;
begin
  new(aux);
  aux^.dato:= f;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarElemento(var a: arbol; f: final; legajo: integer);
var 
  aux: arbol;
begin
  if (a = nil) then begin
    new(aux);
    aux^.dato.legajo:= legajo;
    aux^.dato.finales:= nil;
    agregarLista(aux^.dato.finales, f);
    aux^.hi:= nil;
    aux^.hd:= nil;
    a:= aux;
  end
  else
    if (a^.dato.legajo = legajo) then
       agregarLista(a^.dato.finales, f)
    else
    begin
       if (a^.dato.legajo > legajo) then
          insertarElemento(a^.hi, f, legajo)
       else
          insertarElemento(a^.hd, f, legajo);
  end;
end;

procedure cargarArbol(var a: arbol);
var
  f: final;
  legajo: integer;
begin
  a:= nil;
  leerFinal(f, legajo);
  while (legajo <> 0) do begin
     insertarElemento(a, f, legajo);
     leerFinal(f, legajo);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil)do begin
	 writeln('Codigo de materia: ', l^.dato.codMateria);
	 writeln('Fecha: ', l^.dato.fecha);
	 writeln('Nota: ', l^.dato.nota);
	 writeln;
	 l:= l^.sig;
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil)then begin
	 imprimirArbol(a^.hi);
	 writeln('Legajo: ', a^.dato.legajo);
	 imprimirLista(a^.dato.finales);
	 imprimirArbol(a^.hd);
  end;
end;

// inciso b)
procedure cantLegajoImpar(a: arbol; var cant: integer);
begin
  if (a <> nil) then begin
     if (a^.dato.legajo mod 2 <> 0) then
       cant:= cant + 1;
     cantLegajoImpar(a^.hi, cant);
     cantLegajoImpar(a^.hd, cant);
  end;
end;

// inciso c)
function cantAprobados(l: lista): integer;
var
  cant: integer;
begin
  cant:= 0;
  while (l <> nil) do begin
     if (l^.dato.nota >= 4) then
       cant:= cant + 1;
     l:= l^.sig;
  end;
  cantAprobados:= cant;
end;

procedure cantFinalesAprobados(a: arbol);
begin
  if (a <> nil) then begin
     writeln('Legajo: ', a^.dato.legajo, ' Cantidad de finales aprobados: ', cantAprobados(a^.dato.finales));
     cantFinalesAprobados(a^.hi);
     cantFinalesAprobados(a^.hd);
  end;
end;

// inciso d)
procedure calcularPromedio(l: lista; var promedio: real);
var
  suma, cant: integer;
begin
  suma:= 0;
  cant:= 0;
  while (l <> nil) do begin
    suma:= suma + l^.dato.nota;
    cant:= cant + 1;
    l:= l^.sig;
  end;
  promedio:= suma / cant;
end;

procedure alumnosMayorPromedio(a: arbol; numero: real);
var
  promedio: real;
begin
  if (a <> nil) then begin
     calcularPromedio(a^.dato.finales, promedio);
     if (promedio > numero) then
        writeln('Legajo: ', a^.dato.legajo, ' Promedio: ', promedio:0:2);
    alumnosMayorPromedio(a^.hi, numero);
    alumnosMayorPromedio(a^.hd, numero);
  end;
end;


var
  a: arbol;
  cant: integer;
  valor: real;
begin
  randomize;
  cargarArbol(a);
  imprimirArbol(a);
  cant:= 0;
  cantLegajoImpar(a, cant);
  writeln('La cantidad de alumnos con legajo impar es: ', cant);
  writeln();
  cantFinalesAprobados(a);
  writeln();
  write('Ingrese un valor de promedio: ');
  readln(valor);
  alumnosMayorPromedio(a, valor);
end.
