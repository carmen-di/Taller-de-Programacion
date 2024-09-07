program ej4;
type
  prestamo = record
     isbn: integer;
     nrosocio: integer;
     dia: integer;
     mes: integer;
     cantdias: integer;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: prestamo;
     hi: arbol;
     hd: arbol;
  end;
  
  lista = ^nodoL;
  nodoL = record
     dato: prestamo;
     sig: lista;
  end;
  
  prestamoL = record
     isbn: integer;
     prestamos: lista;
  end;
  
  arbolPrestamos = ^nodo2;
  nodo2 = record
     dato: prestamoL;
     hi: arbolPrestamos;
     hd: arbolPrestamos;
  end;
  
  libros = record
	 isbn: integer;
	 cant: integer;
  end;
  
  listaISBN = ^nodoL2; 
  nodoL2 = record
	 dato: libros;
	 sig: listaISBN;
  end;
  
procedure leerPrestamo(var p: prestamo);
begin
  p.isbn:= random(101) - 1;
  if (p.isbn <> -1) then begin
     p.nrosocio:= random(50) + 1;
     p.dia:= random(31) + 1;
     p.mes:= random(12) + 1;
     p.cantdias:= random(20) + 1;
  end;
end;

procedure InsertarElemento(var a: arbol; p: prestamo);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= p;
     a^.hi:= nil;
     a^.hd:= nil
  end
  else
     if (a^.dato.isbn > p.isbn) then
       InsertarElemento(a^.hi, p)
     else
       InsertarElemento(a^.hd, p);
end;

procedure AgregarLista(var l: lista; p: prestamo);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.nrosocio:= p.nrosocio;
  aux^.dato.dia:= p.dia;
  aux^.dato.mes:= p.mes;
  aux^.dato.cantdias:= p.cantdias;
  //aux^.dato := p;
  aux^.sig:= l;
  l:= aux;
end;

procedure InsertarElementoAp(var ap: arbolPrestamos; p: prestamo);
begin
  if (ap = nil) then begin
     new(ap);
     ap^.dato.isbn:= p.isbn;
     ap^.dato.prestamos:= nil;
     AgregarLista(ap^.dato.prestamos, p);
     ap^.hi:= nil;
     ap^.hd:= nil;
  end
  else
     if (ap^.dato.isbn = p.isbn) then
	    AgregarLista(ap^.dato.prestamos, p)
     else 
        if (ap^.dato.isbn > p.isbn) then
	       InsertarElementoAp(ap^.hi, p)
        else
	       InsertarElementoAp(ap^.hd, p);
end;
  
procedure CargarArbol(var a: arbol; var ap: arbolPrestamos);
var
  p: prestamo;
begin
  a:= nil;
  ap:= nil;
  leerPrestamo(p);
  while (p.isbn <> -1) do begin
     InsertarElemento(a, p);
     InsertarElementoAp(ap, p);
     leerPrestamo(p);
  end;
end;

procedure ImprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     ImprimirArbol(a^.hi);
     writeln ('ISBN del libro: ', a^.dato.isbn, ' Numero de socio: ', a^.dato.nrosocio, ' Dia: ', a^.dato.dia, ' Mes: ', a^.dato.mes, ' Cantidad de dias prestados: ', a^.dato.cantdias);
     ImprimirArbol(a^.hd);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
     writeln();
     writeln('Numero de socio: ', l^.dato.nrosocio);
     writeln('Fecha: ',l^.dato.dia, '/', l^.dato.mes);
	 writeln('Cantidad de dias prestados: ',l^.dato.cantdias);
	 l:= l^.sig;
  end;
end;

procedure ImprimirArbolPrestamos(ap: arbolPrestamos);
begin
  if (ap <> nil) then begin
     ImprimirArbolPrestamos(ap^.hi);
     writeln('------------------------------------');
	 writeln('ISBN: ', ap^.dato.isbn, ' prestamos: ');
	 imprimirLista(ap^.dato.prestamos);
     writeln();
	 ImprimirArbolPrestamos(ap^.hd);
  end;
end;

// Inciso b)
function maximo(var a: arbol):integer;
begin
  if (a^.hd = nil) then
     maximo:= a^.dato.isbn
  else
     maximo:= maximo(a^.hd);
end;

// Inciso c)
function minimo(var ap: arbolPrestamos):integer;
begin
  if (ap^.hi = nil) then
     minimo:= ap^.dato.isbn
  else
     minimo:= minimo(ap^.hi);
end;

// Inciso d)
function cantPrestamos(a: arbol; num: integer): integer;
begin
  if (a = nil) then
     cantPrestamos:= 0
  else
     if (a^.dato.nrosocio = num) then
       cantPrestamos:= cantPrestamos(a^.hi, num) + cantPrestamos(a^.hd, num) + 1
     else
       cantPrestamos:= cantPrestamos(a^.hi, num) + cantPrestamos(a^.hd, num);
end;

procedure CantidadDePrestamosSocio(a: arbol);
var
  num: integer;
begin
  write('Ingrese un numero de socio: ');
  readln(num);
  writeln('Cantidad de prestamos para el socio ', num,' es : ', cantPrestamos(a, num));
end;

// Inciso e)
function contarPrestamos(l: lista; num: integer): integer;
var
  cant: integer;
begin
  cant := 0;
  while (l <> nil) do begin
     if (l^.dato.nrosocio = num) then
        cant:= cant + 1;
     l:= l^.sig;
  end;
  contarPrestamos:= cant;
end;

function CantPrestamosSocio(ap: arbolPrestamos; num: integer): integer;
begin
  if (ap = nil) then 
    CantPrestamosSocio:= 0
  else
    CantPrestamosSocio:= contarPrestamos(ap^.dato.prestamos, num) + CantPrestamosSocio(ap^.hi, num) + CantPrestamosSocio(ap^.hd, num);
end;


procedure IncisoE(ap: arbolPrestamos);
var
  num: integer;
begin
  write('Ingrese un numero de socio: ');
  readln(num);
  writeln('Cantidad de prestamos para el socio ', num,' es : ', CantPrestamosSocio(ap, num));
end;

// Inciso f)

var
  a: arbol;
  ap: arbolPrestamos;
begin
  randomize;
  CargarArbol(a, ap);
  ImprimirArbol(a);
  writeln();
  ImprimirArbolPrestamos(ap);
  writeln('El ISBN mas grande es: ', maximo(a));
  writeln();
  writeln('El ISBN mas chico es: ', minimo(ap));
  writeln();
  CantidadDePrestamosSocio(a);
  IncisoE(ap);
end.
