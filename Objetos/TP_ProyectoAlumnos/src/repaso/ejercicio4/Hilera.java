/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Hilera extends Coro {
    private Corista[][] matriz;
    private int dimF;
    private int dimC;
    private int filaLlena;
    private int dimL;
    
    
    public Hilera(Director direc, String nom, int dimF, int dimC) {
        super(direc, nom, dimF);
        this.matriz = new Corista[dimF][dimC];
        this.dimF = dimF;
        this.dimC = dimC;
        this.filaLlena = 0;
        this.dimL = 0;
    }
    
}
