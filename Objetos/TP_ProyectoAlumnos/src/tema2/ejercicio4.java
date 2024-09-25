/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;

public class ejercicio4 {

    public static void main(String[] args) {
        int dimF = 5, dimC = 8;
        int cuposMax = 40, cantCupos= 0;
        
        Persona[][] matriz = new Persona[dimF][dimC];
        int vecDimL[] = new int [dimF];
        
        for (int i = 0; i < dimF; i++)
            vecDimL[i] = 0;
        
        System.out.println("Ingrese nombre: ");
        String n = Lector.leerString();
        
        while (!n.equals("ZZZ") && cantCupos < cuposMax) { 
            System.out.println("Ingrese el DNI: ");
            int dni = Lector.leerInt();
            System.out.println("Ingrese la edad: ");
            int edad = Lector.leerInt();
            System.out.println("Ingrese el dia (1 a 5): ");
            int dia = Lector.leerInt();
            if (vecDimL[dia] < dimC) {
                // Inscribir en el siguiente turno disponible
                matriz[dia][vecDimL[dia]] = new Persona(n, dni, edad);
                vecDimL[dia]++; // Incrementar el contador de turnos
                cantCupos++; // Aumentar el total de inscripciones
                System.out.println("Inscripción exitosa en el día " + (dia) + ", turno " + vecDimL[dia]);
            } else {
                // Informar que no hay turnos disponibles en el día deseado
                System.out.println("No hay turnos disponibles en el día " + (dia));
            }
            System.out.println("\nIngrese nombre: ");
            n = Lector.leerString();
        }
        
        System.out.println("\nResumen de inscripciones:");
        for (int i = 0; i < dimF; i++) {
            System.out.println("Dia " + (i+1) + ": " + vecDimL[i]);
            for (int j = 0; j < vecDimL[i]; j++)
                System.out.println("Turno: " + (j+1) + " Nombre: " + matriz[i][j].getNombre());
            System.out.println();
        }
        
    }
    

    
}
