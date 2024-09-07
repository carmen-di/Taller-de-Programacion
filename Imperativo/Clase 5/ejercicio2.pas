program ej2;
type
  anios = 2010..2018;
  auto = record
     patente: integer;
     anio: anios;
     marca: string;
     modelo: string;
  end;
  
  arbol = ^nodo;
  nodo = record
     dato: auto;
     hi: arbol;
     hd: arbol;
  end;
  
  auto2 = record
     patente: integer;
     anio: anios;
     modelo: string;
  end;
    
  lista = ^nodoL;
  nodoL = record
     dato: auto2;
     sig: lista;
  end;
    
  marcas = record
     marca: string;
     autoL: lista;
  end;
    
  arbol2 = ^nodo2;
  nodo2 = record 
     dato: marcas;
     hi: arbol2;
     hd: arbol2;
  end;
  
  listaA = ^nodoL2;
  nodoL2 = record
     dato: auto;
     sig: listaA;
  end;
  
  vector = array[anios] of listaA;
  
procedure leerAuto(var au: auto);
begin
  write('Marca del auto: ');
  readln(au.marca);
  if (au.marca <> 'MMM') then begin
     write('Patente: ');
     readln(au.patente);
	 write('Año de fabricacion, del 2010 al 2018: ');
	 readln(au.anio);
	 write('Modelo del auto: ');
	 readln(au.modelo);
	 writeln();
  end;
end;

procedure insertarElemento(var a: arbol; au: auto);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= au;
     a^.hi:= nil;
     a^.hd:= nil;
  end
  else
     if (a^.dato.patente >= au.patente) then
        insertarElemento(a^.hi, au)
     else
        insertarElemento(a^.hd, au);
end;

procedure agregarAdelante(var l: lista; au: auto);
var
  aux: lista;
begin
  new(aux);
  aux^.dato.patente:= au.patente;
  aux^.dato.anio:= au.anio;
  aux^.dato.modelo:= au.modelo;
  aux^.sig:= l;
  l:= aux;
end;

procedure insertarElementoA2(var a2: arbol2; au: auto);
begin
  if (a2 = nil) then begin
     new(a2);
     a2^.dato.marca:= au.marca;
     a2^.dato.autoL:= nil;
     agregarAdelante(a2^.dato.autoL, au);
     a2^.hi:= nil;
     a2^.hd:= nil;
  end
  else
     if (au.marca  < a2^.dato.marca) then 
		  insertarElementoA2(a2^.hi, au)
	  else
	      if (au.marca > a2^.dato.marca) then
             insertarElementoA2(a2^.hd, au)
           else
             agregarAdelante(a2^.dato.autoL, au);
end;


procedure cargarArboles(var a: arbol; var a2: arbol2);
var
  au: auto;
begin
  leerAuto(au);
  while (au.marca <> 'MMM') do begin
     insertarElemento(a, au);
     insertarElementoA2(a2, au);
     leerAuto(au);
  end;
end;

procedure imprimirArbolPatente(a: arbol);
begin
  if (a <> nil) then begin
     imprimirArbolPatente(a^.hi);
     writeln ('Patente: ', a^.dato.patente, ' Marca del auto: ', a^.dato.marca, ' Anio de fabricacion: ', a^.dato.anio, ' Modelo: ', a^.dato.modelo);
     imprimirArbolPatente(a^.hd);
  end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
     writeln();
     writeln('Patente: ', l^.dato.patente);
     writeln('Anio de fabricacion: ',l^.dato.anio);
	 writeln('Modelo: ', l^.dato.modelo);
	 l:= l^.sig;
  end;
end;

procedure ImprimirArbolMarca(a2: arbol2);
begin
  if (a2 <> nil) then begin
     ImprimirArbolMarca(a2^.hi);
     writeln('------------------------------------');
	 writeln('Marca: ', a2^.dato.marca);
	 imprimirLista(a2^.dato.autoL);
     writeln();
	 ImprimirArbolMarca(a2^.hd);
  end;
end;

// Inciso b)
function contarAutosMarca(a: arbol; marca: string): integer;
begin
  if (a = nil) then
     contarAutosMarca:= 0
  else
     if (a^.dato.marca = marca) then
       contarAutosMarca:= contarAutosMarca(a^.hi, marca) + contarAutosMarca(a^.hd, marca) + 1
     else
       contarAutosMarca:= contarAutosMarca(a^.hi, marca) + contarAutosMarca(a^.hd, marca); 
end;

// Inciso c)
function contarAutosL(l: lista): integer;
var
  cant: integer;
