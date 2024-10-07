/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoC2023;

public class Venta {
    private int dni;
    private int cantLt;
    private double monto;
    private String medioDePago;
    
    public Venta(int dni, int cantLt, double monto, String medioDePago) {
        this.dni = dni;
        this.cantLt = cantLt;
        this.monto = monto;
        this.medioDePago = medioDePago;
    }

    public int getDni() {
        return dni;
    }

    public int getCantLt() {
        return cantLt;
    }

    public double getMonto() {
        return monto;
    }

    public String getMedioDePago() {
        return medioDePago;
    }
    
    @Override
     public String toString() {
        return "DNI: " + dni + ", m3 cargados: " + cantLt + ", monto abonado: $" + monto + ", medio pago: " + medioDePago;
    }
}
