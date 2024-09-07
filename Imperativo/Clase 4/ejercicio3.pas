program ej3;
type
  producto = record
     codigo: integer;
     cantTotal: integer;
     montoTotal: real;
  end;
  
  venta = record
     codVenta: integer;
     codProducto: integer;
     cantVendidas: integer;
     precio: real;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: producto;
     hi: arbol;
     hd: arbol;
  end;
  
procedure LeerVenta(var v: venta);
begin
  v.codVenta:= random(30) - 1;
  if (v.codVenta <> -1) then begin
     v.codProducto:= random(50) + 1;
     v.cantVendidas:= random(50) + 1;
     v.precio:= random(100) * 1.5;
  end;
end;

procedure ArmarProducto(var p: producto; v: venta);
begin
  p.codigo:= v.codProducto;
  p.cantTotal:= v.cantVendidas;
  p.montoTotal:= v.cantVendidas* v.precio;
end;

procedure InsertarElemento (var a: arbol; elem: venta);
var
  p: producto;
begin
  if (a = nil) then begin
     new(a);
     ArmarProducto(p, elem);
     a^.dato:= p;
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else
     if (elem.codProducto = a^.dato.codigo) then begin
        a^.dato.cantTotal:= a^.dato.cantTotal + elem.cantVendidas;
        a^.dato.montoTotal:= a^.dato.cantTotal + (elem.cantVendidas * elem.precio);
     end
     else if (elem.codProducto < a^.dato.codigo) then 
             InsertarElemento(a^.HI, elem)
          else 
             InsertarElemento(a^.HD, elem); 
end;

procedure CargarArbol(var a: arbol);
var
  v: venta;
begin
  a:= nil;
  LeerVenta(v);
  while (v.codVenta <> -1) do begin
     InsertarElemento(a, v);
     LeerVenta(v);
  end;
end;

// Inciso b)
procedure ImprimirArbol(a: arbol);
begin
  if (a <> nil) then begin
     if (a^.hi <> nil) then
       ImprimirArbol(a^.hi);
     writeln('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantTotal, ' monto: ', a^.dato.montoTotal:2:2);
     if (a^.hd <> nil) then
       ImprimirArbol(a^.hd);
  end;
end;

// Inciso c)
procedure MaxVendidas(a: arbol; var maxCant, maxCod: integer);
begin
  if (a <> nil) then begin
     if (a^.dato.cantTotal > maxCant) then begin
       maxCant:= a^.dato.cantTotal;
       maxCod:= a^.dato.codigo;
     end;
     MaxVendidas(a^.hi, maxCant, maxCod);
     MaxVendidas(a^.hd, maxCant, maxCod);
  end;
end;

procedure CodigoMayorCantidadVendidas(a: arbol);
var
  maxCant, maxCod: integer;
begin
  maxCant:= -1;
  MaxVendidas(a, maxCant, maxCod);
  if (maxCant = -1) then 
     writeln ('Arbol sin elementos')
  else begin
     writeln;
     writeln ('Codigo de Producto con mayor cantidad de unidades vendidas: ', maxCod);
  end;
end;

// Inciso d)
function CantCodigosMenores(a: arbol; codigo: integer): integer;
begin
  if (a = nil) then
     CantCodigosMenores:= 0
  else
     if (a^.dato.codigo < codigo) then
       CantCodigosMenores:= CantCodigosMenores(a^.hi, codigo) + CantCodigosMenores(a^.hd, codigo) + 1
     else
       CantCodigosMenores:= CantCodigosMenores(a^.hi, codigo);
end;

procedure CantidadDeCodigosMenores(a: arbol);
var 
  cod, cantCodigos: integer;
begin
  writeln;
  write('Ingrese codigo de producto: ');
  readln(cod);
  cantCodigos:= CantCodigosMenores(a, cod);
  if (cantCodigos = 0) then 
     writeln('No hay codigos menores al codigo ', cod)
  else begin
     writeln('La cantidad de codigos menores a ', cod, ' es: ', cantCodigos); 
     writeln;
  end;
end;
  
// Inciso e)
function MontoEntreDos(a: arbol; codigo1, codigo2: integer): real;
begin
  if (a = nil) then
    MontoEntreDos:= 0
  else
    if (a^.dato.codigo > codigo1) then
      if (a^.dato.codigo < codigo2) then begin
         MontoEntreDos:= MontoEntreDos(a^.hi, codigo1, codigo2) + MontoEntreDos(a^.hd, codigo1, codigo2) + a^.dato.montoTotal;
      end
      else
         MontoEntreDos:= MontoEntreDos(a^.hi, codigo1, codigo2)
    else
      MontoEntreDos:= MontoEntreDos(a^.hd, codigo1, codigo2);
end;

procedure MontoTotalEntreDosCodigos(a: arbol);
var 
  codigo1, codigo2: integer;
  montoTotal: real;
begin
  write('Ingrese primer codigo de producto: ');
  readln(codigo1);
  write('Ingrese segundo codigo de producto (mayor al primer codigo): ');
  readln(codigo2);
  montoTotal:= MontoEntreDos(a, codigo1, codigo2);
  if (montoTotal = 0) then 
     writeln('No hay codigos entre ', codigo1, ' y ', codigo2)
  else begin
     writeln('El monto total entre el codigo ', codigo1, ' y el codigo ', codigo2, ' es: ', montoTotal:2:2); 
     writeln;
  end;
end;

var
  a: arbol;
begin
  CargarArbol(a);
  ImprimirArbol(a);
  CodigoMayorCantidadVendidas(a);
  CantidadDeCodigosMenores(a);
  MontoTotalEntreDosCodigos(a);
end.
