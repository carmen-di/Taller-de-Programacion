/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoD2022;

public class Distancia extends Curso {
    private String link;
    
    public Distancia(int año, int n, String unLink) {
        super(año, n);
        this.link = unLink;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    public boolean puedeRendir(Alumno a)  {
        return (a.getCantAutoevaluaciones() >= 3) && (a.getAsistencias() >= 1);
    }
}
