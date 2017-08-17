/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parchapp;

import java.sql.*;


/**
 *
 * @author Usuario
 */
public class Connector {
    Connection conn = null;
    Statement stm = null;
    //Cambiar la parte '//127.0.0.1:3306/' por la ruta donde esté creada su instancia de mysql
    static final String url = "jdbc:mysql://127.0.0.1:3306/tiretec";
    static final String user = "root";
    static final String pswd = "1234";

    public Connector() {
    }
    
    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, user, pswd);
            System.out.println("Se generó la conexion. ");
        } catch (Exception ex) {
            System.out.println("error occured " + ex.toString());
            System.out.println("No se generó la conexion. ");
        }
        return conn;
    }
    
    public void insertarProducto(Producto producto){
        String cadena = "{CALL insertarProducto(?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, producto.getNombreProducto());
            cs.setFloat(2, producto.getPrecioPublico());
            cs.setFloat(3, producto.getPrecioMayorista());
            cs.setString(4, producto.getDescripcion());
            cs.executeQuery();
            System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public boolean iniciarSesion(Usuario usuario){
        String cadena = "{? = CALL acceder(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.registerOutParameter(1, java.sql.Types.VARCHAR);
            cs.setString(2, usuario.getUsuario());
            cs.setString(3, usuario.getContraseña());
            cs.execute();
            String output = cs.getString(1);
            if(!output.equals("")) return true;
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }
}
