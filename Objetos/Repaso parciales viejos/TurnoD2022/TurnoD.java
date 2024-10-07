/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2022;

public class TurnoD {

    public static void main(String[] args) {
        Presencial p = new Presencial(2023, 4, 15);
        Distancia d = new Distancia(2024, 6, "Zoom");
        
        Alumno a1 = new Alumno(345, "Azul");
        Alumno a2 = new Alumno(808, "Manuel");
        Alumno a3 = new Alumno(427, "Sol");
        Alumno a4 = new Alumno(383, "Romina");
        Alumno a5 = new Alumno(401, "Felipe");
        
        p.agregarAlumno(a2);
        p.agregarAlumno(a5);
        p.incrementarAsistencia(401);
        p.incrementarAsistencia(401);
        p.incrementarAsistencia(401);
        p.incrementarAsistencia(401);
        p.aprobarAutoevaluacion(401);
        
        
        d.agregarAlumno(a1);
        d.agregarAlumno(a3);
        d.incrementarAsistencia(345);
        d.aprobarAutoevaluacion(345);
        d.incrementarAsistencia(427);
        d.aprobarAutoevaluacion(427);
        d.aprobarAutoevaluacion(427);
        d.aprobarAutoevaluacion(427);
        
        System.out.println("Cantidad de alumnos que pueden rendir presencial: " + p.cantidadDeAlumnosQuePuedenRendir());
        System.out.println("Cantidad de alumnos que pueden rendir a distancia: " + d.cantidadDeAlumnosQuePuedenRendir());
        
    }
    
}
