/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Empresa {
    private String nombre;
    private Lider programadorLider;
    private Programador[] programadores;
    private int dimL;
    private int dimF;
    
    public Empresa(String nombre, Lider programadorlider, int n) {
        this.nombre = nombre;
        this.programadorLider = programadorlider;
        this.dimF = n;
        programadores = new Programador[dimF];
        this.dimL = 0;
    }
    
    public void agregarProgramador(Programador unProgramador) {
        if (dimL < dimF) {
            programadores[dimL] = unProgramador;
            dimL++;
        }
    }
    
    public double calcularMontoTotal() {
        double montoTotal = programadorLider.calcularSueldo();
        for (int i = 0; i < dimL; i++) {
            montoTotal += programadores[i].calcularSueldo();
        }
        return montoTotal;
    }
    
    public void aumentarSueldo(double m) {
        programadorLider.aumentarSueldo(m);
        for (int i = 0; i < dimL; i++) {
            programadores[i].aumentarSueldo(m);
        }
    }
    
    public String toString() {
        String aux = "Empresa: " + nombre + "\n";
        aux += programadorLider.toString();
        for (int i = 0; i < dimL; i++) {
            aux+= "Programador: " + (i+1) +" "+ programadores[i].toString();
        }
        aux += "Monto total en sueldos a abonar por la empresa " + this.calcularMontoTotal();
        return aux;
    }
}
