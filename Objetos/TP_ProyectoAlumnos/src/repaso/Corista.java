/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Corista extends Persona {
    private int tonoFundamental;
    
    public Corista(String unnombre, int undni, int unaedad, int tonoFundamental) {
        super(unnombre, undni, unaedad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    
}
