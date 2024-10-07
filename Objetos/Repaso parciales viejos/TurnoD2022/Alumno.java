/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2022;

public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias;
    private int cantAutoevaluaciones;
    
    public Alumno(int dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
        this.asistencias = 0;
        this.cantAutoevaluaciones = 0;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public int getCantAutoevaluaciones() {
        return cantAutoevaluaciones;
    }

    public void setCantAutoevaluaciones(int cantAutoevaluaciones) {
        this.cantAutoevaluaciones = cantAutoevaluaciones;
    }
    
    public void incrementarAsistencia() {
        asistencias++;
    }
    
    public void incrementarAutoevaluacion() {
        cantAutoevaluaciones++;
    }
}
