/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoC2023;

public class Estacion {
    private String direccion;
    private double precio;
    private Surtidor[] surtidores;
    private int dimL;
    private int dimF = 6;
    
    public Estacion(String direccion, double precio, int maxVentas) {
        this.direccion = direccion;
        this.precio = precio;
        this.surtidores = new Surtidor[dimF];
        for (int i = 0; i < dimF; i++) {
            this.surtidores[i] = new Surtidor(maxVentas);
        }
    }
    
    public void generarVenta(int numSurtidor, int dni, int cantM3, String pago) {
        double monto = cantM3 * precio;
        Venta v = new Venta(dni, cantM3, monto, pago);
        surtidores[numSurtidor - 1].agregarVenta(v);
    }
    
    public void fueraDeServicio(int x) {
        for (int i = 0; i < dimF; i++) {
            this.surtidores[i].actualizarServicio(x);
        }
    }
    
    public Venta ventaMax() {
        Venta venMax = null;
        Venta aux = null;
        double max = -1;
        for(int i = 0; i < dimF; i++) {
            aux = this.surtidores[i].mayorMonto();
            if (aux != null && aux.getMonto() > max) {
                max = aux.getMonto();
                venMax = aux;
            }
        }
        return venMax;
    }
    
    public String toString() {
        String aux = "Estacion de Servicio: " + this.direccion+ " Precio M3: "+ this.precio + "\n";
        for (int i = 0; i < dimF; i++) {
            aux += "Surtidor "+ (i+1) + this.surtidores[i].toString() + "\n";
        }
        return aux;
    }
    
    
}
