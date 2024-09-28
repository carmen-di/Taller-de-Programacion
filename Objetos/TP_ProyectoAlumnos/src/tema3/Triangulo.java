/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

public class Triangulo {
    private  double ladoA, ladoB, ladoC;
    private String colorR;
    private String colorL;

    public Triangulo(double ladoa, double ladob, double ladoc, String colorr, String colorl) {
        this.ladoA = ladoa;
        this.ladoB = ladob;
        this.ladoC = ladoc;
        this.colorR = colorr;
        this.colorL = colorl;
    }

    public Triangulo() {
    
    }
    
    // métodos get# y set#
    public double getLadoA() {
        return ladoA;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
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
    
    // método calcularPerimetro
    public double perimetro() {
        return (ladoA + ladoB +ladoC);
    }
    
    // método calcularArea
    public double area() {
        double s = (ladoA + ladoB + ladoC) / 2;
        return (Math.sqrt(s*(s - ladoA)*(s - ladoB)*(s - ladoC)));
    }
}
