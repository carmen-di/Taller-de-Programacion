/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio5 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int [][] calificaciones = new int[5][4];
        int i, j, suma;
        
        for (i = 0; i < 5; i++) {
            System.out.println("Cliente: " + (i+1));
            for  (j = 0; j < 4; j++) {
                System.out.println("Calificación para el aspecto " + (j+1) + ": ");
                calificaciones[i][j] = GeneradorAleatorio.generarInt(10)+1;
                System.out.println(calificaciones[i][j]);
            }
            System.out.println();
        }
        
        // Calificación promedio obtenida por cada aspecto
        double promedio;
        for (j = 0; j < 4; j++) {     //PRESTAR ATENCION A COMO RECORRO MATRIZ
            suma = 0;
            for (i = 0; i < 5; i++) {
                suma += calificaciones[i][j];
            }
            promedio = suma / 5.0;
            System.out.println("Calificación promedio del aspecto " + (j+1) + ": " + promedio);
        }
    }
    
}
