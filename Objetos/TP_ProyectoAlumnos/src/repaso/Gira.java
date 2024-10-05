/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Gira extends Recital{
    private String nombre;
    private Fecha[] fechas;
    private int dimF, dimL;
    private int fechaActual;
     
    public Gira(String unNombre, int unCantemas, String nomGira, int cantFechas) {
        super(unNombre, unCantemas);
        this.nombre = nomGira;
        this.dimF = cantFechas;
        this.dimL = 0;
        this.fechaActual = 0;
        this.fechas = new Fecha[this.dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public int getFechaActual() {
        return fechaActual;
    }
    
    public void agregarFecha(Fecha f) {
        fechas[this.dimL] = f;
        dimL++;
    }
    
    @Override
    public void actuar() {
        System.out.println("Buenas noches …" + fechas[fechaActual].getCiudad());
        super.actuar();
        fechaActual++;
    }
    
    public double calcularCosto() {
        return (30000 * dimL);
    }
}
