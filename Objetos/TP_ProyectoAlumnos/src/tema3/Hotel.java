/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private Habitacion[] habitaciones;
    private int cantHabitaciones;
    
    public Hotel (int N){        //PREGUNTAR VALORES ALEATORIO
        this.cantHabitaciones = N;
        this.habitaciones = new Habitacion[N];
        
        for (int i = 0; i < this.cantHabitaciones; i++){
            this.habitaciones[i] = new Habitacion(GeneradorAleatorio.generarDouble(6001)+2000);
        }
    }

    public Habitacion[] getCantHabitaciones() {
        return habitaciones;
    }
    
    // - Ingresar un cliente C en la habitación número X
    public void ingresarCliente(Cliente cliente, int num) {
        if (!this.habitaciones[num].getOcupada()) {
            this.habitaciones[num].setOcupada(true);
            this.habitaciones[num].setCliente(cliente);       
        }
    }
    
    public void aumentarPrecio(double num) {
        int i;
        for (i = 0; i < cantHabitaciones; i++) {
            this.habitaciones[i].aumentarPrecio(num);
        }
    }
    
    @Override
    public String toString(){
        int i; String aux="";
        for (i = 0; i < cantHabitaciones; i++) {
            aux=aux+"Habitacion "+ (i+1) +"  "+ habitaciones[i].toString();
        }
        return aux;
    }
}
