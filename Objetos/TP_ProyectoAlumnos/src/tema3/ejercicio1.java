/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        Triangulo t = new Triangulo();
        
        System.out.println("Ingrese el lado A: ");
        t.setLadoA(Lector.leerDouble());
        
        System.out.println("Ingrese el lado B");
        t.setLadoB(Lector.leerDouble()); 

        System.out.println("Ingrese el lado C");
        t.setLadoC(Lector.leerDouble()); 

        System.out.println("Ingrese el color de relleno");
        t.setColorR(Lector.leerString());

        System.out.println("Ingrese el color de linea");
                
        t.setColorL(Lector.leerString());
        
        System.out.println("El area del triangulo es: " + t.area());
        System.out.println("El perímetro del triangulo es: " + t.perimetro());
    }
    
}
