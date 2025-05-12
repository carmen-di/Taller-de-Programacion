/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parciales2024;

public class parcial {

    public static void main(String[] args) {
        Lider l = new Lider("Leroy", 12345, 1000000, 100, "Java", 10, 3);
        
        Empresa e = new Empresa("Coca cola", l, 5);
        
        Programador p1 = new Programador("Pepe", 67890, 1000000, 200, "JavaScript");
        Programador p2 = new Programador("Juan", 11223, 1000000, 150, "Python");
        
        e.agregarProgramador(p1);
        e.agregarProgramador(p2);
        
        e.aumentarSueldo(30000);
        
        System.out.println(e.toString());
    }
    
}
