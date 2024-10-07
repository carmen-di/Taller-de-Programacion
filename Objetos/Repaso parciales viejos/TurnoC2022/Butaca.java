/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoCtema2;

public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupada;
    
    public Butaca(){
        this.descriptor = "";
        this.precio = 0.0;
        this.ocupada = false;
    }
    
    public void calcularPrecio(int n){
        this.precio = 800 + (100 * n);
    }
    
    public void descripcion(int n, int m){
        this.descriptor = "Butaca: "+ (n+1) + "  "  + (m+1);
    }
    
    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public boolean isOcupada() {
        return ocupada;
    }

    public void ocupar() {
        this.ocupada = true;
    }

    public void desocupar() {
        this.ocupada = false;
    }
    
    
    @Override
    public String toString(){
        String aux = this.descriptor + "  "+ this.precio + "  " +this.ocupada;
        return aux;
    }
    
}
