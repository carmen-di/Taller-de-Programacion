program imperactivoEjercicioClase1;
const
	max = 50;
type
	subcant = 1..99;
	subcod = 0..15;
	ventas = record
		dia: integer;
		codigo: subcod;
		cant: subcant;
	end;
	vector = array [1..max] of ventas;
	
	vendidos = record
		codigo: subcod;
		cant: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		elem: vendidos;
		sig: lista;
	end;

{-----------------------------------------------}	

procedure leerVenta(var venta: ventas);
begin
	writeln('Ingrese dia de venta');
	readLn(venta.dia);
	if (venta.dia <> 0) then
		begin
			venta.codigo:= random(15)+1;
			writeln('Ingrese cantidad vendida entre 1 y 99');
			readLn(venta.cant);
		end
	else
		writeLn('Termino la lectura');
		writeLn('-------------------------------------------------------');
end;

{-----------------------------------------------}
	
procedure leerVector(var v: vector; var dl: integer);
var
	venta: ventas;
begin
	dl:= 0;
	leerVenta(venta);
	while (venta.dia <> 0) do
		begin
			dl:= dl +1;
			v[dl]:= venta;
			leerVenta(venta);
		end;
end;

{-----------------------------------------------}

procedure imprimirVector(v: vector; dl: integer);
var
	i: integer;
begin
	for i:= 1 to dl do
		begin
			writeln('Codigo de producto: ', v[i].codigo);
			writeln('Dia de producto: ', v[i].dia);
			writeln('Cantidad de producto: ', v[i].cant);
		end;	
end;

{-----------------------------------------------}

procedure ordenarVector(var v: vector; dl: integer);
var i, j, minimo: integer; item : ventas;		
begin
 for i:=1 to (dl-1) do begin //recorre todo el vector
          minimo := i;
          for j := i+1 to dl do       {busca el mínimo y guarda en minimo la posición}
             if v[ j ].codigo < v[ minimo ].codigo then 
				minimo:=j;

         {intercambia v[i] y v[minimo]}
         item := v[ minimo ];   
         v[ minimo ] := v[ i ];   
         v[ i ] := item;
      end;
end;
{-----------------------------------------------}
function buscarIndice(v: vector; codigo: integer; dl: integer): integer;
var
	low, high, mid: integer;
begin
	low := 1;
	high := dl;
	while (low <= high) do
	begin
		mid := (low + high) div 2;			// divide el vector en 2 mitades
		if (v[mid].codigo < codigo) then
			low := mid + 1                // si codigo es mayor al medio, busca en la parte de arriba
		else if (v[mid].codigo > codigo) then
			high := mid - 1				 // si codigo es menor al medio, busca en la parte de abajo
		else
		begin
			buscarIndice := mid;
			exit;							// preguntar si esto se puede hacer
		end;
	end;
	buscarIndice := -1;  // Si no se encuentra, se devuelve -1
end;
{-----------------------------------------------}

procedure eliminarEnVector(var v: vector;var dl: integer;cod1,cod2: integer);
var
	desde,hasta,i,j,salto: integer;
begin
	desde:=buscarIndice(v,cod1,dl);
	hasta:=buscarIndice(v,cod2,dl);
	writeln('desde: ',desde,', hasta: ',hasta);
	if(desde <> -1) and (hasta<> -1) then
		begin
			j:= desde;
			for i:= hasta + 1 to dl do
				begin
					v[j]:= v[i];
					j:= j+1
				end;
			salto:= (hasta-desde)+1;
			dl:= dl-salto;
		end
	else
		writeln('Codigos no encontrados');
end;

{-----------------------------------------------}

procedure agregarDelante(var l: lista; aux: vendidos); {tiene q ser agregar atras para mantener el orden de menor a mayor}
var
  nuevo: lista;
begin
  new(nuevo);
  nuevo^.elem:= aux;
  nuevo^.sig := l;
  l := nuevo;
end;

{-----------------------------------------------}
procedure contarVentas(v: vector; dl: integer; var l: lista);
var
codigoActual: subcod;
cantidadTotal,i: integer;
aux: vendidos;

begin
	i:= 1;
	while (i <=dl) do
		begin
			codigoActual:= v[i].codigo;
			cantidadTotal:= 0;
			while (i <=dl) and (codigoActual = v[i].codigo) do
				begin
					cantidadTotal:= cantidadTotal + v[i].cant;
					i:= i+1;
				end;
			if	(codigoActual MOD 2 = 0) then
				begin
					aux.cant:= cantidadTotal;
					aux.codigo:= codigoActual;
					agregarDelante(l,aux); {tiene q ser agregar atras para mantener el orden de menor a mayor}
				end;
		end;
end;

{-----------------------------------------------}

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do
  begin
    writeln('Codigo: ', l^.elem.codigo, ', Cantidad Vendida: ', l^.elem.cant);
    l := l^.sig;
  end;
end;

{-----------------------------------------------}
var
	v: vector;
	l: lista;
	dl,cod1,cod2: integer;
	
BEGIN
	l:= nil;
	randomize;
	leerVector(v, dl);
	writeln('VECTOR INGRESADO: ');
	imprimirVector(v, dl);
	writeln('-------------------------------------------------------');
	readln();
	ordenarVector(v,dl);
	writeln('VECTOR ORDENADO: ');
	imprimirVector(v, dl);
	writeln('-------------------------------------------------------');
	writeln('ingrese desde que codigo quiere eliminar: ');
	readln(cod1);
	writeln('ingrese hasta que codigo quiere eliminar: ');
	readln(cod2);
	eliminarEnVector(v,dl,cod1,cod2);
	readln();
	imprimirVector(v, dl);
	writeln('termino la tercera impresion, presione una tecla');
	readln();
	contarVentas(v,dl,l);
	writeln('Lista obtenida entre los codigos pares: ');
	imprimirLista(l);
	writeln('-------------------------------------------------------');
END.

