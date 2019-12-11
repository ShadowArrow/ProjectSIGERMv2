package com.utez.edu.mx.domains.rol.model;

import com.utez.edu.mx.connection.Conexion;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;
import org.apache.struts2.components.Bean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAORol {
    Connection con = null;
    BeanRol beanRol = new BeanRol();

    public List<BeanRol> MostrarRol() {
        List<BeanRol> listRol = new ArrayList<BeanRol>();
        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call mostrar_rol()");
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                beanRol = new BeanRol();
                beanRol.setIdRol(rs.getInt("id_rol"));
                beanRol.setRol(rs.getString("nombre"));
                listRol.add(beanRol);
            }
        } catch (SQLException e) {
            System.out.println("ERROR: en la clase 'DAORol' en el metodo 'MostrarRol'" + e.getMessage());
            e.printStackTrace();
        }
        return listRol;
    }
}
