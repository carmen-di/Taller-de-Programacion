/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoF2023;

public class turnoF {

    public static void main(String[] args) {
        Director direc = new Director("Juan Lopez", 35874, 2002, 30000, 1500);
        Empresa e = new Empresa("Empresa abc", "Avenida 13 1234", direc, 3);
        
        Encargado encargado1 = new Encargado("Azul", 35611, 2005, 1000, 5);
        Encargado encargado2 = new Encargado("Manuel", 40145, 2008, 1200, 7);
        Encargado encargado3 = new Encargado("Francisco", 41758, 2003, 800, 3);
        
        e.asignarEncargado(encargado1, 1);
        e.asignarEncargado(encargado2, 3);
        
        System.out.println(e.toString());
    }
    
}
