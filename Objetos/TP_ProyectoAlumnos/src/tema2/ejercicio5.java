/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;

public class ejercicio5 {

    public static void main(String[] args) {
        int dimF = 20, dimL = 0;
        Partido[] vector = new Partido[dimF];
        
        System.out.println ("Ingrese el nombre del equipo visitante: ");
        String nomVisitante = Lector.leerString();
        while ((dimL < dimF) && !nomVisitante.equals("ZZZ")) {
            System.out.println ("Goles del equipo visitante: ");
            int golesVisitante = Lector.leerInt();

            System.out.println ("Ingrese el nombre del equipo local: ");
            String nomLocal = Lector.leerString(); 

            System.out.println ("Goles del equipo local: ");
            int golesLocal = Lector.leerInt();
            
            vector[dimL] = new Partido(nomLocal, nomVisitante, golesLocal, golesVisitante);
            dimL++;
            
            System.out.println ("Ingrese el nombre del equipo visitante: ");
            nomVisitante = Lector.leerString();
        }
        
        int cantRiver = 0, totalBoca = 0;
        for (int i = 0; i < dimL; i++) {
            if (vector[i].hayGanador() && vector[i].getGanador().equals("River")) {
                cantRiver++;
            }
            if (vector[i].getLocal().equalsIgnoreCase("Boca")) {
                totalBoca += vector[i].getGolesLocal();
            }
        }
        System.out.println("Cantidad de partidos que gano River: " + cantRiver);
        System.out.println("Total de goles que realizo Boca jugando de local: " +totalBoca);
    }
    
}
