program actividad3;
type
  lista = ^nodo;
  nodo = record
     dato: integer;
     sig: lista;
  end;
  
procedure agregarAtras(var pri, ult: lista; num: integer);  
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= num;
  nue^.sig:= nil;
  if (pri = nil) then
     pri:= nue
  else
     ult^.sig:= nue;
  ult:= nue;
end;
  
procedure CargarLista(var l: lista);
var
  n: integer;
  ult: lista;
begin
  ult:= nil;
  randomize;
  n:= random(150 - 100 + 1) + 100;
  while (n <> 120) do begin
     agregarAtras(l, ult, n);
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
  while (l <> nil) and (not exito) do begin
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
