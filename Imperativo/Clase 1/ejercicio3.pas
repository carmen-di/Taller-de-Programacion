program ej3;
type
  rango = 1..8;
  pelicula = record
     codpeli: integer;
     codgenero: rango;
     puntaje: real;
  end;
  
  lista = ^nodo;
  nodo = record
     dato: pelicula;
     sig: lista;
  end;
  
  peliculamax = record
     codmax: integer;
     puntajemax: real;
  end;
  
  vpeliculas = array[rango] of lista;
  vpuntaje = array[rango] of peliculamax;

procedure leerPelicula(var p: pelicula);
begin
  write('Ingrese el código de la película: ');
  readln(p.codpeli);
  if (p.codpeli <> -1) then begin
     write('Código de género de la película: ');
     readln(p.codgenero);
     write('Puntaje promedio de la película: ');
     readln(p.puntaje);
     writeln();
  end;  
end;

procedure agregarAtras(var l: lista; p: pelicula);
var
  nue, act: lista;
begin
  new(nue); 
  nue^.dato := p; 
  nue^.sig := nil; 
  if(l = nil) then 
     l:= nue
  else begin
     act:= l;
     while (act^.sig <> nil) do
       act:= act^.sig;
     act^.sig:= nue;
  end;
end;

{procedure agregarAtras(var pri, ult: lista; p: pelicula);
var
  aux: lista; 
begin
  new(aux);
  aux^.dato:= p;
  aux^.sig:= nil;
  if (pri = nil) then // si esta vacia
	 pri := aux
  else // si no esta vacia
	 ult^.sig := aux;
  ult := aux;
end;}

procedure inicializar(var v: vpeliculas);
var
  i: integer;
begin
  for i:= 1 to 8 do 
     v[i]:= nil;
end;

procedure cargarVector(var v: vpeliculas);
var
  //ult: lista;
  p: pelicula;
begin
  //ult:= nil;
  leerPelicula(p);
  while (p.codpeli <> -1) do begin
     agregarAtras(v[p.codgenero], p);
     leerPelicula(p);
  end;
end;



// inciso b)
procedure cargarVectorMayorPuntaje(v: vpeliculas; var vp: vpuntaje);
var
  i: integer;
  max: real;
  aux: lista;
begin
  for i:= 1 to 8 do begin
     max:= -1;
     aux:= v[i];
     vp[i].codmax := 0;
     while (aux <> nil) do begin
        if (aux^.dato.puntaje > max) then begin
           max:= aux^.dato.puntaje;
           vp[i].codmax:= aux^.dato.codpeli;
        end;
        aux:= aux^.sig;
     end;
     vp[i].puntajemax:= max;
  end;
end;

// inciso c)
procedure ordenarPuntaje(var vp: vpuntaje);
var
  i, j, pos: integer;
  item: peliculamax;
begin
  for i:= 1 to 8 - 1 do begin
     pos:= i;
     for j:= i + 1 to 8 do
        if (vp[j].puntajemax < vp[pos].puntajemax) then 
           pos:= j;
     item:= vp[pos];
     vp[pos]:= vp[i];
     vp[i]:= item;
  end;
end;

procedure imprimirVectorOrde(vp: vpuntaje);
var
  i: integer;
begin
  for i := 1 to 8 do
    writeln('Genero: ', i, ' Código de película: ', vp[i].codmax, ' Puntaje: ', vp[i].puntajemax:2:2);
  writeln();
end;

// inciso d)
procedure imprimirPelicula(vp: vpuntaje);
begin
  writeln('El código de la pelicula con mayor puntaje es: ', vp[8].codmax);
  writeln('El código de la pelicula con menor puntaje es: ', vp[1].codmax);
end;

var
  v: vpeliculas;
  vp: vpuntaje;
begin
  inicializar(v);
  cargarVector(v);
  cargarVectorMayorPuntaje(v, vp);
  imprimirVectorOrde(vp);
  ordenarPuntaje(vp);
  imprimirVectorOrde(vp);
  imprimirPelicula(vp);
end.
