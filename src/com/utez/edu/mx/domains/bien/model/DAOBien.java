package com.utez.edu.mx.domains.bien.model;

import com.utez.edu.mx.connection.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOBien {

    public List<BeanBien> MostraBienes(){
        Connection con = null;
        BeanBien bean = new BeanBien();
        List<BeanBien> listBien = new ArrayList<BeanBien>();
        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call mostrar_bienes()");
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                bean = new BeanBien();
                bean.setId_bien(rs.getInt("id_bien"));
                bean.setCodigo_inventario(rs.getString("codigo_inventario"));
                bean.setNombre(rs.getString("nombre"));
                bean.setDescripcion(rs.getString("descripcion"));
                bean.setPrecio(rs.getString("precio"));
                bean.setMarca(rs.getString("marca"));
                bean.setModelo(rs.getString("modelo"));
                bean.setNo_serie(rs.getString("no_serie"));
                bean.setEstatus(rs.getString("estatus"));

                System.out.println("estatus antes de almacenarlo en la lista: " + bean.getEstatus());

                listBien.add(bean);
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consultar Bienes: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("Nombre del Bien consultado: " + bean.getNombre());
        System.out.println("Codigo del Bien consultado: " + bean.getCodigo_inventario());
        return listBien;
    }

    public boolean RegistrarBien(BeanBien bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call registrar_bienes (?,?,?,?,?,?,?,?)}");
            stmt.setString(1,bean.getCodigo_inventario());
            stmt.setString(2,bean.getNombre());
            stmt.setString(3,bean.getDescripcion());
            stmt.setString(4,bean.getPrecio());
            stmt.setString(5,bean.getMarca());
            stmt.setString(6, bean.getModelo());
            stmt.setString(7,bean.getNo_serie());
            stmt.setString(8,"Activo");

            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al ingresar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo RegistrarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean ModificarBien(BeanBien bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call modificar_bien (?,?,?,?,?,?,?,?,?)}");
            stmt.setInt(1,bean.getId_bien());
            stmt.setString(2,bean.getCodigo_inventario());
            stmt.setString(3,bean.getNombre());
            stmt.setString(4,bean.getDescripcion());
            stmt.setString(5,bean.getPrecio());
            stmt.setString(6,bean.getMarca());
            stmt.setString(7, bean.getModelo());
            stmt.setString(8,bean.getNo_serie());
            stmt.setString(9,bean.getEstatus());

            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al modificar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo ModificarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean EliminarBien(BeanBien bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call desactivar_bien(?)}");
            stmt.setInt(1,bean.getId_bien());
            System.out.println("Id del bien: " + bean.getId_bien());
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al eliminar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo EliminarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }
    public boolean activarBien(BeanBien bean) {
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call activar_bien(?)}");
            stmt.setInt(1,bean.getId_bien());
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al eliminar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo EliminarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public BeanBien ConsultaEspecificaBien(int id){
        Connection con = null;
        BeanBien bean = new BeanBien();
        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call consulta_especifica_bien(?)");
            stmt.setInt(1,id);
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            bean = new BeanBien();
            if (rs.next()) {
                bean.setId_bien(rs.getInt("id_bien"));
                bean.setCodigo_inventario(rs.getString("codigo_inventario"));
                bean.setNombre(rs.getString("nombre"));
                bean.setDescripcion(rs.getString("descripcion"));
                bean.setPrecio(rs.getString("precio"));
                bean.setMarca(rs.getString("marca"));
                bean.setModelo(rs.getString("modelo"));
                bean.setNo_serie(rs.getString("no_serie"));
                bean.setEstatus(rs.getString("estatus"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consulta espacifica los bien: " + e.getMessage());
            e.printStackTrace();
        }
        return bean;
    }

}
