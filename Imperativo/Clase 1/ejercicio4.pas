program ej4;
const
  dimF = 30;
type
  rango = 1..8;
  producto = record
     codproducto: integer;
     codrubro: rango;
     precio: real;
  end;
  lista = ^nodo;
  nodo = record
     dato: producto;
     sig: lista;
  end;
  vproducto = array[rango] of lista;
  vrubro = array[1..dimF] of producto;
  
procedure leerProducto(var p: producto);
begin
  write('Ingrese el precio del producto: ');
  readln(p.precio);
  if (p.precio <> 0) then begin
     write('Código del producto: ');
     readln(p.codproducto);
     write('Código de rubro: ');
     readln(p.codrubro);
     writeln();
  end;
end;

procedure inicializarVLista(var v: vproducto);
var
  i: integer;
begin
  for i:= 1 to 8 do 
     v[i]:= nil;
end;

procedure insertarOrdenado(var L: lista; p: producto);
var
  nue, ant, act: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  ant:= L;
  act:= L;
  while (act <> nil) and (act^.dato.codproducto < p.codproducto) do begin
     ant:= act;
     act:= act^.sig;
  end;
  if (act = ant) then
     L:= nue
  else
     ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure cargarProducto(var vp: vproducto);
var
  p: producto;
begin
  leerProducto(p);
  while (p.precio <> 0) do begin
     insertarOrdenado(vp[p.codrubro], p);
     leerProducto(p);
  end;
end;

// inciso b)
procedure imprimir(v: vproducto);
var
  i: integer;
begin
  for i:= 1 to 8 do begin
     writeln('Rubro: ', i);
	 while (v[i] <> nil) do begin
        writeln('Codigo: ', v[i]^.dato.codproducto);
        writeln('Codigo de rubro: ', v[i]^.dato.codrubro);
        writeln('Precio: ', v[i]^.dato.precio:2:2);
        writeln();
        v[i]:= v[i]^.sig;
     end;
  end;
end;

// inciso c)
procedure cargarRubroTres(L: lista; var vr: vrubro; var dimL: integer);
begin
  dimL:= 0;
  while (L <> nil) and (dimL < dimF) do begin
     dimL:= dimL + 1;
     vr[dimL]:= L^.dato;
     L:= L^.sig;
  end;
end;

// inciso d)
procedure ordenPorPrecio(var vr: vrubro; diml: integer);
var
  i, j: integer;
  actual: producto;
begin
  for i:= 2 to diml do begin
     actual:= vr[i];
     j:= i-1;
     while (j > 0) and (vr[j].precio > actual.precio) do begin
        vr[j+1]:= vr[j];
        j:= j-1;
     end;
     vr[j+1]:= actual;
  end;
end;

// inciso e)
procedure mostrarPrecios(vr: vrubro; diml: integer);
var
  i: integer;
begin
  writeln();
  writeln('Precios del vector ordenado del rubro 3');
  for i:= 1 to diml do 
     writeln('Precio del producto: ', vr[i].precio:2:2);
end;

// inciso f)
function promedio(precios: vrubro; diml: integer): real;
var
  i: integer;
  total: real;
begin
  total:= 0;
  for i:= 1 to diml do
     total:= total + precios[i].precio;
  promedio:= total / diml;
end;

var
  vp: vproducto;
  vr: vrubro;
  dimL: integer;
begin
  inicializarVLista(vp);
  cargarProducto(vp);
  imprimir(vp);
  cargarRubroTres(vp[3], vr, dimL);
  ordenPorPrecio(vr, dimL);
  mostrarPrecios(vr, dimL);
  writeln('El precio promedio es: ', promedio(vr, dimL):2:2);
end.
