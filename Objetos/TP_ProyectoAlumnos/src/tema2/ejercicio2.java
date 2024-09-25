
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona[] vpersona = new Persona[15];
        
        int diml = 0;
        int edad = GeneradorAleatorio.generarInt(100);
        while ((edad!= 0) && (diml < 15)) {
            String nombre = GeneradorAleatorio.generarString(5);
            int dni = GeneradorAleatorio.generarInt(40);
            vpersona[diml] = new Persona(nombre, dni, edad);
            System.out.println(vpersona[diml].toString());
            diml++;
            edad = GeneradorAleatorio.generarInt(100);
        }
        
        Persona min = new Persona();
        int minimo = 99999;
        int mayores = 0;
        for (int i = 0; i < diml; i++) {
            if (vpersona[i].getEdad() > 65)
                mayores++;
            if (vpersona[i].getDNI()< minimo) {
                minimo = vpersona[i].getDNI();
                min = vpersona[i];
            }
        }
        
        System.out.println ("La cantidad de personas mayores a 65 años es: " +mayores);
        System.out.println (min.toString()+ " es la persona con dni menor");
        
    }
    
}
