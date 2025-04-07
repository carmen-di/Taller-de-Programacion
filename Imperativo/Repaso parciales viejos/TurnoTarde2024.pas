program polizas;
type
  rango_anios = 2000..2023;
  
  fechas = record 
	 dia: integer;
	 mes: integer;
	 anio: rango_anios;
  end;
  
  poliza = record
     dni: integer;
     suma: real;
     valor: real;
     fecha: fechas;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: poliza;
     hi: arbol;
     hd: arbol;
  end;
  
  lista = ^nodoL;
  nodoL = record
     dato: poliza;
     sig: lista;
  end;
  
  vector = array[rango_anios] of lista;
  
procedure leerPoliza(var p: poliza);

  procedure leerFecha(var f: fechas);
  begin
    f.dia:= random(31) + 1;
	f.mes:= random(12) + 1;
	f.anio:= random(2023 - 2000 + 1) + 2000;
  end;

begin
  p.dni:= random(100) - 1;
  writeln('Dni: ', p.dni);
  if (p.dni <> -1) then begin
	  p.suma:= random(1000) + 1;
      writeln('Suma asegurada: ', p.suma);
	  p.valor:= random(5000)+1;
	  writeln('Valor de la cuota: ', p.valor);
	  leerFecha(p.fecha);
	  writeln();
  end;
end;

// Inciso b)


procedure insertarElemento(var a: arbol; p: poliza);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= p;
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else
     if (a^.dato.suma >= p.suma) then
        insertarElemento(a^.hi, p)
     else
        insertarElemento(a^.hd, p);
end;

procedure cargarArbol(var a: arbol);
var
  p: poliza;
begin
  a:= nil;
  leerPoliza(p);
  while (p.dni <> -1) do begin
     insertarElemento(a, p);
     leerPoliza(p);
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbol(a^.hi);
     writeln('--------------------');
     writeln ('Dni del cliente: ', a^.dato.dni);
     writeln('Suma asegurada: ', a^.dato.suma:5:2);
     writeln('Valor cuota: ', a^.dato.valor:5:2);
     writeln('Fecha: ', a^.dato.fecha.dia, '/', a^.dato.fecha.mes, '/', a^.dato.fecha.anio);
     writeln();
     imprimirArbol(a^.hd);
  end;
end;

// Inciso b)
// Hacer un vector de listas y un agregar atras (ya que el arbol viene ordenado por el mismo criterio) 

procedure inicializarVector(var v: vector);
var
  i: rango_anios;
begin
  for i:= 2000 to 2023 do
     v[i]:= nil;
end;

procedure agregarAtras(var l: lista; p: poliza);
var
  nue, act: lista;
begin
  new(nue); 
  nue^.dato := p; 
  nue^.sig := nil; 
  if(l = nil) then 
     l:= nue
  else begin
     act:= l;
     while (act^.sig <> nil) do
       act:= act^.sig;
     act^.sig:= nue;
  end;
end;


procedure cargarVector(a: arbol; valor: real; var v: vector);
begin
  if (a <> nil) then begin
     if (a^.dato.suma < valor) then begin
        agregarAtras(v[a^.dato.fecha.anio], a^.dato);
        cargarVector(a^.hi, valor, v);
        cargarVector(a^.hd, valor, v);
     end
     else
        cargarVector(a^.hi, valor, v);
  end;
end;

procedure imprimirVector(v: vector);
var
  i: rango_anios;
  aux: lista;
begin
  for i := 2000 to 2023 do begin
    writeln('Anio de vencimiento: ', i);
    aux := v[i];
    if (aux = nil) then
      writeln('Sin polizas')
    else
      while (aux <> nil) do begin
        writeln('  DNI: ', aux^.dato.dni, 
                ' | Suma: ', aux^.dato.suma:5:2, 
                ' | Valor cuota: ', aux^.dato.valor:5:2);
        aux := aux^.sig;
      end;
    writeln;
  end;
end;


// Inciso c)
function contarPolizasPorDNI(v: vector; dni: integer): integer;
var
  i: rango_anios;
  aux: lista;
begin
  contarPolizasPorDNI:= 0;
  for i:= 2000 to 2023 do begin
     aux:= v[i];
     while (aux <> nil) and (dni <= aux^.dato.dni) do begin
         if (aux^.dato.dni = dni) then
            contarPolizasPorDNI:= contarPolizasPorDNI + 1;
         aux:= aux^.sig;
     end;
  end;
end;    

var
  a: arbol;
  v: vector;
  dni: integer;
  valor: real;
begin
  randomize;
  cargarArbol(a);
  imprimirArbol(a);
  writeln;
  write('Ingrese un valor de suma asegurada: ');
  readln(valor);
  inicializarVector(v);
  cargarVector(a, valor, v);
  imprimirVector(v);
  writeln;
  write('Ingrese el DNI que desea buscar: ');
  readln(dni);
  writeln('El cliente con DNI ', dni, ' tiene ', contarPolizasPorDNI(v, dni), ' polizas');
end.
