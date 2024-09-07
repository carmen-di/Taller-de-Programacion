program ej4;
procedure convertirABinario(num: integer);
var
  aux: integer;
begin
  if (num <> 0) then begin
     aux:= num mod 2;
     convertirABinario(num div 2);
     write(aux);
  end;
end;

var
  n: integer;
begin
  write('Ingrese un número: ');
  readln(n);
  while (n <> 0) do begin
     writeln('El número ', n, ' en binario es: ' );
     convertirABinario(n);
     writeln();
     write('Ingrese un número: ');
     readln(n);
  end;
end.
