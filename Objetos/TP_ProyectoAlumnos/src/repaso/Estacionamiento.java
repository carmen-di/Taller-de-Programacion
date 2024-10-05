/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String hora_apertura;
    private String hora_cierre;
    private int cantPisos;
    private int cantPlazas;
    private Auto pisos[][];

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.hora_apertura = "08:00";
        this.hora_cierre = "21:00";
        this.cantPisos = 5;
        this.cantPlazas = 10;
        pisos = new Auto[cantPisos][cantPlazas];
    }
    
    public Estacionamiento(String nombre, String direccion, String hora_apertura, String hora_cierre, int cantPisos, int cantPlazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.hora_apertura = hora_apertura;
        this.hora_cierre = hora_cierre;
        this.cantPisos = cantPisos;
        this.cantPlazas = cantPlazas;
        pisos = new Auto[cantPisos][cantPlazas];
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHora_apertura() {
        return hora_apertura;
    }

    public void setHora_apertura(String hora_apertura) {
        this.hora_apertura = hora_apertura;
    }

    public String getHora_cierre() {
        return hora_cierre;
    }

    public void setHora_cierre(String hora_cierre) {
        this.hora_cierre = hora_cierre;
    }

    public int getCantPisos() {
        return cantPisos;
    }

    public int getCantPlazas() {
        return cantPlazas;
    }
    
    public void registarAuto(Auto a, int piso, int plaza) {
        pisos[piso][plaza] = a;
    }
    
    public String buscarPatente(String patente) {
        int i = 0;
        int j;
        boolean encontre = false;
        while (!encontre && i < this.cantPisos) {
            j = 0;
            while (!encontre && j < this.cantPlazas) {
                if (pisos[i][j] != null && patente.equals(pisos[i][j].getPatente())) {
                    encontre = true;
                }
                j++;  
            }
            i++;
        }
        if (encontre == true) {
            return "El auto con patente: " + patente + " se encuentra en el piso: " + i + " y plaza: " /*+ j*/;
        } else
            return "Auto Inexistente";
    }
    
    public String toString() {
        String aux = "";
        int i, j;
        for (i = 0; i < cantPisos; i++) {
            aux = aux + "Piso " + (i+1) + "\n";
            for (j = 0; j < cantPlazas; j++) {
                aux = aux+"Plaza " + (j+1) + "    ";
                if (pisos[i][j] == null)
                    aux = aux + "Libre";
                else 
                    aux = aux + pisos[i][j].toString();
                aux= aux + "\n";
            }
        }
        return aux;
    }
    
    public int cantidadPlaza(int num) {
        int i;
        int cant = 0;
        for (i = 0; i < cantPisos; i++) {
            if (pisos[i][num] != null)
                cant++;
        }
        return cant;
    }
    
}
