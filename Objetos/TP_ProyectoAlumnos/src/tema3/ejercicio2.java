/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author norai
 */
public class ejercicio2 {

    public static void main(String[] args) {
        Libro2 libro1= new  Libro2( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 new Autor("Herbert Schildt", "", ""), "978-0071809252", 21.72);
        Libro2 libro= new Libro2("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               new Autor("John Horton", "", ""), "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro.toString());
        System.out.println(libro1.getAutor().toString());
        System.out.println("Precio del libro2: " +libro.getPrecio());
        System.out.println("Año edición del libro2: " +libro.getAñoEdicion());
        Libro2 libro3= new Libro2();
    }
    
}
