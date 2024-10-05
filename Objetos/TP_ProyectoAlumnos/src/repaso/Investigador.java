/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Investigador {
    private String nomCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios = new Subsidio[5];
    private int totalSub = 0;
    
    public Investigador(String unnomCompleto, int unacategoria, String unaespecialidad) {
        this.nomCompleto = unnomCompleto;
        this.categoria = unacategoria;
        this.especialidad = unaespecialidad;
    }
    public void agregarSubsidio(Subsidio unSubsidio) {
        if (totalSub < 5) {
            subsidios[totalSub] = unSubsidio;
            totalSub++;
            System.out.println("Se ha agregado un nuevo subsidio");
        }
        else {
            System.out.println("Se ha alcanzado el máximo de subsidios permitidos");
        }
    }
    
    public double montoTotalSubsidiosOtorgados() {
        double total = 0;
        for (int i = 0; i < totalSub; i++) {
            if (subsidios[i].isOtorgado() == true)
                total = total + subsidios[i].getMonto();
        }
        return total;
    }
    
    public void otorgarSubsidios() {
        for (int i = 0; i < totalSub; i++) {
            subsidios[i].setOtorgado(true);
        }
    }
    
    public String getNomCompleto() {
        return nomCompleto;
    }

    public void setNomCompleto(String nomCompleto) {
        this.nomCompleto = nomCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public int getTotalSub() {
        return totalSub;
    }

    public void setTotalSub(int totalSub) {
        this.totalSub = totalSub;
    }
    
    
}
