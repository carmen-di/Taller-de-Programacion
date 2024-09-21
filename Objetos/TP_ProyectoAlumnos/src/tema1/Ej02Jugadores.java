
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] vector;
        
        //Paso 3: Crear el vector para 15 double 
        vector  = new double[15];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double suma = 0;
        double promedio;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        System.out.println("Ingrese la altura:");
        for (i = 0; i < 15; i++) {
            double num = Lector.leerDouble();
            vector[i] = num;
            suma = suma + vector[i];    
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        System.out.println("La altura promedio es: " +(promedio = suma/15));
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cant = 0;
        for (i = 0; i < 15; i++) {
            if (vector[i] > promedio) 
                cant = cant + 1;
        }
        
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores con altura mayor al promedio es: "+cant);
    
    }
}
