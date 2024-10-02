/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class Trabajador extends Persona {
    public String trabajo;

    public Trabajador(String unNombre, int unDNI, int unaEdad, String trabajo) {
        super(unNombre, unDNI, unaEdad);
        setTrabajo(trabajo);
    }
    
    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }
    
    public String toString() {
        return super.toString() + " Soy " + getTrabajo() + ".";
    }
}
