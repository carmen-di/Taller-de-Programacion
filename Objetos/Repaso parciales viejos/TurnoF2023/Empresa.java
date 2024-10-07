/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoF2023;

public class Empresa {
    private String nombre;
    private String direccion;
    private Director director;
    private Encargado[] vector;
    private int dimF;
    
    public Empresa(String nombre, String direccion, Director director, int dimF) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
        this.dimF = dimF;
        this.vector = new Encargado[dimF];
        for (int i = 0; i < dimF; i++) {
            this.vector[i] = null;
        }
    }
    
    public void asignarEncargado(Encargado unEncargado, int x) {
        this.vector[x - 1] = unEncargado; 
    }
    
    public String toString() {
        String aux = "Nombre de la empresa: " + this.nombre+ " Dirección: " + this.direccion +" Director/a: "+ director.toString()+ "\n";
        for (int i = 0; i < dimF; i++) {
            if (this.vector[i] == null) {
                aux += "Sucursal: " + (i+1) + " sin encargado" + "\n";
            } else {
                aux += "Sucursal: " + (i+1) + this.vector[i].toString() + "\n";
            }
        }
        return aux;
    }
}
