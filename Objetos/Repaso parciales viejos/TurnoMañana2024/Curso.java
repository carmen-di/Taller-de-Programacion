/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class Curso {
    private String descripcion;
    private Turno online;
    private Turno presencial;
    
    public Curso(String unaDescripcion, Turno turnoOnline, Turno turnoPresencial){
        this.descripcion = unaDescripcion;
        this.online = turnoOnline;
        this.presencial = turnoPresencial;
    }
    
    public void agregarAlumno(Alumno alumno){
        if (alumno.getLugarResidencia().equals("La Plata")){
            presencial.agregarAlumno(alumno);
        }
        else{
            online.agregarAlumno(alumno);
        }
    }
    
    public double gananciaMensual(){
        double aux = online.recaudacion() + presencial.recaudacion();
        return aux;
    }
    
    
    public boolean esRentable(){
        return this.gananciaMensual() > 800000;       
    }
    
    public String toString(){
        String aux= "Descripcion "+ this.descripcion + ". Ganancia mensual neta del curso "+ this.gananciaMensual()+ "\n";
        aux+= "Turno Online: " + online.toString() + "\nTurno Presencial: " + presencial.toString();
        return aux;
    }
}
