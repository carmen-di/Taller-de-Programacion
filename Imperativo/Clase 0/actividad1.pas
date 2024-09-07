program ProgramaNumAleatorio;

procedure incisoC;
var 
  ale, i: integer;
begin
  for i:= 1 to 20 do begin
      ale := random (100); {devuelve un valor aleatorio en el intervalo 0 a 99}
      writeln ('El numero aleatorio generado es: ', ale);
  end;
end;

procedure incisoD;
var 
  ale, i, n, a, b: integer;
begin
  writeln('Ingrese el numero a, b y n: ');
  readln(a);
  readln(b);
  readln(n);
  for i:= 1 to n do begin
      ale := random(b - a) + a + 1;   {b - a es la cantidad de numeros
									   + 1 es porque el random va de de 0 a 9
									   + a es para que el mínino número sea random + a}
      writeln ('El numero aleatorio generado es: ', ale);
  end;
end;

procedure incisoE;
var 
  ale, a, b, f: integer;
begin
  writeln('Ingrese el numero a, b y f: ');
  readln(a);
  readln(b);
  readln(f);
  ale := random(b - a) + a + 1;
  while (ale <> f) do begin
      writeln ('El numero aleatorio generado es: ', ale);
      ale := random(b - a) + a + 1;
  end;
  writeln ('El proceso termino porque se genero el numero ingresado');
end;

begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     incisoC;
     incisoD;
     incisoE;
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.
