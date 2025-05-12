/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Supermercado {
    private String direccion;
    private int numVenta;
    private Caja[] cajas;
    private int dimL;
    private int dimF;
    
    public Supermercado(String direccion) {
        this.direccion = direccion;
        this.numVenta = 0;
        this.dimF = 5; // máximo de cajas
        this.dimL = 0; // aún no hay cajas agregadas
        this.cajas = new Caja[dimF]; // espacio para hasta 5 cajas
    }
    
    public void agregarCaja(Caja unaCaja) {
        if (dimL < dimF) {
            cajas[dimL] = unaCaja;
            dimL++;
        }
    }
    
    public void generarTicket(int numCaja, int cuit, int cantProductos, int monto, String pago) {
        Ticket t = new Ticket(numCaja, cuit, cantProductos, monto, pago);
        cajas[numCaja - 1].agregarTicket(t);
        numVenta++;
    }
    
    public int cajaMenorCantidad() {
        int min = 9999;
        int aux = 0;
        for (int i = 0; i < dimL; i++) {
            if (cajas[i].contarTicketsConCredito() < min) {
                min = cajas[i].contarTicketsConCredito();
                aux = i;
            }
        }
        return aux+1;
    }
    
    public String toString() {
        String aux = "Supermercado: " + "Dirección: " +  this.direccion + " Cantidad de cajas: "+ this.dimL+". ";
        for (int i = 0; i < dimL; i++) {
            aux += "\nCaja: " + (i+1) + " " + cajas[i].toString();
        }
        return aux;
    }
}
