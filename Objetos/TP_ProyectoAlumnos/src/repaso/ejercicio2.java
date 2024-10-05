/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejercicio2 {

    public static void main(String[] args) {
        Estacionamiento e = new Estacionamiento("Jorge", "60 e/ 4 y 5", "6:00", "22:00", 3, 3);
        
        int i;
        for (i = 0; i < 6; i++) {
            Auto a = new Auto(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(6));
            e.registarAuto(a, GeneradorAleatorio.generarInt(3), GeneradorAleatorio.generarInt(3));
        }
        
        System.out.println(e.toString());
        
        System.out.println(e.cantidadPlaza(1));
        
        System.out.println("\nIngrese una patente a buscar");
        System.out.println(e.buscarPatente(Lector.leerString()));
    }
    
}
