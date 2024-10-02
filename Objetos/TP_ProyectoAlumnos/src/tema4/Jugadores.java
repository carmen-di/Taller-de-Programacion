/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author norai
 */
public class Jugadores extends Empleado {
    private int partidosJugados;
    private int goles;
    
    public Jugadores(String nom, double sueldo, int antiguedad, int numPartidos, int numGoles) {
        super(nom, sueldo, antiguedad);
        setPartidosJugados(numPartidos);
        setGoles(numGoles);
    }
    
    public double calcularEfectividad() {
        return (getGoles() / getPartidosJugados());
    }
    
    public double calcularSueldoACobrar() {
        if (getGoles() / (double)getPartidosJugados() > 0.5) {
            return super.getSueldoBasico() * 2;
        } 
        else
            return super.getSueldoBasico();
    }
    
    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    
}
