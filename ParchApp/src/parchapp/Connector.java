/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parchapp;

import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;


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
            //System.out.println("Se generó la conexion. ");
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
            JOptionPane.showMessageDialog(null,"Producto ingresado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void insertarCliente(Cliente cliente){
        String cadena = "{CALL insertarCliente(?,?,?,?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, cliente.getCedula());
            cs.setString(2, cliente.getRuc());
            cs.setString(3, cliente.getPasaporte());
            cs.setString(4, cliente.getNombres());
            cs.setString(5, cliente.getApellidos());
            cs.setString(6, cliente.getDireccion());
            cs.setString(7, cliente.getEmail());
            cs.setString(8, cliente.getTipoCliente());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Cliente ingresado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
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
    
    public ArrayList<String> cargarProveedores(){
        ArrayList<String> proveedores = new ArrayList();
        String cadena = "{CALL ListarProveedores()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                proveedores.add(rs.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return proveedores;
    }
    
    public ArrayList<String> cargarPaises(){
        ArrayList<String> paises = new ArrayList();
        String cadena = "{CALL CargarPaises()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                paises.add(rs.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return paises;
    }
    
    public ArrayList<String> cargarCiudades(String pais){
        ArrayList<String> ciudades = new ArrayList();
        String cadena = "{CALL CargarCiudadesPorPais(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, pais);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                ciudades.add(rs.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return ciudades;
    }
    
    public int obtenerIdPais(String nomPais){
        String cadena = "{? = CALL obtenerIdPais(?)}";
        int salida = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.registerOutParameter(1, java.sql.Types.INTEGER);
            cs.setString(2, nomPais);
            cs.execute();
            salida = cs.getInt(1);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        System.out.println("IdPais: " + salida);
        return salida;
    }
    
    public int obtenerIdCiudad(String nomPais,String nomCiudad){
        System.out.println("nomPais: "+nomPais + " nomCiudad: "+nomCiudad);
        String cadena = "{? = CALL obtenerIdCiudad(?,?)}";
        int salida = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.registerOutParameter(1, java.sql.Types.INTEGER);
            cs.setString(2, nomCiudad);
            cs.setString(3, nomPais);
            cs.execute();
            salida = cs.getInt(1);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        System.out.println("IdCiudad: " + salida);
        return salida;
    }
    
    public void insertarProveedor(Proveedor proveedor){
        String cadena = "{CALL insertarProveedor(?,?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, proveedor.getNombreProveedor());
            cs.setString(2, proveedor.getTelefono());
            cs.setString(3, proveedor.getEmail());
            cs.setString(4, proveedor.getDireccion());
            cs.setInt(5, proveedor.getPais());
            cs.setInt(6, proveedor.getCiudad());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Proveedor ingresado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
}
