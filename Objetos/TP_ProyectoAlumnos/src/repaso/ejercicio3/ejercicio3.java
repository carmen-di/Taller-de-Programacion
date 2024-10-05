/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;
import PaqueteLectura.Lector;

public class ejercicio3 {

    public static void main(String[] args) {
        System.out.println("Ingrese dia, contratante, motivo, banda, cantidad de temas");
        String dia = Lector.leerString();
        String contratante = Lector.leerString();
        String motivo =  Lector.leerString();       
        String banda = Lector.leerString();
        int cantidadTemas = Lector.leerInt();
        
        Evento e = new Evento(banda, cantidadTemas, motivo, contratante, dia);
        
        for (int i = 0; i < cantidadTemas; i++){
            System.out.println("Ingrese tema");
            String tema =  Lector.leerString();  
            e.agregarTema(tema);
        }
        
        System.out.println("Costo del Evento Ocasional " + e.calcularCosto());
        e.actuar();
        System.out.println();
        
        System.out.println("Ingrese nombre gira, banda, cantidad temas, cantidad fechas");
        String nombre =  Lector.leerString();
        banda =  Lector.leerString();
        cantidadTemas = Lector.leerInt();
        int cantidadFechas  = Lector.leerInt();

        Gira gira = new Gira(nombre, cantidadFechas, banda, cantidadTemas);
        
        for (int i = 0; i < cantidadTemas; i++){  //Preguntar porque se rompe
            System.out.println("Ingrese tema");
            String tema =  Lector.leerString();  
            gira.agregarTema(tema);
        }
        
        for (int i = 0; i < cantidadFechas ; i++){
            System.out.println("Ingrese fecha (ciudad, dia)");
            String ciudad =  Lector.leerString();  
            dia =  Lector.leerString();  
            Fecha f = new Fecha(ciudad,dia);
            gira.agregarFecha(f);
           
        }
        
        System.out.println("Costo de la Gira " + gira.calcularCosto());
    }
    
}
