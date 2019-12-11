package com.utez.edu.mx.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class Conexion {
    private static String ipAddress;
    private static String puerto;
    private static String usuario;
    private static String password;
    private static String nombreBase;
    private static ResourceBundle propiedades;

    public static Connection getConexion() {
        Connection con = null;
        if (propiedades == null) {
            propiedades = ResourceBundle.getBundle("propiedadesMySQL");
            ipAddress = propiedades.getString("ipAddress");
            puerto = propiedades.getString("puerto");
            usuario = propiedades.getString("usuario");
            password = propiedades.getString("password");
            nombreBase = propiedades.getString("nombreBase");
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ipAddress + ":" + puerto + "/" + nombreBase, usuario, password);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return con;
    }

    public static void main(String[] args) {
        Conexion conexion = new Conexion();
        Connection con = conexion.getConexion();
        if (con != null) {
            System.out.println("¡Conexión exitosa!... :D");
        } else {
            System.out.println("¡No se estableció conexión!... o.0'");
        }
    }
}
