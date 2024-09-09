program atenciones;
type
  sub_mes = 0..12;
  sub_diagnostico = 1..15;
  atencion = record
     dni: integer;
     mes: sub_mes;
     diagnostico: sub_diagnostico;
  end;
  
  infoAtencion = record
	 dni: integer;
	 cantAtenciones: integer;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: infoAtencion;
     hi: arbol;
     hd: arbol;
  end;
  
  vector = array[sub_diagnostico] of integer;

procedure leerAtencion(var a: atencion);
begin
  a.mes:= random(13);
  writeln('Mes : ', a.mes);
  if (a.mes <> 0) then begin
    a.dni:= random(100) + 1;
    writeln('DNI : ', a.dni);
    a.diagnostico:= random(15) + 1;
    writeln('Diagnostico : ', a.diagnostico);
    writeln();
  end;
end;
	
procedure inicializarVector(var v: vector);
var
  i: sub_diagnostico;
begin
  for i:= 1 to 15 do
	  v[i]:= 0;
end;

procedure insertarElemento(var a: arbol; ate: atencion);
begin
  if (a = nil) then begin
     new(a);
     a^.dato.dni:= ate.dni;
     a^.dato.cantAtenciones:= 1;
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else
     if (a^.dato.dni = ate.dni) then
        a^.dato.cantAtenciones:= a^.dato.cantAtenciones + 1
     else
        if (a^.dato.dni > ate.dni) then
          insertarElemento(a^.hi, ate)
        else
          insertarElemento(a^.hd, ate)
end;

procedure cargarEstructuras(var a: arbol; var v: vector);
var
  ate: atencion;
begin
  a:= nil;
  leerAtencion(ate);
  inicializarVector(v);
  while (ate.mes <> 0) do begin
      v[ate.diagnostico]:= v[ate.diagnostico] + 1;
	    insertarElemento(a, ate);
	    leerAtencion(ate);
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
    imprimirArbol(a^.hi);
    writeln('Dni : ', a^.dato.dni);
    writeln('Total de atenciones: ', a^.dato.cantAtenciones);
    writeln('-------------------');
    imprimirArbol(a^.hd);
  end;
end;

procedure imprimirVector(v: vector);
var
  i: sub_diagnostico;
begin
  for i:= 1 to 10 do begin
    writeln('Codigo de diagnostico : ', i);
    writeln('Cantidad de atenciones: ', v[i]);
    writeln('------------------- ');
  end;
end;

// Inciso b)
procedure entreDosValores(a: arbol; num1, num2, valor: integer; var cant: integer);
begin
  if (a <> nil) then begin
     if (a^.dato.dni > num1) then begin
        if (a^.dato.dni < num2) then begin
           if (a^.dato.cantAtenciones > valor) then
              cant := cant + 1; 
           // Continuamos buscando en ambos subárboles, ya que los DNI aún pueden estar en el rango
           entreDosValores(a^.hi, num1, num2, valor, cant);
           entreDosValores(a^.hd, num1, num2, valor, cant);
        end
        else
           // Si el DNI es mayor o igual a num2, solo recorremos el subárbol izquierdo (ya que todos en el subárbol derecho serán mayores)
           entreDosValores(a^.hi, num1, num2, valor, cant);
     end
     else
        // Si el DNI es menor o igual a num1, solo recorremos el subárbol derecho (ya que todos en el subárbol izquierdo serán menores)
        entreDosValores(a^.hd, num1, num2, valor, cant);
  end;
end;

// Inciso c)
function atencionesCero(v: vector; cant, dim: integer): integer;
begin
  if (dim = 0) then
     atencionesCero:= cant
  else
     begin
        if (v[dim] = 0) then
           cant:= cant + 1;
        atencionesCero:= atencionesCero(v, cant, dim-1);
     end;
end;

var
  a: arbol;
  v: vector;
  num1, num2, x, cant, dim: integer;
begin
  randomize;
  cargarEstructuras(a, v);
  imprimirArbol(a);
  writeln();
  writeln('Ingrese dos numeros de DNI');
  readln(num1);
  readln(num2);
  writeln('Ingrese un valor entero X');
  readln(x);
  cant:= 0;
  entreDosValores(a, num1, num2, x, cant);
  writeln('La cantidad de pacientes con mas de ', x, ' consultas cuyo DNI esta entre ', num1, ' y ', num2, ' es: ', cant);
  writeln();
  imprimirVector(v);
  cant:= 0;
  dim:= 15;
  writeln('La cantidad de diagnosticos para los cuales la cantidad de atenciones fue cero es: ', atencionesCero(v, cant, dim));
end.
