program ej3;
const
  dimF = 10;
type
  rango = 1..dimF;
  producto = record
     codigo: integer;
     rubro: rango;
     stock: integer;
     precio: real;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: producto;
     hi: arbol;
     hd: arbol;
  end;

  vector = array[rango] of arbol;
  
procedure inicializarVector(var v: vector);
var
  i: integer;
begin
  for i:= 1 to dimF do
	 v[i]:= nil;
end;

procedure leerProducto(var p: producto);
begin
  p.codigo:= Random(30)-1;
  writeln('Codigo del producto: ', p.codigo);
  if (p.codigo <> -1) then begin
     p.rubro:= Random(10)+1;
     writeln('Rubro: ', p.rubro);
     p.stock:= Random(50);
     writeln('Stock: ', p.stock);
     p.precio:= Random(30);
     writeln('Precio: ', p.precio:4:2);
     writeln();
  end;
end;

procedure cargarArbol(var a: arbol; p: producto);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= p;
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else begin
     if (p.codigo < a^.dato.codigo) then
        cargarArbol(a^.hi, p)
     else
        cargarArbol(a^.hd, p);
  end;
end;

procedure cargarVector(var v: vector);
var
  p: producto;
begin
  inicializarVector(v);
  leerProducto(p);
  while (p.codigo <> -1) do begin
     cargarArbol(v[p.rubro], p);
     leerProducto(p);
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbol(a^.hi);
	 writeln('Codigo: ', a^.dato.codigo);
	 writeln('Rubro: ', a^.dato.rubro);
	 writeln('Stock: ', a^.dato.stock);
	 writeln('Precio Unitario: ', a^.dato.precio:4:2);
	 writeln('----------------------');
	 imprimirArbol(a^.hd);
  end;
end;

procedure imprimirVector(v: vector);
var
  i: rango;
begin
  for i:=1 to 10 do 
     imprimirArbol(v[i]);
end;

// Inciso b)
function existeProducto(a: arbol; cod: integer): boolean;
begin
  if (a = nil) then
     existeProducto:= false
  else
     if (a^.dato.codigo = cod) then
        existeProducto:= true
     else
        if (cod < a^.dato.codigo) then
           existeProducto:= existeProducto(a^.hi, cod)
        else
           existeProducto:= existeProducto(a^.hd, cod);
end;

procedure buscarCodigo(v: vector);
var
  rubro, cod: integer;
begin
  writeln('Ingrese un rubro y un codigo a buscar: ');
  readln(rubro);
  readln(cod);
  if (existeProducto(v[rubro], cod)) then
     writeln('Existe el producto con el rubro ', rubro, ' y codigo ', cod)
  else
	 writeln('No se encontro');
end;

// Inciso c)
procedure maximo(a: arbol; var maxcod, maxstock: integer);
begin
  if (a^.hd = nil) then begin
     maxcod:= a^.dato.codigo;
	 maxstock:= a^.dato.stock;
  end
  else
	 maximo(a^.hd, maxcod, maxstock);
end;

procedure codigosMaximos(v: vector);
var
  i: rango;
  codMax, stockMax: integer;
begin
  codMax:= -1;
  stockMax:= -1;
  for i:=1 to 10 do begin
      if (v[i] = nil) then
		 writeln('Arbol vacio ')
	  else begin
	     maximo(v[i], codMax, stockMax);
	     writeln('Rubro: ', i, ' Stock Maximo: ',stockMax, ' Codigo Maximo: ',codMax);
	  end;
  end;
end;

// Inciso d)
procedure cantProductos(a: arbol; num1, num2: integer; var cant: integer);
begin
  if (a <> nil) then begin
     if (a^.dato.codigo > num1) and (a^.dato.codigo < num2) then begin
        cant:= cant + 1;
        cantProductos(a^.hi, num1, num2, cant);
		cantProductos(a^.hd, num1, num2, cant);
	 end
	 else
	    if (a^.dato.codigo < num1) then
		   cantProductos(a^.hd, num1, num2, cant)
		else
		   if (a^.dato.codigo > num2) then
			  cantProductos(a^.hi, num1, num2, cant);
  end;
end;

procedure entreDos(v: vector);
var
  i: rango;
  cod1, cod2, total: integer;
begin
  writeln('Ingrese dos codigos: ');
  readln(cod1);
  readln(cod2);
  for i:= 1 to 10 do begin
	 total:=0;
	  if (v[i] = nil) then begin
	     writeln('Arbol vacio ');
	  end
	  else begin
		 cantProductos(v[i], cod1, cod2, total);
		 writeln('Rubro: ', i, ' Cantidad de productos entre los numeros ', cod1, ' y ', cod2,' es : ', total);

	  end;
  end;
end;

var
  v: vector;
begin
  randomize;
  cargarVector(v);
  imprimirVector(v);
  writeln();
  buscarCodigo(v);
  writeln();
  codigosMaximos(v);
  writeln();
  entreDos(v);
end.
