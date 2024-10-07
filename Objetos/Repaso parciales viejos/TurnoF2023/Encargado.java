/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoF2023;

public class Encargado extends Empleado {
    private int cantEmpleados;
    
    public Encargado(String nombre, int dni, int ingreso, double sueldo, int cant) {
        super(nombre, dni, ingreso, sueldo);
        this.cantEmpleados = cant;
    }

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
    
    public double sueldoACobrar() {
        return super.sueldoACobrar()+ (1000.0 * cantEmpleados);
    }
    
}
