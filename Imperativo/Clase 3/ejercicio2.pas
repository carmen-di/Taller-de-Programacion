program ej2;
const
  maxAnio = 2024;
  minAnio = 2022;
type
  dias = 1..31;
  meses = 1..12;
     
  fechas = record
	 dia: dias;
 	 mes: meses;
	 anio: integer;
  end;
	
  venta = record
     codProducto: integer;
     fecha: fechas;
     cantVendida: integer;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: venta;
     hi: arbol;
     hd: arbol;
  end;
  
  producto = record
     codProducto: integer;
     cantTotal: integer;
  end;
  
  arbol2 = ^nodo2;
  nodo2 = record
     dato: producto;
     hi: arbol2;
     hd: arbol2;
  end;
  
  ventaL = record
	 fecha: fechas;
     cantUnidades: integer;
  end;
  
  lista = ^nodo4;
  nodo4 = record
     dato: ventaL;
     sig: lista;
  end;
  
  ventaProd = record
     codProducto: integer;
     lventas: lista;
  end;
  
  arbol3 = ^nodo3;
  nodo3 = record
     dato: ventaProd;
     hi: arbol3;
     hd: arbol3;
  end;
  
  
procedure leerVenta(var v: venta);
  procedure leerFecha(var f: fechas);
  begin
    f.dia:= random(31) + 1;
	f.mes:= random(12) + 1;
	f.anio:= random(maxAnio - minAnio + 1) + minAnio;
  end;
begin
  v.codProducto:= random(101)*10;
  leerFecha(v.fecha);
  v.cantVendida:= random(100) + 1;
end;

procedure insertarElementoA1(var a: arbol; v: venta);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= v;
     a^.hi:= nil;
     a^.hd:= nil;
   end
   else 
      if (v.codProducto <= a^.dato.codProducto) then 
         insertarElementoA1(a^.hi, v)
      else
         insertarElementoA1(a^.hd, v);
end;

procedure insertarElementoA2(var a2: arbol2; prod: producto);
begin
  if (a2 = nil) then begin
     new(a2);
     a2^.dato:= prod;
     a2^.hi:= nil;
     a2^.hd:= nil;
   end
   else 
      if (prod.codProducto  = a2^.dato.codProducto) then // Si el producto ya existe (codProducto es igual al código en el nodo)
         a2^.dato.cantTotal:= a2^.dato.cantTotal + prod.cantTotal  // Sumamos la cantidad vendida al total existente
         
      else if (prod.codProducto  <= a2^.dato.codProducto) then 
			insertarElementoA2(a2^.hi, prod)
	  else
            insertarElementoA2(a2^.hd, prod);
end; 

procedure agregarAdelante(var l: lista; v: venta);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.fecha:= v.fecha;
  aux^.dato.cantUnidades:= v.cantVendida;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarElementoA3(var a3: arbol3; v: venta);
begin
  if (a3 = nil) then begin
     new(a3);
     a3^.dato.codProducto:= v.codProducto;
     a3^.dato.lventas:= nil;
     agregarAdelante(a3^.dato.lventas, v);
     a3^.hi:= nil;
     a3^.hd:= nil;
   end
   else 
     if (v.codProducto  < a3^.dato.codProducto) then 
			insertarElementoA3(a3^.hi, v)
	  else
	      if (v.codProducto  > a3^.dato.codProducto) then
             insertarElementoA3(a3^.hd, v)
           else
             agregarAdelante(a3^.dato.lventas, v);
end;

procedure generarArbol(var a: arbol; var a2: arbol2; var a3: arbol3);
var
  v: venta;
  prod: producto;
begin
  a:= nil;
  a2:= nil;
  leerVenta(v);
  while (v.codProducto <> 0) do begin
     insertarElementoA1(a, v);
     prod.codProducto := v.codProducto;
     prod.cantTotal := v.cantVendida;
     insertarElementoA2(a2, prod);
     insertarElementoA3(a3, v);
     leerVenta(v);
  end;
end;

