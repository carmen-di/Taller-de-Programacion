/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2022;

public abstract class Curso {
    private  int añoCursada;
    private Alumno[] alumnos;
    private int dimL;
    private int dimF;
    
    public Curso(int año, int n) {
        this.añoCursada = año;
        this.dimF = n;
        this.dimL = 0;
        this.alumnos = new Alumno[dimF];
    }
    
    public boolean agregarAlumno(Alumno a) {
        if (dimL < dimF) {
            alumnos[dimL] = a;
            dimL++;
            return true;
        } else {
            return false;
        }
    }
    
    public void incrementarAsistencia(int dni) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimL) && (!encontre)) {
            if (alumnos[i].getDni() == dni) {
                encontre = true;
                alumnos[i].incrementarAsistencia();
            } else {
                i++;
            }
        }
    }
    
    public void aprobarAutoevaluacion(int dni) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimL) && (!encontre)) {
            if (alumnos[i].getDni() == dni) {
                encontre = true;
                alumnos[i].incrementarAutoevaluacion();
            } else {
                i++;
            }
        }
    }
    
    public abstract boolean puedeRendir(Alumno a);
    
    public int cantidadDeAlumnosQuePuedenRendir() {
        int cant = 0;
        for (int i = 0; i < dimL; i++) {
            if (this.puedeRendir(alumnos[i])) {
                cant++;
            }
        }
        return cant;
    }
}
