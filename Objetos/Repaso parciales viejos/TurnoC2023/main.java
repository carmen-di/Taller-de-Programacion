/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoC2023;

public class main {

    public static void main(String[] args) {
        Estacion e = new Estacion("Avenida 7 1234", 100.0, 4);
        
        e.generarVenta(1, 40145, 10, "debito");
        e.generarVenta(2, 35411, 15, "credito");
        e.generarVenta(1, 38146, 20, "efectivo");
        e.generarVenta(4, 43784, 12, "debito");
        
        System.out.println(e.toString());
        
        e.fueraDeServicio(15);
        
        System.out.println("Venta con mayor monto: " + e.ventaMax());
        
        // Imprimir la información de la estación
        System.out.println(e.toString());
    }
    
}
