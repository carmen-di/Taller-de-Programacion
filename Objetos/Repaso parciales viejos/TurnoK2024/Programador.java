/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Programador {
    private String nombre;
    private int dni;
    private double sueldo;
    private int cantLineas;
    private String lenguajePref;
    
    public Programador(String nombre, int DNI, double sueldoBasico, int lineasCodigo, String lenguajePref) {
        this.nombre = nombre;
        this.dni = DNI;
        this.sueldo = sueldoBasico;
        this.cantLineas = lineasCodigo;
        this.lenguajePref = lenguajePref;
    }
    
    public double calcularSueldo() {
        double sueldoFinal = this.sueldo;
        if (cantLineas > 200) {
            sueldoFinal += 50000;
        }
        return sueldoFinal;
    }
   
    public void aumentarSueldo(double aumento){
        sueldo += aumento;
    }
    
    public String toString() {
        String aux = nombre + ", " + dni + ", " + lenguajePref + ", " + this.calcularSueldo()+ "\n";
        return aux;
    }
}
