/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2022;

public class Presencial extends Curso {
    private int aula;
    
    public Presencial(int año, int n, int unAula) {
        super(año, n);
        this.aula = unAula;
    }

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }
    
    public boolean puedeRendir(Alumno a)  {
        return (a.getAsistencias() >= 3);
    }
}
