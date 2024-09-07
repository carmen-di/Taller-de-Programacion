program actividad4;
type
  lista = ^nodo;
  nodo = record
     dato: integer;
     sig: lista;
  end;

procedure insertarOrdenado(var l: lista; num: integer);
var
  nue: lista;
  ant, act: lista;
begin
  new(nue);
  nue^.dato:= num;
  ant:= l;
  act:= l;
  while (act <> nil) and (num > act^.dato) do begin
     ant:= act;
     act:= act^.sig;
  end;
  if (act = ant) then
     l:= nue
  else 
     ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure CargarLista(var l: lista);
var
  n: integer;
begin
  randomize;
  n:= random(150 - 100 + 1) + 100;
  while (n <> 120) do begin
     insertarOrdenado(l, n);
     n:= random(150 - 100 + 1) + 100;
  end;
end;

procedure ImprimirLista(l: lista);
begin
   while (l <> nil) do begin
     writeln(l^.dato);
     l:= l^.sig;
   end;
end;

function BuscarElemento(l: lista; x: integer): boolean;
var
  exito: boolean;
begin
  exito:= false;
  while (l <> nil) and (l^.dato <= x) do begin
     if (l^.dato = x) then
       exito:= true;
     l:= l^.sig;
  end;
  BuscarElemento:= exito;
end;
  
var
  l: lista;
  num: integer;
begin
  l:= nil;
  CargarLista(l);
  ImprimirLista(l);
  write('Ingrese un valor a buscar: ');
  readln(num);
  if (BuscarElemento(l, num)) then
     writeln('Se encontro el valor')
  else
     writeln('No se encontro el valor');
end.
