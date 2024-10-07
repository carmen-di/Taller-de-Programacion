/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoF2023;

public class Director extends Empleado {
    private double montoViaticos;
    
    public Director (String nombre, int dni, int ingreso, double sueldo, double montoViaticos) {
        super(nombre, dni, ingreso, sueldo);
        this.montoViaticos = montoViaticos;
    }

    public double getMontoViaticos() {
        return montoViaticos;
    }

    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }
    
    public double sueldoACobrar() {
        return super.sueldoACobrar() + montoViaticos;
    }

}
