/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public abstract class Recital {
    private String nombreBanda;
    private String[] temas;
    private int dimL;
    private int dimF;
    
    public Recital(String unNombre, int cantTemas) {
        this.nombreBanda = unNombre;
        this.dimF = cantTemas;
        temas = new String[cantTemas];
        dimL = 0;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getTemas() {
        return temas;
    }

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }
    
    public void agregarTema(String tema) {
        temas[this.dimL] = tema;
        this.dimL++;
    }
    
    public void actuar() {
        for (int i = 0; i < dimL ; i++) {
            System.out.println("y ahora tocaremos…" + temas[i]);
        }
    }
    
    public abstract double calcularCosto();
 }
