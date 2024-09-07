program ej1;
const
  dimF = 300;
type
  oficina = record
     codigo: integer;
     dni: integer;
     valorexp: real;
  end;
  vector = array[1..dimF] of oficina;

procedure leerOficina(var o: oficina);
begin
  write('Ingrese el codigo de indentificacion: ');
  readln(o.codigo);
  if (o.codigo <> -1) then begin
     write('DNI del propietario: ');
     readln(o.dni);
     write('Valor de la expensa: ');
     readln(o.valorexp);
     writeln();
  end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
  o: oficina;
begin
  leerOficina(o);
  while (o.codigo <> -1) and (dimL < dimF) do begin
     dimL:= dimL + 1;
     v[dimL]:= o;
     leerOficina(o);
  end;
end;

procedure ordenarVector(var v: vector; diml: integer);
var
  i, j: integer;
  actual: oficina;
begin
  for i:= 2 to diml do begin
     actual:= v[i];
     j:= i-1;
     while ((j > 0) and (v[j].codigo > actual.codigo)) do begin
       v[j+1]:= v[j];
       j:= j-1;
     end;
     v[j+1]:= actual;
  end;
end;

procedure imprimirVector(v: vector; diml: integer);
var
  i: integer;
begin
  for i:= 1 to diml do begin
     writeln('Codigo: ', v[i].codigo, '   ', 'DNI Propietario: ', v[i].dni, '   ', 'Valor de la expensa $', v[i].valorexp:5:2);
  end;
end;

procedure busquedaDicotomica(var v: vector; primero, ultimo: integer; dato: integer; var pos: integer);
var
  medio: integer;
begin
  if (primero > ultimo) then
     pos:= -1
  else begin
     medio:= (primero + ultimo)  div 2;
     if (dato = v[medio].codigo)then
       pos:= medio
     else
       if(dato < v[medio].codigo)then
         busquedaDicotomica(v, primero, medio-1, dato, pos)
       else
         busquedaDicotomica(v, medio+1, ultimo, dato, pos);
    end;
end;

function montoTotal(v: vector; dimL: integer): real;
begin
  if (dimL = 0) then
     montoTotal:= 0
  else
     montoTotal:= montoTotal(v, dimL - 1) + v[dimL].valorexp;
end;

var
  v: vector;
  dimL, dato, pos: integer;
  ini, fin: integer;
begin
  dimL:= 0;
  ini:= 1;
  fin:= dimL;
  cargarVector(v, dimL);
  ordenarVector(v, dimL);
  imprimirVector(v, dimL);
  writeln();
  write('Ingrese codigo a buscar: ');
  readln(dato);
  busquedaDicotomica(v, ini, fin, dato, pos);
  if (pos <> -1) then
	 writeln('DNI del Propietario: ', v[pos].dni)
  else
	 writeln('El codigo no existe');
  writeln();
  writeln('El monto total de las expensas es: ', montoTotal(v, dimL):5:2);
end.
