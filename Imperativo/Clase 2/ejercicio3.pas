program ej3;
const
  dimF = 20;
type
  vector = array[1..dimF] of integer;
  
procedure cargarVector(var v: vector; dimL: integer);
var 
  num: integer;
begin
  num:= 300 + random(1550 - 300 + 1); 
  if (dimL <= dimF) then begin
     v[dimL] := num;
     dimL:= dimL + 1;
	 cargarVector(v, dimL);
  end;
end;

procedure imprimirVector(v: vector);
var
  i: integer;
begin
  for i:= 1 to dimF do 
     writeln('Elemento ',i,': ',v[i]);
end;

// inciso b)
procedure ordenarVector(var v: vector);
var
  i, j, actual: integer;
begin
  for i:= 2 to dimF do begin
     actual:= v[i];
     j:= i - 1;
     while (j > 0) and (v[j] > actual) do begin
        v[j+1]:= v[j];
        j:= j - 1;
     end;
     v[j+1]:= actual;
  end;
end; 

// inciso c)
procedure busquedaDicotomica(v: vector; ini, fin: integer; dato: integer; var pos: integer);
var
  medio: integer;
begin
  if (ini > fin) then      // El vector no tiene elementos
     pos:= -1              // finalizo la busqueda
  else begin
     medio:= (ini + fin) div 2;         // Determino el punto medio
     if (dato = v[medio]) then          // Comparo el dato con el punto medio
       pos:= medio                      // Si coincide lo encontre
     else begin
       if (dato < v[medio]) then
         busquedaDicotomica(v, ini, (medio - 1), dato, pos)
       else
         busquedaDicotomica(v, ini, (medio + 1), dato, pos);
      end;
  end;
end;

function encontro(pos: integer): boolean;
begin
  if (pos = -1) then   
     encontro := false
  else
     encontro := true;
end;

var
  v: vector;
  diml, ini, fin, dato, pos: integer;
begin
  randomize;
  diml:= 0;
  cargarVector(v, diml);
  imprimirVector(v);
  writeln();
  ordenarVector(v);
  imprimirVector(v);
  writeln();
  ini:= 1;
  fin:= 20;
  write('Ingrese el dato a buscar: ');
  readln(dato);
  busquedaDicotomica(v, ini, fin, dato, pos);
  if (encontro(pos)) then 
     writeln('La posicion del dato buscado: ', pos)
  else
     writeln('No se encontro el dato buscado');
end.
