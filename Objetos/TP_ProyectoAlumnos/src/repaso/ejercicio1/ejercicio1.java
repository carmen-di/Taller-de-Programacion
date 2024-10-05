/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;
import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        System.out.println("Nombre y codigo del proyecto: ");
        String proy = Lector.leerString(); 
        int cod = Lector.leerInt(); 
        System.out.println("Nombre del director del proyecto: ");
        String director = Lector.leerString(); 
        Proyecto p1 = new Proyecto(proy, cod, director);
        
        System.out.println("Investigador 1: nombre y apellido, categoría(1-5), ocupación.");
        String nom = Lector.leerString(); 
        String ocup= Lector.leerString(); 
        Investigador i1 = new Investigador(nom, 3, ocup); 
        System.out.println("Investigador 2: nombre y apellido, categoría(1-5), ocupación.");
        nom = Lector.leerString(); 
        ocup= Lector.leerString();          
        Investigador i2 = new Investigador(nom, 5, ocup);
        System.out.println("Investigador 3: nombre y apellido, categoría(1-5), ocupación.");
        nom = Lector.leerString(); 
        ocup= Lector.leerString();          
        Investigador i3 = new Investigador(nom, 5, ocup);
        
        p1.agregarInvestigador(i1);
        p1.agregarInvestigador(i2);
        p1.agregarInvestigador(i3);
        
        System.out.println("Investigador 1 Subsidio 1 , monto solicitado y motivo: ");
        double monto = Lector.leerDouble();
        String motivo = Lector.leerString(); 
        Subsidio s1 = new Subsidio(monto,motivo); 
        System.out.println("Investigador 1 Subsidio 2 , monto solicitado y motivo: ");
        monto = Lector.leerDouble();
        motivo = Lector.leerString();        
        Subsidio s2 = new Subsidio(monto, motivo); 
        
        i1.agregarSubsidio(s1);
        i1.agregarSubsidio(s2);

        System.out.println("Investigador 2 Subsidio 1 , monto solicitado y motivo: ");
        monto = Lector.leerDouble();
        motivo = Lector.leerString();                
        Subsidio s3 = new Subsidio(monto, motivo);
        System.out.println("Investigador 2 Subsidio 2 , monto solicitado y motivo: ");
        monto = Lector.leerDouble();
        motivo = Lector.leerString();                
        Subsidio s4 = new Subsidio(monto, motivo); 
        
        i2.agregarSubsidio(s3);
        i2.agregarSubsidio(s4);
        
        System.out.println("Investigador 2 Subsidio 1 , monto solicitado y motivo: ");
        monto = Lector.leerDouble();
        motivo = Lector.leerString();                
        Subsidio s5 = new Subsidio(monto, motivo);
        System.out.println("Investigador 2 Subsidio 2 , monto solicitado y motivo: ");
        monto = Lector.leerDouble();
        motivo = Lector.leerString();                
        Subsidio s6 = new Subsidio(monto, motivo); 
        
        i2.agregarSubsidio(s5);
        i2.agregarSubsidio(s6);
        
        p1.otorgarTodos(i2.getNomCompleto());
        
        System.out.println(p1.toString());
    }
    
}
