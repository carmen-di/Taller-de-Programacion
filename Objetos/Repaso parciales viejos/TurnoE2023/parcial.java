/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoE2023;

public class parcial {

    public static void main(String[] args) {
        Tradicional t = new Tradicional("Banco nacion", 50, 200, "Avenida 60 1234", "La Plata", 2);
        Digital d = new Digital("Banco Digital", 20, 100, "www.bancodigital.com");
        
        Cuenta cuenta1 = new Cuenta (123, "ddd.eee.fff", 3814, "Pesos");
        Cuenta cuenta2 = new Cuenta (456, "taza.choclo.taco", 4754, "Efectivo");
        Cuenta cuenta3 = new Cuenta (789, "aaa.bbb.ccc", 2835, "Dolares");
        Cuenta cuenta4 = new Cuenta (012, "nave.onda.pato", 2845, "Dolares");
        
        t.agregarCuenta(cuenta1);
        t.agregarCuenta(cuenta2);
        d.agregarCuenta(cuenta3);
        d.agregarCuenta(cuenta4);
        
        t.depositarDinero(123, 200000);
        d.depositarDinero(789, 150000);
        
        System.out.println(d.puedeRecibirTarjeta(789));
        System.out.println(d.puedeRecibirTarjeta(012));
        System.out.println(t.puedeRecibirTarjeta(123));
        
    }
    
}
