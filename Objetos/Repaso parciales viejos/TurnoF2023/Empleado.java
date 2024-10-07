/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoF2023;

public abstract class Empleado {
    private String nombre;
    private int dni;
    private int añoIngreso;
    private double sueldoBasico;
    
    public Empleado(String nombre, int dni, int añoIngreso, double sueldoBasico) {
        this.nombre = nombre;
        this.dni = dni;
        this.añoIngreso = añoIngreso;
        this.sueldoBasico = sueldoBasico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getAñoIngreso() {
        return añoIngreso;
    }

    public void setAñoIngreso(int añoIngreso) {
        this.añoIngreso = añoIngreso;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    public double sueldoACobrar() {
        double sueldo = this.sueldoBasico;
        if ((2023 - this.añoIngreso) > 20) {
            sueldo += this.sueldoBasico * 0.10;
        }
        return sueldo;
    }
    
    public String toString() {
        return " Nombre: " + this.nombre + " Dni: " + dni + " sueldo a cobrar: $" + sueldoACobrar();
    }
    
}
