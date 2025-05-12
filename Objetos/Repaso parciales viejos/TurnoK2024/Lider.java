/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Lider extends Programador {
    private int antiguedad;
    private int cantProyectos;
    
    public Lider(String nombre, int DNI, double sueldoBasico, int lineasCodigo, String lenguajePref, int antiguedad, int proyectos) {
        super(nombre, DNI, sueldoBasico, lineasCodigo, lenguajePref);
        this.antiguedad = antiguedad;
        this.cantProyectos = cantProyectos;
    }
    
    public double calcularSueldo() {
        double total = super.calcularSueldo();
        total += (this.antiguedad * 10000);
        total += (this.cantProyectos * 20000);
        return total;
    }
}
