/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2023;

public class turnoD {

    public static void main(String[] args) {
        Estacionamiento e = new Estacionamiento("60 e/ 4 y 5", 1500, 3, 5);

        Vehiculo v1 = new Vehiculo("ABC123", 3, "Toyota", "Corolla");
        Vehiculo v2 = new Vehiculo("DEF456", 2, "Ford", "Fiesta");
        Vehiculo v3 = new Vehiculo("GHI789", 5, "Toyota", "Yaris");
        Vehiculo v4 = new Vehiculo("JKL123", 4, "Chevrolet", "Onix");
        
        e.registrarVehiculo(v1, 1, 1);
        e.registrarVehiculo(v2, 2, 4);
        e.registrarVehiculo(v3, 1, 3);
        e.registrarVehiculo(v4, 3, 3);
        
        System.out.println(e.toString());
        System.out.println("Liberar lugar" + e.liberarMarca("Toyota", 1));
        
        System.out.println("Sector que mas recaudo: " + e.mayorSector());
        System.out.println(e.toString());
        System.out.println("Liberar lugar" + e.liberarMarca("Toyota", 1));
    }
    
}
