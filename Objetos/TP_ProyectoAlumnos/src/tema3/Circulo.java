/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Circulo {
    private double radio;
    private String colorR;
    private String colorL;
    
    public Circulo(double radio, String colorr, String colorl) {
        this.radio = radio;
        this.colorR = colorr;
        this.colorL = colorl;
    }

    public Circulo(){
        
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorR() {
        return colorR;
    }

    public void setColorR(String colorR) {
        this.colorR = colorR;
    }

    public String getColorL() {
        return colorL;
    }

    public void setColorL(String colorL) {
        this.colorL = colorL;
    }
    
    public double perimetro() {
        return (2 * Math.PI * radio);
    }
    
    public double area(){
        return (Math.PI*(radio * radio));
    }
}
