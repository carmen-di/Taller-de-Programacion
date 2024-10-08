/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoE2023;

public abstract class Banco {
    private String nombre;
    private int cantEmpleados;
    private Cuenta[] vector;
    private int dimL;
    private int dimF;

    public Banco(String nombre, int cantEmpleados, int maxCuentas) {
        this.nombre = nombre;
        this.cantEmpleados = cantEmpleados;
        this.dimL = 0;
        this.dimF = maxCuentas;
        this.vector = new Cuenta[maxCuentas];
    }

    public boolean agregarCuenta(Cuenta unaCuenta) {
        if (dimL < dimF) {
            vector[dimL] = unaCuenta;
            dimL++;
            return true;
        } 
        return false;
    }
    
    public Cuenta obtenerCuenta(int cbu) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimL) && (!encontre)) {
            if ((vector[i]!=null) &&(vector[i].getCbu() == cbu)){
                encontre = true;
                return vector[i];
            }
            i++;
        }
        return null;
    }
    
    public void depositarDinero(int cbu, double monto) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimL) && (!encontre)) {
            if (vector[i].getCbu() == cbu) {
                encontre = true;
                vector[i].incrementarMonto(monto);
            }
            i++;
        }
    }
    
    public abstract boolean puedeRecibirTarjeta(int cbu);
        
}
