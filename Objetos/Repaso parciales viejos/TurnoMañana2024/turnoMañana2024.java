/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class turnoMañana2024 {

    public static void main(String[] args) {
        Turno tp = new Turno(1000000, 5, "Patrick", 2);
        Turno to = new Turno(20000000, 10, "John Doe", 1);
        
        Curso cursoIngles = new Curso("Open english", to, tp);
        
        Alumno alumno1 = new Alumno(12345, "Juan", "La Plata");
        Alumno alumno2 = new Alumno(2222, "Sofia", "La Plata");
        Alumno alumno3 = new Alumno(12121212, "Camila", "Un lugar");
        
        cursoIngles.agregarAlumno(alumno1);
        cursoIngles.agregarAlumno(alumno2);
        cursoIngles.agregarAlumno(alumno3);
        
        System.out.println(cursoIngles.toString());
        System.out.println("¿El curso de inglés es rentable? " + cursoIngles.esRentable());
    }
    
}
