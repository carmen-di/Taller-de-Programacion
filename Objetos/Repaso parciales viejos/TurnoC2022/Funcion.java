/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoCtema2;

public class Funcion {
    private String titulo;
    private String fecha;
    private String hora;
    private Butaca[][] sala;
    private int filas;
    private int columnas;
    
    public Funcion(String titulo, String fecha, String hora, int n, int m) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.filas = n;
        this.columnas = m;
        this.sala = new Butaca[n][m];
        inicializarSala();
    }
    
    public void inicializarSala() {
        for (int i = 0; i < this.filas; i++) {
            for (int j  = 0; j < this.columnas; j++) {
                this.sala[i][j] = new Butaca();
                this.sala[i][j].calcularPrecio(i);
                this.sala[i][j].descripcion(i, j);
            }
        }
    }
    
    public double ocuparButaca(int f, int b) {
        sala[f-1][b-1].ocupar();
        return sala[f - 1][b - 1].getPrecio();
    }
    
    public void desocuparFila(int f) {
        for (int i = 0; i < this.columnas; i++) {
            if (sala[f - 1][i].isOcupada() == true) {
                sala[f - 1][i].desocupar();
            }
        }
    }
    
    public String representarButacas() {
        String aux = "";
        for (int i = 0; i < this.filas; i++) {
            for (int j = 0; j < this.columnas; j++) {
                aux = aux + this.sala[i][j].toString() + "\n";
            }
        }
        return aux;
    }
    
    public String toString() {
        String aux = "Titulo: " + this.titulo + " fecha: " + this.fecha + " hora: " + this.hora;
        for (int i = 0; i < this.filas; i++) {
            aux += "\n Fila: " + (i + 1);
            for (int j = 0; j < this.columnas; j++) {
                aux += "\n Butaca: " + this.sala[i][j].toString(); // Imprimir directamente la butaca correspondiente
            }
        }
        return aux;
    }
    
}
