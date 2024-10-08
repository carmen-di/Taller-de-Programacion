/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoE2023;

public class Digital extends Banco{
    private String web;
    
    public Digital(String nombre, int cantEmpleados, int dimF, String web) {
        super(nombre, cantEmpleados, dimF);
        this.web = web;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }
    
    public boolean puedeRecibirTarjeta(int cbu) {
        boolean pude = false;
        Cuenta cuenta = super.obtenerCuenta(cbu);
        if (cuenta != null && cuenta.getMoneda().equals("Pesos") && cuenta.getMonto() > 100000) {
            pude = true;
        }
        return pude;
    }
}
