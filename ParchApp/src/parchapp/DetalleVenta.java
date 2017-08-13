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
public class DetalleVenta {
    private int idDetalleVenta;
    private OrdenVenta idOrdenVenta;
    private Producto idProducto;
    private float precio;
    private int cantidad;

    public DetalleVenta(int idDetalleVenta, OrdenVenta idOrdenVenta, Producto idProducto, float precio, int cantidad) {
        this.idDetalleVenta = idDetalleVenta;
        this.idOrdenVenta = idOrdenVenta;
        this.idProducto = idProducto;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }

    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
    }

    public OrdenVenta getIdOrdenVenta() {
        return idOrdenVenta;
    }

    public void setIdOrdenVenta(OrdenVenta idOrdenVenta) {
        this.idOrdenVenta = idOrdenVenta;
    }

    public Producto getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Producto idProducto) {
        this.idProducto = idProducto;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