procedure imprimirArbolVenta(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbolVenta(a^.hi);
     writeln ('Codigo del producto: ', a^.dato.codProducto, ' Fecha: ', a^.dato.fecha.dia, '/', a^.dato.fecha.mes, '/', a^.dato.fecha.anio, ' Cantidad de unidades vendida: ', a^.dato.cantVendida);
     imprimirArbolVenta(a^.hd);
  end;
end;

procedure imprimirArbolProductos(a2: arbol2);
begin
  if (a2 <> nil) then begin
     imprimirArbolProductos(a2^.hi);
     writeln ('Codigo del producto: ', a2^.dato.codProducto, ' Cantidad de total de unidades vendida: ', a2^.dato.cantTotal);
     imprimirArbolProductos(a2^.hd);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
	 writeln('Fecha: ',l^.dato.fecha.dia, '/', l^.dato.fecha.mes, '/', l^.dato.fecha.anio);
	 writeln('Unidades vendidas: ',l^.dato.cantUnidades);
	 l:= l^.sig;
  end;
end;

procedure imprimirArboldeListas(a: arbol3);
begin
  if (a <> nil) then begin
	 imprimirArboldeListas(a^.hi);
	 writeln('Codigo: ', a^.dato.codProducto);
	 imprimirLista(a^.dato.lventas);
     writeln();
	 imprimirArboldeListas(a^.hd);
  end;
end;

// inciso b)
function cantProdVendidosFecha(a: arbol; f: fechas): integer;
begin
  if (a = nil) then begin
     cantProdVendidosFecha:= 0
  end
  else begin
     cantProdVendidosFecha:= cantProdVendidosFecha(a^.hi, f) + cantProdVendidosFecha(a^.hd, f);
     if (a^.dato.fecha.dia = f.dia) and (a^.dato.fecha.mes = f.mes) and (a^.dato.fecha.anio = f.anio) then
        cantProdVendidosFecha:= cantProdVendidosFecha + a^.dato.cantVendida;
  end;
end;

procedure cargarFecha(var f: fechas);
begin
  write('Ingrese el dia: '); readln(f.dia);
  write('Ingrese el mes: '); readln(f.mes);
  write('Ingrese el anio: '); readln(f.anio);
end;

// inciso c)
procedure actualizarMaximo(cantv, cod: integer; var max, codeMax: integer );
begin
  if (cantv > max) then begin
     max:= cantv;
     codeMax := cod;
  end;
end;

procedure codigoMax(a: arbol2; var maxCod, maxVen: integer);
begin
  if (a <> nil) then begin
	 actualizarMaximo( a^.dato.cantTotal, a^.dato.codProducto, maxVen, maxCod);
	 codigoMax(a^.hi, maxCod, maxVen);
	 codigoMax(a^.hd, maxCod, maxVen);
  end; 
end;

function codigoProdMasVendido(a2: arbol2): integer;
var
  maxCod, maxVentas: integer;
begin
  maxVentas:= -1;
  codigoMax(a2, maxCod, maxVentas);
  codigoProdMasVendido:= maxCod;
end;

// inciso d)
procedure maximo(cantv, cod: integer; var max, codeMax: integer );
begin
  if (cantv > max) then begin
     max:= cantv;
     codeMax := cod;
  end;
end;

function contarVentas(L: lista): integer;
var
  cant: integer;
begin	
  cant:= 0;
  while (L <> nil) do begin
	 cant:= cant + 1;
	 L:= L^.sig;
  end;
  contarVentas:= cant;
end;

procedure masVentas(a: arbol3; var maxCod, maxVentas: integer);
begin
  if (a <> nil) then begin
	 if (a^.hi <> nil) then
	    masVentas (a^.hi, maxCod, maxVentas);
	 maximo(contarVentas(a^.dato.lventas), a^.dato.codProducto, maxVentas, maxCod);
	 if (a^.hd <> nil) then
		masVentas (a^.hd, maxCod, maxVentas);
  end;
end;

function codigoConMayorVentas(a: arbol3): integer;
var
  maxCod, maxVentas: integer;
begin
  maxVentas:= -1;
  masVentas(a, maxCod, maxVentas);
  codigoConMayorVentas:= maxCod;
end;

var
  a: arbol;
  a2: arbol2;
  a3: arbol3;
  f: fechas;
begin
  generarArbol(a, a2, a3);
  writeln();
  imprimirArbolVenta(a);
  writeln();
  imprimirArbolProductos(a2);
  writeln();
  imprimirArboldeListas(a3);
  writeln();
  cargarFecha(f);
  writeln('La cantidad total de productos vendidos en la fecha ', f.dia,'/', f.mes, '/', f.anio,' es: ', cantProdVendidosFecha(a, f));
  writeln();
  writeln('El codigo del producto con mas unidades vendidas es: ', codigoProdMasVendido(a2));
  writeln();
  writeln('El codigo de producto con mayor cantidad de ventas es: ', codigoConMayorVentas(a3))
end.












