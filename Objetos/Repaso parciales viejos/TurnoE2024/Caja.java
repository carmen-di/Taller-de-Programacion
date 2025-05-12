/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Caja {
    private String nombre;
    private Ticket[] tickets;
    private int dimL;
    private int dimF;
    
    public Caja(String nombre, int cantMaxTickets) {
        this.nombre = nombre;
        this.dimL = 0;
        this.dimF = cantMaxTickets;
        this.tickets = new Ticket [dimF];
    }
    
    public void agregarTicket(Ticket t) {
        if (dimL < dimF) {
            tickets[dimL] = t;
            dimL++;
        }
    }
    
    public int contarTicketsConCredito() {
        int cant = 0;
        for (int i = 0; i < dimL; i++) {
            if (tickets[i].getMedioDePago().equals("credito")) {
                cant++;
            }
        }
        return cant;
    }
    
    public String toString () {
        String aux = "\nNombre del cajero: " + this.nombre + ". Tickets emitidos: [";
        for (int i = 0; i < dimL; i++) {
            aux += "\n  -" + tickets[i].toString();
        }
        aux+= "]";
        return aux;
    }
}
