/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parchapp;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import parchapp.interfaz.Compra;


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
    static final String pswd = "675744";

    public Connector() {
    }
    
    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, user, pswd);
            //System.out.println("Se generó la conexion. ");
        } catch (Exception ex) {
            System.out.println("error occured " + ex.toString());
            System.out.println("No se generó la conexion. ");
            JOptionPane.showMessageDialog(null, "No se generó la conexion con la base de datos ","Mensaje del sistema",JOptionPane.ERROR_MESSAGE);
            System.exit(0);
        }
        return conn;
    }
    public void insertarCliente(Cliente cliente){
        String cadena = "{CALL insertarCliente(?,?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, cliente.getCedula());
            cs.setString(2, cliente.getNombres());
            cs.setString(3, cliente.getApellidos());
            cs.setString(4, cliente.getDireccion());
            cs.setString(5, cliente.getEmail());
            cs.setString(6, cliente.getTipoCliente());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Cliente ingresado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
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
    public ArrayList<String> top3(){
        ArrayList<String> top = new ArrayList();
        String cadena = "{CALL top3Clientes()}";
        try {
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            ResultSet rs = cs.executeQuery();
            
            while(rs.next()){
                top.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Connector.class.getName()).log(Level.SEVERE, null, ex);
        }
        return top;
    }
    public ArrayList<String> cargarProveedoresFiltro(String s){
        ArrayList<String> proveedores = new ArrayList();
        String cadena = "{CALL ListarProveedoresFiltro(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, s);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                proveedores.add(rs.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return proveedores;
    }
    public void cargarProveedores(JTable j1,DefaultTableModel dfm){
        ArrayList<Object[]> datos = new ArrayList<Object[]>();
        String cadena = "{CALL visualizarProveedores()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            ResultSet rs = cs.executeQuery();
            ResultSetMetaData rsm = rs.getMetaData();
            while(rs.next()){
                Object[] filas = new Object[rsm.getColumnCount()-1];
                for(int i = 0;i<rsm.getColumnCount()-1;i++){
                    filas[i]= rs.getObject(i+2);                                        
                }
                datos.add(filas);
            }
            for(int i=0;i<datos.size();i++){
                ArrayList<String> paisCiudad = nombrePaisCiudad((int)datos.get(i)[4], (int)datos.get(i)[5]);
                String query = "{CALL nombrePaisCiudad(?,?)}";
                datos.get(i)[4]=paisCiudad.get(0);                      
                datos.get(i)[5]=paisCiudad.get(1);
                dfm.addRow(datos.get(i));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public ArrayList<String> nombrePaisCiudad(int pais,int ciudad){
        ArrayList<String> datos = new ArrayList<>();
        String query = "{CALL nombrePaisCiudad(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1,pais);
            cs.setInt(2,ciudad);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                datos.add(rs.getString(1));
                datos.add(rs.getString(2));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return datos;    
    }
        
    public void cargarProducto(JTable j1,DefaultTableModel dfm){
        ArrayList<Object[]> datos = new ArrayList<Object[]>();
        String cadena = "{CALL visualizarProductos()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            ResultSet rs = cs.executeQuery();
            ResultSetMetaData rsm = rs.getMetaData();
            while(rs.next()){
                Object[] filas = new Object[rsm.getColumnCount()-1];
                for(int i = 0;i<rsm.getColumnCount()-1;i++){
                    filas[i]= rs.getObject(i+2);
                }
                datos.add(filas);
            }
            for(int i=0;i<datos.size();i++){
                 dfm.addRow(datos.get(i));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    public int ProductosConCadena(String s,DefaultTableModel dfm){
        ArrayList<Object[]> datos = new ArrayList<Object[]>();
        String query = "{CALL ProductosConCadena(?)}";
        int contador = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,s);
            ResultSet rs = cs.executeQuery();
            ResultSetMetaData rsm = rs.getMetaData();
            while(rs.next()){
                contador++;
                Object[] filas = new Object[rsm.getColumnCount()-1];
                for(int i = 0;i<rsm.getColumnCount()-1;i++){
                    filas[i]= rs.getObject(i+2);
                }
                datos.add(filas);
            }
            for(int i=0;i<datos.size();i++){
                 dfm.addRow(datos.get(i));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return contador;         
    }
    
    public int ProveedorConCadena(String s,DefaultTableModel dfm){
        ArrayList<Object[]> datos = new ArrayList<Object[]>();
        String query = "{CALL ProveedorConCadena(?)}";
        int contador = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,s);
            ResultSet rs = cs.executeQuery();
            ResultSetMetaData rsm = rs.getMetaData();
            while(rs.next()){
                contador++;
                Object[] filas = new Object[rsm.getColumnCount()-1];
                for(int i = 0;i<rsm.getColumnCount()-1;i++){
                    filas[i]= rs.getObject(i+2);
                }
                datos.add(filas);
            }
            for(int i=0;i<datos.size();i++){
                 dfm.addRow(datos.get(i));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return contador;         
    }
    
    public int ClienteConCadena(String s,DefaultTableModel dfm){
        ArrayList<Object[]> datos = new ArrayList<Object[]>();
        String query = "{CALL ClienteConCadena(?)}";
        int contador = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,s);
            ResultSet rs = cs.executeQuery();
            ResultSetMetaData rsm = rs.getMetaData();
            while(rs.next()){
                contador++;
                Object[] filas = new Object[rsm.getColumnCount()];
                for(int i = 0;i<rsm.getColumnCount();i++){
                    filas[i]= rs.getObject(i+1);
                }
                datos.add(filas);
            }
            for(int i=0;i<datos.size();i++){
                 dfm.addRow(datos.get(i));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return contador;         
    }
    
    public void cargarClientes(JTable j1,DefaultTableModel dfm){
        ArrayList<Object[]> datos = new ArrayList<Object[]>();
        String cadena = "{CALL visualizarClientes()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            ResultSet rs = cs.executeQuery();
            ResultSetMetaData rsm = rs.getMetaData();
            while(rs.next()){
                Object[] filas = new Object[rsm.getColumnCount()];                
                for(int i = 0;i<rsm.getColumnCount();i++){
                    filas[i]= rs.getObject(i+1);                    
                }
                datos.add(filas);
            }
            for(int i=0;i<datos.size();i++){
                 dfm.addRow(datos.get(i));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
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
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void insertarProd_Prov(int idProd, int idProv){
        if(relacionProductoProveedorExiste(idProd, idProv)) return;
        String cadena = "{CALL insertarProd_Prov(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setInt(1, idProd);
            cs.setInt(2, idProv);
            cs.executeQuery();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public int obtenerIdProducto(String nomProd){
        String cadena = "{? = CALL obtenerIdProducto(?)}";
        int salida = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.registerOutParameter(1, java.sql.Types.INTEGER);
            cs.setString(2, nomProd);
            cs.execute();
            salida = cs.getInt(1);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return salida;
    }
    
    public int obtenerIdProveedor(String nomProv){
        String cadena = "{? = CALL obtenerIdProveedor(?)}";
        int salida = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.registerOutParameter(1, java.sql.Types.INTEGER);
            cs.setString(2, nomProv);
            cs.execute();
            salida = cs.getInt(1);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return salida;
    }
    
    public void eliminarProductoPorNombre(String nombProd){
        String cadena = "{CALL eliminarProducto(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, nombProd);
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Producto eliminado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void eliminarProductoPorId(int idProd){
        String cadena = "{CALL eliminarProductoPorId(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setInt(1, idProd);
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Producto eliminado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public Producto encontrarProductoPorNombre(String nomProd){
        String cadena = "{CALL buscarProductoPorNombre(?)}";
        Producto prod = new Producto();
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, nomProd);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                prod.setNombreProducto(rs.getString(1));
                prod.setPrecioPublico(rs.getFloat(2));
                prod.setPrecioMayorista(rs.getFloat(3));
                prod.setDescripcion(rs.getString(4));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return prod;
    }
    
    public Producto encontrarProductoPorId(int idProd){
        String cadena = "{CALL buscarProductoPorId(?)}";
        Producto prod = new Producto();
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setInt(1, idProd);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                prod.setNombreProducto(rs.getString(1));
                prod.setPrecioPublico(rs.getFloat(2));
                prod.setPrecioMayorista(rs.getFloat(3));
                prod.setDescripcion(rs.getString(4));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return prod;
    }
    
    public void modificarProductoPorNombre(Producto p,String nomviejo){
        String query = "{CALL modificarProductoPorNombre(?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,nomviejo);
            cs.setString(2,p.getNombreProducto());
            cs.setFloat(3, p.getPrecioPublico());
            cs.setFloat(4, p.getPrecioMayorista());
            cs.setString(5,p.getDescripcion());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Producto modificado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void modificarProductoPorId(Producto p){
        String query = "{CALL modificarProductoPorId(?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1,p.getIdProducto());
            cs.setString(2,p.getNombreProducto());
            cs.setFloat(3, p.getPrecioPublico());
            cs.setFloat(4, p.getPrecioMayorista());
            cs.setString(5,p.getDescripcion());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Producto modificado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void cargarProductosACombo(String s,JComboBox combo){
        combo.removeAllItems();
        String query = "{CALL ListarProductoConCadena(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,s);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                combo.addItem((String)rs.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public String obtenerNombreProductoConId(int id){
        String query = "{CALL obtenerNombreProducto(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1,id);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                return(rs.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return "";
    }
    
    public void realizarCompra(OrdenCompra oc,ArrayList<DetalleCompra> detalle){
        String query = "{CALL insertarOrdenCompra(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1, oc.getIdProveedor());
            cs.setFloat(2, oc.getTotalCompra());
            cs.execute();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        query = "{CALL obtenerIdUltimaCompra()}";
        int idCompra = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            idCompra = cs.executeQuery().getInt(1);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        query = "{CALL insertarDetalleCompra(?,?,?,?)}";
        for(DetalleCompra d : detalle){
            try{
                CallableStatement cs = this.getConnection().prepareCall(query);
                cs.setInt(1,idCompra);
                cs.setInt(2, d.getIdProducto());
                cs.setFloat(3, d.getPrecio());
                cs.setFloat(4, d.getCantidad());
                cs.execute();
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
    }
     public Cliente encontrarCliente(String cedCliente){
        String cadena = "{CALL buscarCliente(?)}";
        Cliente cli = new Cliente();
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, cedCliente);
            ResultSet rs = cs.executeQuery(); 
            if(rs.isBeforeFirst()){ 
                rs.next();
                cli.setCedula(cedCliente);
                cli.setNombres(rs.getString(1));
                cli.setApellidos(rs.getString(2));
                cli.setDireccion(rs.getString(3));
                cli.setEmail(rs.getString(4));
                cli.setTipoCliente(rs.getString(5));
            }
            else{
                return null;
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return cli;
    }
    
    public void modificarCliente(Cliente cli){
        String query = "{CALL modificarCliente(?,?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,cli.getCedula());
            cs.setString(2,cli.getNombres());
            cs.setString(3,cli.getApellidos());
            cs.setString(4, cli.getDireccion());
            cs.setString(5, cli.getEmail());
            cs.setString(6,cli.getTipoCliente());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Cliente modificado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void eliminarCliente(String cedCli){
        String cadena = "{CALL eliminarCliente(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, cedCli);
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Cliente eliminado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public Proveedor encontrarProveedorPorNombre(String nomProv){
        String cadena = "{CALL buscarProveedorPorNombre(?)}";
        Proveedor prov = new Proveedor();
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, nomProv);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                prov.setNombreProveedor(rs.getString(1));
                prov.setTelefono(rs.getString(2));
                prov.setEmail(rs.getString(3));
                prov.setDireccion(rs.getString(4));                
                prov.setPais(rs.getInt(5));
                prov.setCiudad(rs.getInt(6));
            }
            else{
                return null;
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return prov;
    }
    
    public Proveedor encontrarProveedorPorId(int idProd){
        String cadena = "{CALL buscarProveedorPorId(?)}";
        Proveedor prov = new Proveedor();
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setInt(1, idProd);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                prov.setNombreProveedor(rs.getString(1));
                prov.setTelefono(rs.getString(2));
                prov.setEmail(rs.getString(3));
                prov.setDireccion(rs.getString(4));                
                prov.setPais(rs.getInt(5));
                prov.setCiudad(rs.getInt(6));
            }
            else{
                return null;
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return prov;
    }
    
    public void modificarProveedorPorNombre(Proveedor p,String nomviejo){
        String query = "{CALL modificarProveedorPorNombre(?,?,?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,nomviejo);
            cs.setString(2,p.getNombreProveedor());
            cs.setString(3,p.getTelefono());
            cs.setString(4, p.getEmail());
            cs.setString(5, p.getDireccion());
            cs.setInt(6,p.getPais());
            cs.setInt(7,p.getCiudad());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Proveedor modificado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void modificarProveedorPorId(Proveedor p){
        String query = "{CALL modificarProveedorPorId(?,?,?,?,?,?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1,p.getIdProveedor());
            cs.setString(2,p.getNombreProveedor());
            cs.setString(3,p.getTelefono());
            cs.setString(4, p.getEmail());
            cs.setString(5, p.getDireccion());
            cs.setInt(6,p.getPais());
            cs.setInt(7,p.getCiudad());
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Proveedor modificado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    public void eliminarProveedorPorNombre(String nombProv){
        String cadena = "{CALL eliminarProveedorPorNombre(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setString(1, nombProv);
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Proveedor eliminado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void eliminarProveedorPorId(int idProv){
        String cadena = "{CALL eliminarProveedorPorId(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setInt(1, idProv);
            cs.executeQuery();
            JOptionPane.showMessageDialog(null,"Proveedor eliminado correctamente.","Mensaje del sistema",JOptionPane.INFORMATION_MESSAGE);
            //System.out.println("Secuencia de 'insertarProducto' ejecutada correctamente.");
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }

    public int obtenerStockProducto(int id) {
        String cadena = "{CALL stockProducto(?)}";
        int stock = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(cadena);
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst()){
                rs.next();
                stock = rs.getInt(1);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return stock;
    }

    public void realizarVenta(OrdenVenta orden, ArrayList<DetalleVenta> detalle) {
        String query = "{CALL insertarOrdenVenta(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1, orden.getIdCliente());
            cs.setFloat(2, orden.getTotalVenta());
            cs.execute();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        query = "{CALL obtenerIdUltimaVenta()}";
        int idVenta = 0;
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            idVenta = cs.executeQuery().getInt(1);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        query = "{CALL insertarDetalleVenta(?,?,?,?)}";
        for(DetalleVenta d : detalle){
            try{
                CallableStatement cs = this.getConnection().prepareCall(query);
                cs.setInt(1,idVenta);
                cs.setInt(2, d.getIdProducto());
                cs.setFloat(3, d.getPrecio());
                cs.setFloat(4, d.getCantidad());
                cs.execute();
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
    }
    
    public void obtenerProveedoresDeProductoPorId(int idprod,JTable tabla, DefaultTableModel modelo){
        String query = "{CALL obtenerProveedoresDeProductoPorId(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1,idprod);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Object obj[] = {rs.getString(1)};
                modelo.addRow(obj);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void obtenerProveedoresDeProductoPorNombre(String nomProd,JTable tabla, DefaultTableModel modelo){
        String query = "{CALL obtenerProveedoresDeProductoPorNombre(?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setString(1,nomProd);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Object obj[] = {rs.getString(1)};
                modelo.addRow(obj);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public boolean relacionProductoProveedorExiste(int idprod,int idprov){
        String query = "{CALL obtenerIdProductoProveedor(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1,idprod);
            cs.setInt(2, idprov);
            ResultSet rs = cs.executeQuery();
            if(rs.isBeforeFirst())return true;
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }
    
    public void cargarOrdenesCompraAJTable(JTable tabla,DefaultTableModel modelo){
        String query = "{CALL cargarOrdenesCompra()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Date fecha = rs.getDate(1);
                Time tiempo = rs.getTime(2);
                float total = rs.getFloat(3);
                Object fila[] = {fecha,tiempo,total};
                modelo.addRow(fila);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void cargarOrdenesVentaAJTable(JTable tabla,DefaultTableModel modelo){
        String query = "{CALL cargarOrdenesVenta()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Date fecha = rs.getDate(1);
                Time tiempo = rs.getTime(2);
                float total = rs.getFloat(3);
                Object fila[] = {fecha,tiempo,total};
                modelo.addRow(fila);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void actualizarInventario(int idprod, int cantidad){
        String query = "{CALL actualizarStock(?,?)}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            cs.setInt(1, idprod);
            cs.setInt(2, cantidad);
            cs.executeQuery();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void productosSinStock(JTable tabla){
        Object cols[] = {"Producto","Descripcion Producto","Nombre Proveedor",
            "Direccion Proveedor","Telefono Proveedor"};
        DefaultTableModel modelo = new DefaultTableModel(cols, 0);
        String query = "{CALL productosSinStock()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String nomprod = rs.getString(1);
                String descprod = rs.getString(2);
                String nomprov = rs.getString(3);
                String dirprov = rs.getString(4);
                String telfprov = rs.getString(5);
                Object fila[] = {nomprod,descprod,nomprov,dirprov,telfprov};
                modelo.addRow(fila);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void top10ProductosMasVendidos(JTable tabla){
        Object cols[] = {"Producto","Cantidad vendida"};
        DefaultTableModel modelo = new DefaultTableModel(cols, 0);
        String query = "{CALL top10ProductosMasVendidos()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String nomprod = rs.getString(1);
                int cant = rs.getInt(2);
                Object fila[] = {nomprod,cant};
                modelo.addRow(fila);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void top10clientes(JTable tabla){
        Object cols[] = {"Nombres","Apellidos","Email","Dinero gastado"};
        DefaultTableModel modelo = new DefaultTableModel(cols, 0);
        String query = "{CALL top10clientes()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String nombres = rs.getString(1);
                String apellidos = rs.getString(2);
                String email = rs.getString(3);
                float dinero = rs.getFloat(4);
                Object fila[] = {nombres,apellidos,email,dinero};
                modelo.addRow(fila);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    
    public void top10clientesMasFrecuentes(JTable tabla){
        Object cols[] = {"Nombres","Apellidos","Email","Cantidad de compras"};
        DefaultTableModel modelo = new DefaultTableModel(cols, 0);
        String query = "{CALL top10clientesMasFrecuentes()}";
        try{
            CallableStatement cs = this.getConnection().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String nombres = rs.getString(1);
                String apellidos = rs.getString(2);
                String email = rs.getString(3);
                int cantidad = rs.getInt(4);
                Object fila[] = {nombres,apellidos,email,cantidad};
                modelo.addRow(fila);
            }
            tabla.setModel(modelo);
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
}
