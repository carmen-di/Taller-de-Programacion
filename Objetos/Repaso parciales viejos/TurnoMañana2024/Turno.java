/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Turno {
    private String nombreDocente;
    private double sueldo;
    private double costoCuota;
    private Alumno alumnos [];
    private int dimF;
    private int dimL;
    
    
    public Turno(double unCostoCuota, double unSueldo, String unNombreDocente, int dimF){
        this.costoCuota = unCostoCuota;
        this.sueldo = unSueldo;
        this.nombreDocente = unNombreDocente;
        this.dimF = dimF;
        this.alumnos = new Alumno [this.dimF];
        this.dimL = 0;
    }
    
    
    public void agregarAlumno(Alumno alumno){
        if (dimL < dimF){
            alumnos[dimL] = alumno;
            dimL++;
        }
    }
    
    public double recaudacion(){
        double aux= this.costoCuota * dimL;
        aux= aux - sueldo;
        return aux;
    }
    
    public String toString(){
        String aux= "";
        aux = "Docente " + this.nombreDocente;
        for (int i = 0; i < dimL; i++) {
            aux+= " Alumno " + (i+1)+": " + alumnos[i].toString();
        }
        aux+= "";
        return aux;
        
    }
}
