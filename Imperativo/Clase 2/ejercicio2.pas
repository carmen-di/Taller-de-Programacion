program ej2;
type
  lista = ^nodo;
  nodo = record
     dato: integer;
     sig: lista;
  end;

procedure cargarLista(var L: lista);
var
  nue: lista;
  num: integer;
begin
  num:= 100 + random(101);
  if (num <> 100) then begin
     cargarLista(L);
     new(nue);
     nue^.dato:= num;
     nue^.sig:= L;
     L:= nue;
  end
  else
     L:= nil
end;

// inciso b)
procedure imprimirOrden(pun: lista);
begin
  if (pun <> nil) then begin
    writeln(pun^.dato);
    imprimirOrden(pun^.sig);
  end;
end;

// inciso c)
procedure imprimirOrdenInverso(l: lista);
begin
  if (l <> nil) then begin
    imprimirOrdenInverso(l^.sig);
    writeln(l^.dato);
  end;
end;

// inciso d)
procedure minimo(pri: lista; var min: integer);
begin
  if (pri <> nil) then begin
     if (pri^.dato < min) then
        min:= pri^.dato;
     minimo(pri^.sig, min);
  end;
end;

// inciso e)
function buscar(pri: lista; n: integer): boolean;
begin
  if (pri = nil) then
     buscar:= false
  else
     if (pri^.dato = n) then
        buscar:= true
     else
        buscar:= buscar(pri^.sig, n);
end;

var
  l: lista;
  num, min: integer;
begin
  l:= nil;
  min:= 9999;
  randomize;
  cargarLista(l);
  imprimirOrden(l);
  writeln();
  imprimirOrdenInverso(l);
  minimo(l, min);
  writeln();
  writeln('El valor mínimo de la lista es: ', min);
  writeln();
  write('Ingrese un número para buscar en la lista: ');
  readln(num);
  if (buscar(l, num)) then
	writeln('Se encontró el elemento en la lista')
  else
    writeln('No se encontró el elemento buscado');
end.
