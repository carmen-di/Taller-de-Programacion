/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class ejercicio5 {

    public static void main(String[] args) {
        VisorFigurasModificado vf = new VisorFigurasModificado ();
      
        vf.guardar(new Cuadrado (10, "Rojo", "Negro"));
        vf.guardar (new Cuadrado (3, "Amarillo", "Negro"));
        vf.guardar(new Rectangulo (20,10,"Azul","Negro"));
      
        vf.mostrar();
        System.out.println(vf.getGuardadas());
    }
    
}
