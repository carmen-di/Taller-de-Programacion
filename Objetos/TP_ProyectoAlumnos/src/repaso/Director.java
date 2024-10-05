/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Director extends Persona {
    private int antiguedad;
    
    public Director(String unnombre, int undni, int unaedad, int antiguedad) {
        super(unnombre, undni, unaedad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    
}
