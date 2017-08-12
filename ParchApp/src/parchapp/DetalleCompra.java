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
public class DetalleCompra {
    private int idDetalleCompra;
    private OrdenCompra idOrdenCompra;
    private Producto idProducto;
    private float precio;
    private int cantidad;

    public DetalleCompra(int idDetalleCompra, OrdenCompra idOrdenCompra, Producto idProducto, float precio, int cantidad) {
        this.idDetalleCompra = idDetalleCompra;
        this.idOrdenCompra = idOrdenCompra;
        this.idProducto = idProducto;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public int getIdDetalleCompra() {
        return idDetalleCompra;
    }

    public void setIdDetalleCompra(int idDetalleCompra) {
        this.idDetalleCompra = idDetalleCompra;
    }

    public OrdenCompra getIdOrdenCompra() {
        return idOrdenCompra;
    }

    public void setIdOrdenCompra(OrdenCompra idOrdenCompra) {
        this.idOrdenCompra = idOrdenCompra;
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
