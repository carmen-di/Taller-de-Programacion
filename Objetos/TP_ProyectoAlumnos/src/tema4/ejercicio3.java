/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.Lector;

public class ejercicio3 {

    public static void main(String[] args) {
        System.out.println("Ingrese el nombre de la persona: ");
        String unNombre= Lector.leerString();
        System.out.println("DNI: ");
        int unDni= Lector.leerInt();
        System.out.println("Edad: ");
        int unaEdad= Lector.leerInt();
        System.out.println();
        Persona p = new Persona (unNombre,unDni,unaEdad);

        System.out.println("Ingrese el nombre del trabajador");
        String unNombre2= Lector.leerString();
        System.out.println("DNI: ");
        int unDni2= Lector.leerInt();
        System.out.println("Edad: ");
        int unaEdad2= Lector.leerInt();
        System.out.println("Tarea del trabajador:");
        String unaTarea= Lector.leerString();
        System.out.println();
        Trabajador t = new Trabajador (unNombre2,unDni2,unaEdad2,unaTarea);

        System.out.println(p.toString());
        System.out.println(t.toString());
    }
    
}
