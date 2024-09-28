/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;

public class ejercicio3 {

    public static void main(String[] args) {
        Estante e = new Estante();
        
        for (int i = 0; i < 5; i++) {
            // Crear una nueva instancia de Libro y Autor en cada iteración
            Libro2 libro = new Libro2();
            Autor autor = new Autor();

            System.out.println("\nIngrese el título del libro número " + (i + 1));
            libro.setTitulo(Lector.leerString());

            System.out.println("Ingrese el nombre del autor del libro número " + (i + 1));
            autor.setNombre(Lector.leerString());
            System.out.println("Ingrese la biografía del autor del libro número " + (i + 1));
            autor.setBiografia(Lector.leerString());
            System.out.println("Ingrese el origen del autor del libro número " + (i + 1));
            autor.setOrigen(Lector.leerString());
            libro.setAutor(autor);  // Asignar el autor al libro

            System.out.println("Ingrese la editorial del libro número " + (i + 1));
            libro.setEditorial(Lector.leerString());
            System.out.println("Ingrese el ISBN del libro número " + (i + 1));
            libro.setISBN(Lector.leerString());
            System.out.println("Ingrese el año de edición del libro número " + (i + 1));
            libro.setAñoEdicion(Lector.leerInt());
            System.out.println("Ingrese el precio del libro número " + (i + 1));
            libro.setPrecio(Lector.leerDouble());

            // Agregar el libro al estante
            e.agregarLibro(libro);
        }

        // Buscar e informar el autor del libro "Mujercitas"
        System.out.println("Buscando el autor del libro 'Mujercitas'...");
        Libro2 autorMujercitas = e.buscarLibro("Mujercitas");
        System.out.println(autorMujercitas);
    }
    
}
