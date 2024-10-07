/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoC2023;

public class Surtidor {
    private boolean estado;
    private Venta[] ventas;
    private int cantVentas;
    private int cantMax;
    
    public Surtidor(int capacidad) {
        this.estado = true;
        this.cantVentas = 0;
        this.cantMax = capacidad;
        this.ventas = new Venta[cantMax];
        for(int i = 0; i < capacidad; i++) {
            this.ventas[i] = null;
        }
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
    public void agregarVenta(Venta v) {
        if (cantVentas < cantMax) {
            ventas[cantVentas] = v;
            cantVentas++;
        } else {
            System.out.println("No se pudo agregar la venta");
        }
    }
    
    private int calcularCantidad() {
        int cant = 0;
        for (int i = 0; i < cantVentas; i++) {
            cant+= this.ventas[i].getCantLt();
        }
        return cant;
    }
    
    public void actualizarServicio(int x) {
        if(calcularCantidad() < x) {
            this.estado = false;
        }
    }
    
    public Venta mayorMonto() {
        Venta vMax = null;
        double max = -1;
        for (int i = 1; i < cantVentas; i++) {
            if (this.ventas[i].getMonto() > max) {
                max = this.ventas[i].getMonto();
                vMax = this.ventas[i];
            }
        }
        return vMax;
    }
    
    private String verificarServicio() {
        if (this.estado) {
            return " Esta en servicio ";
        }
        else
            return " Esta fuera de servicio ";
    }
    
    public String toString() {
        String aux = this.verificarServicio() + " Ventas: ";
        for (int j = 0; j < cantVentas; j++) {
            aux += " | " + this.ventas[j].toString() + " | "; // Llamada al toString() de cada Venta
        }
        return aux;
    }
}
