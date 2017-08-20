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
public class Pais {
    private int IdPais;
    private String NombrePais;

    public Pais(int IdPais, String NombrePais) {
        this.IdPais = IdPais;
        this.NombrePais = NombrePais;
    }

    public int getIdPais() {
        return IdPais;
    }

    public void setIdPais(int IdPais) {
        this.IdPais = IdPais;
    }

    public String getNombrePais() {
        return NombrePais;
    }

    public void setNombrePais(String NombrePais) {
        this.NombrePais = NombrePais;
    }
    
}
