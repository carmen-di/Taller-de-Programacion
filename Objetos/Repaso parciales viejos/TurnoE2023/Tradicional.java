/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoE2023;

public class Tradicional extends Banco {
    private String direccion;
    private String localidad;
    private int cantCuentas;
    
    public Tradicional(String nombre, int cantEmpleados, int dimF, String direccion, String localidad, int cantCuentas) {
        super(nombre, cantEmpleados, dimF);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cantCuentas = 0;
    }
    
    public boolean agregarCuenta(Cuenta unaCuenta) {
        boolean ok;
        if (unaCuenta.getMoneda().equals("Dolares")) {
            if (cantCuentas <= 100) {
                ok = super.agregarCuenta(unaCuenta);
                cantCuentas += 1;
            } else {
                ok = false;
            }
        } else {
            ok = super.agregarCuenta(unaCuenta);
        }
        return ok;
    }
    
    public boolean puedeRecibirTarjeta(int cbu) {
        boolean pude = false;
        Cuenta cuenta = super.obtenerCuenta(cbu);
        if (cuenta != null) {
            if (cuenta.getMoneda().equals("Dolares") && cuenta.getMonto() > 500) {
                pude = true;
            } else if (cuenta.getMoneda().equals("Pesos") && cuenta.getMonto() > 70000) {
                pude = true;
            }
        }
        return pude;
    }
}
