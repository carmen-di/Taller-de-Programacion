/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class Entrenadores extends Empleado {
    private int cantCampeonatos;
    
    public Entrenadores(String nom, double sueldo, int antiguedad, int ganados){
      super (nom, sueldo, antiguedad);
      setCantCampeonatos(ganados);
    }

    public double calcularEfectividad() {
        return (getCantCampeonatos() / super.getAntiguedad());
    }
    
    public double calcularSueldoACobrar() {
        double sueldoBasico = super.getSueldoBasico();
        int campeonatos = getCantCampeonatos();
        
        if ((campeonatos >= 1) && (campeonatos <= 4)) {
            return sueldoBasico + 5000;
        }
        else 
            if ((campeonatos >= 5) && (campeonatos <= 10)){
               return sueldoBasico + 30000;
            }
            else 
                if (campeonatos > 10){
                    return sueldoBasico + 50000;
                }
        return sueldoBasico;
    }
    
    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
}
