/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion(double costo) {
        this.costo = costo;
        this.ocupada = false;
    }

    public Habitacion(){
        
    }
    
    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean getOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
    
    public Cliente getCliente() {
        if (ocupada == true)
            return cliente;
        else
            return null;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public void aumentarPrecio(double n) {
        this.costo += n;
    }
   
    @Override
    public String toString(){
        String aux="Costo: " + costo + "$   ";
        if (ocupada) aux = aux + "Ocupada   "+ cliente.toString();
        else aux =aux + "Libre.\n";
        return aux;
    }
    
}
