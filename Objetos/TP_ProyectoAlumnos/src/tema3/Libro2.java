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
public class Libro2 {
   private String titulo;
   private Autor autor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    
    public Libro2(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor unAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         autor = unAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro2(){
   
    }

    public Libro2(String unTitulo, String unaEditorial, Autor unAutor, String unISBN) {
        titulo = unTitulo;
        editorial = unaEditorial;
        añoEdicion = 2015;
        autor = unAutor;
        ISBN = unISBN;
        precio = 100;
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }

    public Autor getAutor() {
        return autor;
    }
  
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }
   
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + autor.getNombre()+ " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
}
