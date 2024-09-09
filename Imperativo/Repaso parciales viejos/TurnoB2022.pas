{ Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. De cada compra se conoce código del 
cliente, día, cantidad de productos y monto pagado.
a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, donde para cada código de cliente 
se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. 
Se sugiere utilizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente.
c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos. 

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}

program tema1;
type
  dias = 1..31;
  compra = record
     codCliente:integer;
     dia: dias;
     cantProductos: integer;
     monto: real;
  end;
  
  comprasTotal = record
     dia: dias;
     cantProd: integer;
     monto: real;
  end;
  
  lista = ^nodoL;
  nodoL = record
     dato: comprasTotal;
     sig: lista;
  end;
  
  info = record
     codCliente:integer;
     compras: lista;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: info;
     hi: arbol;
     hd: arbol;
  end;

procedure leerCompra(var c: compra);
begin
  c.cantProductos:= random(15);
  writeln('Cantidad de productos: ', c.cantProductos);
  if (c.cantProductos <> 0) then begin
     c.codCliente:= random(99) + 1;
     writeln('Codigo de cliente: ', c.codCliente);
	 c.dia:= 1 + random(31);
	 writeln('Dia: ', c.dia);
	 c.monto:= random(500);
     writeln('Monto: ', c.monto:4:2);
	 writeln();
  end;
end;

procedure agregarAdelante(var l: lista; c: compra);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.dia:= c.dia;
  aux^.dato.cantProd:= c.cantProductos;
  aux^.dato.monto:= c.monto;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarEnArbol(var a: arbol; c: compra);
begin
  if (a = nil) then begin
     new(a);
     a^.dato.compras:= nil;
     a^.dato.codCliente:= c.codCliente;
     agregarAdelante(a^.dato.compras, c);
     a^.hi:= nil;
     a^.hd:= nil;
   end
   else
      if (a^.dato.codCliente = c.codCliente) then
         agregarAdelante(a^.dato.compras, c)
      else
         if (a^.dato.codCliente > c.codCliente) then
           insertarEnArbol(a^.hi, c)
         else
           insertarEnArbol(a^.hd, c);
end;

procedure cargarArbol(var a: arbol);
var
  c: compra;
begin
  a:= nil;
  leerCompra(c);
  while (c.cantProductos <> 0) do begin
     insertarEnArbol(a, c);
     leerCompra(c);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
     writeln('Cantidad de productos: ', l^.dato.cantProd);
     writeln('Dia: ', l^.dato.dia);
     writeln('Monto: ', l^.dato.monto:4:2);
	 l:= l^.sig;
  end;
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbol(a^.hi);
     writeln('------------------------------------');
	 writeln('Codigo de cliente: ', a^.dato.codCliente);
	 imprimirLista(a^.dato.compras);
     writeln();
	 ImprimirArbol(a^.hd);
  end;
end;

// Inciso b)
function buscarCompra(a: arbol; codigo: integer): lista;
begin
  if (a = nil) then
     buscarCompra:= nil
  else
     if (a^.dato.codCliente = codigo) then
        buscarCompra:= a^.dato.compras
      else 
        if (codigo < a^.dato.codCliente ) then 
           buscarCompra:= buscarCompra(a^.hi, codigo)
        else 
           buscarCompra:= buscarCompra(a^.hd, codigo);
end;

// inciso c)
procedure ObtenerMontoMayor(l:lista; var maxProd: integer; var monto: real);
begin
  if (l = nil) then 
     maxProd:= -1
  else begin
     ObtenerMontoMayor(l^.sig, maxProd, monto);
     if (l^.dato.cantProd > maxProd) then begin
        maxProd:= l^.dato.cantProd;
        monto:= l^.dato.monto;
     end;
  end;
end;

var
  a: arbol;
  codBuscar, maxProd: integer;
  listaCompras: lista;
  monto: real;
begin
  cargarArbol(a);
  imprimirArbol(a);
  write('Ingrese codigo a buscar: ');
  readln(codBuscar);
  writeln;
  listaCompras:= buscarCompra(a, codBuscar);
  writeln; 
  ObtenerMontoMayor(listaCompras, maxProd, monto);
  writeln ('El cliente con codigo ', codBuscar, ' gasto $ ', monto:2:2, ' en la compra de mayor cantidad de productos');
end.
