/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(String unNombre, String unaBiografia, String unOrigen) {
        this.nombre = unNombre;
        this.biografia = unaBiografia;
        this.origen = unOrigen;
    }
    
    public Autor() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public String toString(){
        String aux;
        aux= nombre + " " + biografia + " " + origen;
       return ( aux);
    }
}
