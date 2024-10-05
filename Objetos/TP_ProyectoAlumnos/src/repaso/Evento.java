/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

public class Evento extends Recital{
    private String motivo;
    private String personaContrata;
    private String dia;

    public Evento(String unNombre, int unCantemas, String unmotivo, String unapersona, String undia) {
        super(unNombre, unCantemas);
        this.motivo = unmotivo;
        this.personaContrata = unapersona;
        this.dia = undia;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getPersonaContrata() {
        return personaContrata;
    }

    public void setPersonaContrata(String personaContrata) {
        this.personaContrata = personaContrata;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
    
    @Override
    public void actuar() {
        if (this.motivo.equals("beneficencia"))
            System.out.println("Recuerden colaborar con…" + personaContrata);
        else
            if (this.motivo.equals("ShowTv"))
                System.out.println("Saludos amigos televidentes");
            else
                System.out.println("Un feliz cumpleaños para…" + personaContrata);     
        super.actuar();
    }
    
    public double calcularCosto() {
        double costo = -1;
        if (this.motivo.equals("beneficencia"))
            costo = 0;
        else
            if (this.motivo.equals("ShowTv"))
                costo = 50000;
            else
                if (this.motivo.equals("privado"))
                    costo = 150000;
        return costo;
    }
}
