/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;

public class ejercicio5 {

    public static void main(String[] args) {
        Circulo c = new Circulo();
        
        System.out.println("Ingrese el radio del circulo: ");
        c.setRadio(Lector.leerDouble());
       
        System.out.println("Ingrese el color de relleno");
        c.setColorR(Lector.leerString());

        System.out.println("Ingrese el color de linea");
        c.setColorL(Lector.leerString());
       
        System.out.println("El perimetro del circulo es: " + c.perimetro());
        System.out.println("El area del circulo es: " + c.area()); 
    }
    
}
