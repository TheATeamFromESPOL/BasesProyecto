/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parchapp;

/**
 *
 * @author Usuario
 */
public class Producto {
    private int idProducto;
    private String nombreProducto;
    private float precioPublico;
    private float precioMayorista;
    private String descripcion;

    public Producto() {
        idProducto = 0;
        nombreProducto = "";
        precioPublico = 0;
        precioMayorista = 0;
        descripcion = "";
    }
    
    public Producto(int idProducto, String nombreProducto, float precioPublico, float precioMayorista, String descripcion) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.precioPublico = precioPublico;
        this.precioMayorista = precioMayorista;
        this.descripcion = descripcion;
    }

    public Producto(String nombreProducto, float precioPublico, float precioMayorista, String descripcion) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.precioPublico = precioPublico;
        this.precioMayorista = precioMayorista;
        this.descripcion = descripcion;
    }
    
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public float getPrecioPublico() {
        return precioPublico;
    }

    public void setPrecioPublico(float precioPublico) {
        this.precioPublico = precioPublico;
    }

    public float getPrecioMayorista() {
        return precioMayorista;
    }

    public void setPrecioMayorista(float precioMayorista) {
        this.precioMayorista = precioMayorista;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
