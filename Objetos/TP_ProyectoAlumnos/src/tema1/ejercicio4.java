/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.Lector;

public class ejercicio4 {

    public static void main(String[] args) {
        int [][] matriz = new int[8][4];
        
        System.out.println("Ingrese el numero de piso y oficina: ");
        int numPiso = Lector.leerInt();
        int numOfi = Lector.leerInt();
        while (numPiso != 9) {
            matriz [numPiso-1] [numOfi-1]++;
            System.out.println("Ingrese el numero de piso y oficina: ");
            numPiso = Lector.leerInt();
            numOfi = Lector.leerInt();
        }
        
        // Informar cantidad de personas
        System.out.println();
        int i, j;
        for (i = 0; i < 8; i++) {
            System.out.println("Piso: "+ (i+1));
            for (j = 0; j < 4; j++) {
                System.out.println(+matriz[i][j]+" personas asistieron a la oficina "+ (j+1));
            }
            System.out.println ("");
        }
    }
    
}
