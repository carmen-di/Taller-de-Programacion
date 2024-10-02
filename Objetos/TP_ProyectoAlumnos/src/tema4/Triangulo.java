/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class Triangulo extends Figura {
    private double ladoA;
    private double ladoB;
    private double ladoC;
    
    public Triangulo(double unladoA, double unladoB, double unladoC, String uncolorR, String uncolorL) {
        super(uncolorR, uncolorL);
        setLadoA(unladoA);
        setLadoB(unladoB);
        setLadoC(unladoC);
    }
    
    @Override
    public double calcularArea() {
        double s = (getLadoA() + getLadoB() + getLadoC()) / 2;
        return (Math.sqrt(s*(s - getLadoA())*(s - getLadoB())*(s - getLadoC())));
    }
    
    @Override
    public double calcularPerimetro() {
        return (getLadoA() + getLadoB() + getLadoC());
    }
    
    public String toString() {
        String aux = super.toString() + " Lado A: " + getLadoA() + " Lado B: " + getLadoB() + " Lado C: " + getLadoC();
        return aux;
    }
    
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
    
    
}