begin
  cant := 0;
  while (l <> nil) do begin
	 cant:= cant + 1;
	 l:= l^.sig;
  end;
  contarAutosL:= cant;
end;

function contarAutosMarca2(a2: arbol2; marca: string): integer;
begin
  if (a2 = nil) then
     contarAutosMarca2:= 0
  else
     if (a2^.dato.marca = marca) then
        contarAutosMarca2:= contarAutosL(a2^.dato.autoL)
     else 
        if (marca < a2^.dato.marca) then
           contarAutosMarca2:= contarAutosMarca2(a2^.hi, marca)
        else
           contarAutosMarca2:= contarAutosMarca2(a2^.hd, marca);
end;

// Inciso d)
procedure inicializarVector(var v: vector);
var
  i: anios;
begin
  for i:= 2010 to 2018 do
     v[i]:= nil;
end;

procedure agregarAutoALista(var l: listaA; au: auto);
var
  nue: listaA;
begin
  new(nue);
  nue^.dato:= au;
  nue^.sig:= l;
  l:= nue;
end;

procedure generarVector(a: arbol; var v: vector);
begin
  if (a <> nil) then begin
     generarVector(a^.hi, v);  // Procesar subárbol izquierdo
     agregarAutoALista(v[a^.dato.anio], a^.dato);  // Agregar auto a la lista correspondiente al año
     generarVector(a^.hd, v);  // Procesar subárbol derecho
  end;
end;

procedure imprimirVectorDeListas(v: vector);
var 
  i: anios;
begin
  for i:= 2010 to 2018 do begin
	 if (v[i] <> nil) then
		writeln('Año de fabricacion: ', i);
	 while (v[i] <> nil) do begin
		 writeln('Marca: ', v[i]^.dato.marca);
		 writeln('Patente: ', v[i]^.dato.patente);
		 writeln('Modelo: ', v[i]^.dato.modelo);
		 writeln('------------------------------------');
		 v[i]:= v[i]^.sig;
	 end;
  end;
end;

// Inciso e)
procedure buscarPatente(a: arbol; patente: integer; var modelo: string);
begin
  if (a = nil) then
     writeln('No se encontro la patenta')
  else
     if (a^.dato.patente = patente) then
       modelo:= a^.dato.modelo
     else
       if (patente < a^.dato.patente) then
          buscarPatente(a^.hi, patente, modelo)
       else
          buscarPatente(a^.hd, patente, modelo);
end;

// Inciso f)
procedure buscarPatenteEnLista(l: lista; patente: integer; var modelo: string; var encontre: boolean);
begin
  while (l <> nil) and not encontre do begin
    if (l^.dato.patente = patente) then begin
      modelo := l^.dato.modelo;
      encontre := true;
    end;
    l := l^.sig;
  end;
end;

procedure buscarPatente2(a2: arbol2; patente: integer; var modelo: string; var encontre: boolean);
begin
  if (a2 <> nil) and (not encontre) then begin
    // Buscar en la lista de autos del nodo actual
    buscarPatenteEnLista(a2^.dato.autoL, patente, modelo, encontre);
    
    // Si no se encontró, continuar buscando en los subárboles
    if (not encontre) then
      buscarPatente2(a2^.hi, patente, modelo, encontre);
      
    if not encontre then
      buscarPatente2(a2^.hd, patente, modelo, encontre);
  end;
end;

var
  a: arbol;
  a2: arbol2;
  marca, modelo: string;
  patente: integer;
  ok: boolean;
  v: vector;
begin
  cargarArboles(a, a2);
  ImprimirArbolPatente(a);
  ImprimirArbolMarca(a2);
  writeln();
  write('Ingrese una marca de auto: ');
  readln(marca);
  writeln('La cantidad de autos de la marca ', marca, ' que posee la agencia es: ', contarAutosMarca(a, marca));
  writeln();
  write('Ingrese otra marca de auto: ');
  readln(marca);
  writeln('La cantidad de autos de la marca ', marca, ' que posee la agencia es: ', contarAutosMarca2(a2, marca));
  writeln();
  generarVector(a, v);
  imprimirVectorDeListas(v);
  write('Ingrese una patente a buscar: ');
  readln(patente);
  buscarPatente(a, patente, modelo);
  writeln('El modelo del auto con patente ', patente, ' es: ', modelo);
  writeln();
  ok:= false;
  write('Ingrese otra patente a buscar: ');
  readln(patente);
  buscarPatente2(a2, patente, modelo, ok);
  if (ok) then
    writeln('El modelo del auto con patente ', patente, ' es: ', modelo)
  else
    writeln('No se encontró el auto con la patente ', patente);
end.
