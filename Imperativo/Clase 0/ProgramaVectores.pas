program ProgramaVectores;
const
  max = 50;
type
  vector = array[1..max] of integer;

procedure CargarVector(var v: vector; var dimL: integer; maxi, min: integer);
var
  num: integer;
begin
  dimL:= 0;
  num:= random(maxi - min + 1) + min;
  while (dimL < max) and (num <> 0) do begin
     dimL:= dimL + 1;
     v[dimL]:= num;
     num:= random(maxi - min + 1) + min;
  end;
end;

procedure ImprimirVector(v: vector; dimL: integer);
var
  i: integer;
begin
  for i:= 1 to dimL do
     writeln('Posicion ', i,': ', v[i]);
  for i:= dimL downto 1 do
     writeln('Posicion ', i,': ', v[i]);
end;

var
  vec: vector;
  diml, min, maxi: integer;
begin
  randomize;
  write('Ingrese el minimo: ');
  readln(min);
  write('Ingrese el maximo: ');
  readln(maxi);
  CargarVector(vec, diml, maxi, min);
  ImprimirVector(vec, diml);
end.
