/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.Lector;

public class ejercicio2 {

    public static void main(String[] args) {
        System.out.println("Ingrese el nombre del entrenador: ");
        String nom = Lector.leerString();

        System.out.println("Sueldo basico: ");
        double sueldo = Lector.leerDouble();
        
        System.out.println("Antiguedad: ");
        int antiguedad = Lector.leerInt();

        System.out.println("Cantidad de campeonatos ganados: ");
        int ganados = Lector.leerInt();

        Entrenadores e = new Entrenadores (nom, sueldo, antiguedad, ganados);

        System.out.println();
        System.out.println("Ingrese el nombre del jugador: ");
        String nom2 = Lector.leerString();

        System.out.println("Sueldo basico: ");
        double sueldo2 = Lector.leerDouble();
        
        System.out.println("Antiguedad: ");
        int antiguedad2 = Lector.leerInt();

        System.out.println("Cantidad de partidos jugados: ");
        int partidos = Lector.leerInt();

        System.out.println("Cantidad de goles anotados: ");
        int goles = Lector.leerInt();

        Jugadores j = new Jugadores (nom2, sueldo2, antiguedad2, partidos, goles);

        System.out.println();
        System.out.println(e.toString());
        System.out.println(j.toString());
    }
    
}
