/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
         
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int df = 5;
        int [][] matriz = new int[df][df];
        int i, j;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }

        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("Matriz");
        for (i = 0 ; i < df; i++){
          for (j = 0; j < df; j++){
              System.out.print(matriz [i][j]+ " ");
          }
          System.out.println("");
        }
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (j = 0; j < df; j++) {
            suma = suma + matriz[1][j];
        }
        
        System.out.println("La suma de los elementos de la fila 1 es "+ suma);
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        System.out.println("Vector");
        int [] vector = new int[df];
        for (i = 0; i < df; i++) {
            for (j = 0; j < df; j++) {
                vector[i] += matriz[j][i];
            }
            System.out.print(vector[i] + " - " );
        }

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println(" ");
        System.out.println("Ingrese un valor a buscar en la matriz");
        int num = Lector.leerInt();
        
        int fila = 0;  //Java cuenta las posiciones a partir del 0
        int columna = 0;
        boolean encontre = false;
        i = 0;
        while (i < df && ! encontre) {
            j = 0;
            while (j < df && ! encontre) {
                if (matriz[i][j] == num) {
                    fila = i;
                    columna = j;
                    encontre = true;
                }
                j++;
            }
            i++;
        }
        if (encontre)        
           System.out.println("El número se encuentra en la fila " + (fila + 1) + " columna " + (columna + 1));
        else {
           System.out.println("No se encontró");
        }
    }
}
