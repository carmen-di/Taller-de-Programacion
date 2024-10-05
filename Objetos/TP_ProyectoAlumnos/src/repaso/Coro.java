/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public abstract class Coro {
    private String nombre;
    private Director director;
    private int diml;
    private int dimF; //DIMF
    
    public Coro(Director director, String nom, int dimF) {
        this.nombre = nom;
        this.director = director;
        this.diml = 0;
        this.dimF = dimF;
    }
    
    public String getNombre() {
        return nombre;
    }

    public Director getDirector() {
        return director;
    }
}
