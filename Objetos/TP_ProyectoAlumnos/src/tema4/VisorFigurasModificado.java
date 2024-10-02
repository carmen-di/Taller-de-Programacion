/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura [] vector;

    public VisorFigurasModificado(){
        vector = new Figura [capacidadMaxima];
        guardadas = 0;
    }

    public void guardar(Figura f){ // f es la variable de tipo Figura 
        if (quedaEspacio()){
            vector[guardadas] = f;
            guardadas++;
        }
        else{
            System.out.println("No hay espacio para guardar la figura");
        }
    }

    public boolean quedaEspacio(){
        return getGuardadas() < capacidadMaxima;
    }

    public void mostrar(){
        for (int i = 0; i < guardadas; i++){
            System.out.println(vector[i].toString());
        }
    }
    
    public int getGuardadas() {
        return guardadas;
    }
}
