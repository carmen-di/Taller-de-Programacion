/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double unRadio, String uncolorR, String uncolorL) {
        super(uncolorR,uncolorL);
        setRadio(unRadio);
    }
    
    public double calcularArea() {
        return (Math.PI*(getRadio() * getRadio()));
    }
    
    public double calcularPerimetro() {
        return (2 * Math.PI * getRadio());
    }
    
    public String toString(){
       String aux = super.toString() + 
                    " Radio: " + getRadio();
       return aux;
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
}
