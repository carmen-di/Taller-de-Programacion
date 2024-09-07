program ej2;
const
  dimF = 300;
type
  rango = 1..dimF;
  oficina = record
     codigo: integer;
     dni: integer;
     valor: real;
  end;
  vector = array[rango] of oficina;

procedure leerOficina(var o: oficina);
begin
  write('Ingrese el código de identificación: ');
  readln(o.codigo);
  if (o.codigo <> -1) then begin
     write('DNI del propietario: ');
     readln(o.dni);
     write('Valor de la expensa: ');
     readln(o.valor);
     writeln();
  end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
  o: oficina;
begin
  dimL:= 0;
  leerOficina(o);
  while (o.codigo <> -1) and (dimL < dimF) do begin
     dimL:= dimL + 1;
     v[dimL]:= o;
     leerOficina(o);
  end;
end;
  
procedure ordenarInsercion(var v: vector; dimL: integer);
var
  i, j: integer;
  actual: oficina;
begin
  for i:= 2 to dimL do begin
     actual:= v[i];
     j:= i - 1;
     while (j > 0) and (v[j].codigo > actual.codigo) do begin
        v[j+1]:= v[j];
        j:= j - 1;
     end;
     v[j+1]:= actual
  end;
end;

procedure ordenarSeleccion(var v: vector; dimL: integer);
var
  i, j, p: integer;
  item: oficina;
begin
  for i:= 1 to dimL - 1 do begin
     p:= i;
     for j:= i+1 to dimL do
       if (v[j].codigo < v[p].codigo) then
         p:= j;
     item:= v[p];
     v[p]:= v[i];
     v[i]:= item;
  end;
end;


procedure imprimirVector(v: vector; dimL: integer);
var
  i: integer;
begin
  writeln();
  for i:= 1 to dimL do begin
     writeln('Codigo: ', v[i].codigo, '   ', 'DNI Propietario: ', v[i].dni, '   ', 'Valor de la expensa: ', v[i].valor:5:2);
  end;
end;

var
  v: vector;
  dimL: integer;
begin
  cargarVector(v, dimL);
  ordenarInsercion(v, dimL);
  ordenarSeleccion(v, dimL);
  imprimirVector(v, dimL);
end.
