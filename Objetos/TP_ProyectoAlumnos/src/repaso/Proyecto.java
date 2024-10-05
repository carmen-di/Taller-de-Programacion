/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador[] investigadores = new Investigador[50];
    private int totalInvest = 0;
    
    public Proyecto(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        if (totalInvest < 50) {
            investigadores[totalInvest] = unInvestigador;
            totalInvest++; 
            System.out.println("Se ha agreado un investigador al proyecto"); 
        } 
        else
            System.out.println("proyecto completo. No se aceptan más investigadores.");
    }
    
    public double dineroTotalOtorgado() {
        double total = 0;
        for (int i = 0; i < totalInvest; i++) {
            total = total + investigadores[i].montoTotalSubsidiosOtorgados();
        }
        return total;
    }
    
    public void otorgarTodos(String nombre_completo) {
        boolean ok = false; int pos = 0; 
        while ((!ok) && (pos < totalInvest)){
            if (investigadores[pos].getNomCompleto().equals(nombre_completo)){
                ok = true; 
                investigadores[pos].otorgarSubsidios();
            }
            pos++;
        } 
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getTotalInvest() {
        return totalInvest;
    }
    
    public String toString() {
        int i;
        System.out.println();
        String aux = "Proyecto " + nombre +"\n"+ "codigo:" + codigo +"\n" +"director:" + director + "\n"+ "dinero otorgado en subsidios: "+dineroTotalOtorgado();
        for (i = 0; i < totalInvest; i++) {
            aux = aux+"\n" +"Investigador: "+ (i+1) +"\n"+ investigadores[i].getNomCompleto()+ "\n"+ "especialidad: " 
                    + investigadores[i].getEspecialidad()+ "\n"+ "monto total otorgado: "
                    + investigadores[i].montoTotalSubsidiosOtorgados();
        }
        return aux;        
    }
    
}