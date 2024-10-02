/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        Triangulo t = new Triangulo (5, 7, 3, "rojo", "azul");
        Circulo cr = new Circulo(4, "amarillo", "violeta");
        
        System.out.println("Triangulo ");
        System.out.println(t.toString());
        System.out.println();
        System.out.println("Circulo ");
        System.out.println(cr.toString());
        System.out.println();
        
        t.despintar();
        System.out.println("Triangulo: " + t); 
        cr.despintar();
        System.out.println("Circulo: " +  cr);
    }
    
}
