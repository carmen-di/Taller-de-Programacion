/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;

public class ejercicio3 {

    public static void main(String[] args) {
        int dimF = 5, dimC = 8;
        Persona[][] matriz = new Persona[dimF][dimC]; // Matriz de 5 días y 8 turnos
        int i = 0; // día actual
        int j = 0; // turno actual
        System.out.println("Ingrese nombre: ");
        String n = Lector.leerString();
        
        while (!n.equals("ZZZ") && i < dimF) { // Condición principal para la inscripción
            while (!n.equals("ZZZ") && j < dimC) { // Recorrer los turnos del día actual
                matriz[i][j] = new Persona(); // Crear nueva persona en la matriz
                matriz[i][j].setNombre(n);
                System.out.println("Ingrese un DNI:");
                matriz[i][j].setDNI(Lector.leerInt());
                System.out.println("Ingrese una edad:");
                matriz[i][j].setEdad(Lector.leerInt());
                
                // Avanzar al siguiente turno
                j++;
                
                if (j < dimC) { // Si hay más turnos disponibles en el día, seguir pidiendo el nombre
                    System.out.println("Ingrese nombre: ");
                    n = Lector.leerString();
                }
            }

            // Avanzar al siguiente día si los turnos se completaron
            if (j == dimC) {
                i++;
                j = 0; // Resetear el turno para el nuevo día
            }

            // Si aún hay días disponibles y no se ingresó "ZZZ", seguir pidiendo datos
            if (i < dimF && !n.equals("ZZZ")) {
                System.out.println("Ingrese nombre: ");
                n = Lector.leerString();
            }
        }
        
        System.out.println("\nPersonas asignadas al casting:");
        for (int dia = 0; dia < i; dia++) {
            System.out.println("Día " + (dia + 1) + ":");
            for (int turno = 0; turno < dimC; turno++) {
                if (matriz[dia][turno] != null) {
                    System.out.println("  Turno " + (turno + 1) + ": " + matriz[dia][turno].getNombre());
                }
            }
        }
    }
    
}