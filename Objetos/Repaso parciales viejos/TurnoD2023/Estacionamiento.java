/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2023;

public class Estacionamiento {
    private String direccion;
    private double costo;
    private Vehiculo[][] matriz;
    private int dimS;
    private int dimV;
    
    public Estacionamiento(String direccion, double costoHora, int dimS, int dimV) {
        this.direccion = direccion;
        this.costo = costoHora;
        this.dimS = dimS;
        this.dimV = dimV;
        this.matriz = new Vehiculo[dimS][dimV];
        for (int i = 0; i < dimS; i++ ) {
            for (int j = 0; j < dimV; j++) {
                this.matriz[i][j] = null;
            }
        }
    }
    
    public void registrarVehiculo(Vehiculo v, int x, int y) {
        this.matriz[x - 1][y - 1] = v;
    }
    
    public String liberarMarca(String m, int x) {
        String aux = "";
        for (int i = 0; i < dimV; i++) {
            if (this.matriz[x-1][i]!= null && this.matriz[x-1][i].getMarca().equals(m)) {
                aux+= "Patente: " + this.matriz[x-1][i].getPatente() + " marca: " + this.matriz[x-1][i].getMarca() + " modelo: " + this.matriz[x-1][i].getModelo() + " horas estacionado: " + this.matriz[x-1][i].getCantHoras() + " - ";
                this.matriz[x-1][i] = null;
            }
        }
        return aux;
    }
    
    public double masRecaudado(int sector){
        double total= 0;
        for (int j = 0; j < dimV; j++) {
	   if (matriz[sector][j] != null) {
               total += matriz[sector][j].getCantHoras() * costo;
           }
        }
        return total;
    }
    
    public int mayorSector() {
        int mayorSector = -1;
        double mayorRecaudado= -1, max;
        for (int i = 0; i < dimS; i++) {
            max = masRecaudado(i);
            if (max > mayorRecaudado)  {
                mayorRecaudado = max;
                mayorSector = i+1;
            }
        }
        return mayorSector;
    }
    
    public String toString() {
        String aux = "Estacionamiento: " + this.direccion + ", costo por hora " + this.costo + "\n";
        for (int i = 0; i < dimS; i++) {
            aux += "Sector: " + (i+1) + "\n";
            for (int j = 0; j < dimV; j++) {
                if (matriz[i][j] != null) {
                    aux += "Lugar: " + (j+1) + matriz[i][j].toString() + "\n";
                }
                else {
                    aux += "Lugar: " + (j + 1) + " Libre\n"; 
                }
            }
        }
        return aux;
    }
    
}
