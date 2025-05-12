/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class parcialTurnoE {

    public static void main(String[] args) {
        Supermercado s = new Supermercado("Calle 59 1234");
        
        Caja c1 = new Caja("Carlos", 1);
        
        s.agregarCaja(c1);
        s.generarTicket(1, 123456, 3, 3000, "efectivo");
        s.generarTicket(1, 789102, 4, 5000, "credito");
        
        Caja c2 = new Caja("María", 2);
        
        s.agregarCaja(c2);
        s.generarTicket(2, 345678, 2, 1500, "debito");
        s.generarTicket(2, 910234, 2, 2000, "credito");
        s.generarTicket(2, 567890, 1, 1000, "credito");
        
        System.out.println("Caja con menor cantidad de tickets pagados con crédito " + s.cajaMenorCantidad());
        System.out.println(s.toString());  
        
    }
    
}
