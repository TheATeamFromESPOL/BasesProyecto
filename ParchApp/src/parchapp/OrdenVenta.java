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
public class OrdenVenta {
    private int idOrdenVenta;
    private int idCliente;
    private float totalVenta;
    private Date fecha;
    private Time hora;

    public OrdenVenta(int idOrdenVenta, int idCliente, float totalVenta, Date fecha, Time hora) {
        this.idOrdenVenta = idOrdenVenta;
        this.idCliente = idCliente;
        this.totalVenta = totalVenta;
        this.fecha = fecha;
        this.hora = hora;
    }

    public int getIdOrdenVenta() {
        return idOrdenVenta;
    }

    public void setIdOrdenVenta(int idOrdenVenta) {
        this.idOrdenVenta = idOrdenVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public float getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(float totalVenta) {
        this.totalVenta = totalVenta;
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
