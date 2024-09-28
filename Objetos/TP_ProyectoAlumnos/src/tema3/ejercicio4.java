/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio4 {

    public static void main(String[] args) {
        int n = 15;
        Hotel h = new Hotel(n);
        int i;
        Cliente c;
        
        for (i = 0; i < n; i++) {
            if (GeneradorAleatorio.generarBoolean()) {
                c = new Cliente(GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarInt(50000000),GeneradorAleatorio.generarInt(100));
                h.ingresarCliente(c, i);
            }
        }
        
        System.out.println(h.toString());
        
        h.aumentarPrecio(300);
        
        System.out.println(h.toString());
        
    }
    
}
