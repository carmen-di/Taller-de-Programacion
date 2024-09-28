/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Estante {
    private Libro2[] libros;
    private int dimL;  // sería la cantidad
    private int dimF;
    
    public Estante() {
        this.dimL = 0;
        this.dimF = 20;
        this.libros = new Libro2[dimF];
    }
    
    public int getDimL() {
        return dimL;
    }
    
    // (i) devolver la cantidad de libros que almacenados
    public int cantAlmacenada() {
        return getDimL();
    }
    
    // (ii) devolver si el estante está lleno
    public boolean estaLleno() {
        return (dimL == dimF);
    }
    
    // (iii) agregar un libro al estante
    public void agregarLibro(Libro2 nuevoLibro) {
        if (dimL < dimF) {
            libros[dimL] = nuevoLibro;
            dimL++;
        } else
            System.out.println("Estante lleno");
    }
    
    // (iv) devolver el libro con un título particular que se recibe.
    public Libro2 buscarLibro(String nombre) {
        int i = 0;
        while (i < dimL && !(nombre.equals(libros[i].getTitulo()))) {
            i++;
        }
        if (i < dimL && nombre.equals(libros[i].getTitulo())) {  // Verificamos que se encontró el libro
            return libros[i];
        } else {
            return null;  // Si no se encontró el libro
        }
    }

}
