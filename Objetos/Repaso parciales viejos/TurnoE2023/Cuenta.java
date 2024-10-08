/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoE2023;

public class Cuenta {
    private int cbu;
    private String alias;
    private int dni;
    private String moneda;
    private double monto;
    
    public Cuenta(int cbu, String alias, int DNI, String moneda) {
        this.cbu = cbu;
        this.alias = alias;
        this.dni = DNI;
        this.moneda = moneda;
        this.monto = 0.0;  // La cuenta se inicia con monto en 0
    }

    public int getCbu() {
        return cbu;
    }

    public String getMoneda() {
        return moneda;
    }

    public double getMonto() {
        return monto;
    }
    
    public void incrementarMonto(double dinero) {
        this.monto += dinero;
    }
    
}
