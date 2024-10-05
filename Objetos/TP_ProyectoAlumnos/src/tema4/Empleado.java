/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;
    
    public Empleado(String unNombre, double sueldo, int antiguedad) {
        setNombre(unNombre);
        setSueldoBasico(sueldo);
        setAntiguedad(antiguedad);
    }

    public abstract double calcularEfectividad();
    
    public double sueldoBase() {
        return this.getSueldoBasico() + ((this.getSueldoBasico()* 0.10)*this.getAntiguedad());
    }
    
    public abstract double calcularSueldoACobrar();
    
    public String toString() {
        return "Nombre: " + getNombre() + " , sueldo a cobrar: " + this.calcularSueldoACobrar() + " $ " + 
                " , efectividad: " + this.calcularEfectividad();
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
}