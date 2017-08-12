/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parchapp;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Usuario
 */
public class OrdenCompra {
    private int idOrdenCompra;
    private Proveedor idProveedor;
    private float totalCompra;
    private Date fecha;
    private Time hora;

    public OrdenCompra(int idOrdenCompra, Proveedor idProveedor, float totalCompra, Date fecha, Time hora) {
        this.idOrdenCompra = idOrdenCompra;
        this.idProveedor = idProveedor;
        this.totalCompra = totalCompra;
        this.fecha = fecha;
        this.hora = hora;
    }

    public int getIdOrdenCompra() {
        return idOrdenCompra;
    }

    public void setIdOrdenCompra(int idOrdenCompra) {
        this.idOrdenCompra = idOrdenCompra;
    }

    public Proveedor getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(Proveedor idProveedor) {
        this.idProveedor = idProveedor;
    }

    public float getTotalCompra() {
        return totalCompra;
    }

    public void setTotalCompra(float totalCompra) {
        this.totalCompra = totalCompra;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }
    
}
