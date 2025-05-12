/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Ticket {
    private int numTicket;
    private int cuit;
    private int cantProductos;
    private double montoAbonado;
    private String medioDePago;

    public Ticket(int numeroTicket, int CUIT, int cantProdComprados, double montoAbonado, String medioDePago) {
        this.numTicket = numeroTicket;
        this.cuit = CUIT;
        this.cantProductos = cantProdComprados;
        this.montoAbonado = montoAbonado;
        this.medioDePago = medioDePago;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    @Override
    public String toString() {
        return "Nro de ticket: " + numTicket + ", CUIT del cliente: " + cuit + ", cantidad de productos: " + cantProductos + ", monto abonado: " + montoAbonado + ", medio de pago: " + medioDePago;
    }
    
    
}
