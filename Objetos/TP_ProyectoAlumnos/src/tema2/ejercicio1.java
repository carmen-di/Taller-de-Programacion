/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        Persona p = new Persona();
        
        System.out.println("Ingrese un nombre: ");
        p.setNombre(Lector.leerString());
        System.out.println ("Ingrese el numero de dni: ");
        p.setDNI(Lector.leerInt());
        System.out.println("Ingrese la edad: ");
        p.setEdad(Lector.leerInt());
        
        System.out.println(p.toString());
        
        Persona p2 = new Persona(Lector.leerString(), Lector.leerInt(), Lector.leerInt());
        System.out.println(p2.toString());
    }
    
}
