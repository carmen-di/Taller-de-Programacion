/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoCtema2;
        
public class TurnoC2022 {

    public static void main(String[] args) {
        Funcion fun = new Funcion("La bella y la bestia", "9/12", "09:12", 2, 4);
        
        fun.ocuparButaca(1, 1);
        fun.ocuparButaca(1, 3);
        fun.ocuparButaca(2, 2);
        
        fun.desocuparFila(1);
        
        System.out.println(fun.toString());
        
    }
    
}
