package com.utez.edu.mx.reportesAction;

import com.opensymphony.xwork2.ActionSupport;
import com.utez.edu.mx.connection.Conexion;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class adminAction extends ActionSupport {

    private List<adminAction> listaBienes = new ArrayList();
    private String mensaje;

    private List myList;
    private Connection conexion;
    private Map parametros;
    private String nombreAdmin;
    private String apellido1;
    private String apellido2;
    private int idUsuario;
    private String horariolabores;

    public String reporteAdministrador() throws SQLException {
        try {
            Conexion conex = new Conexion();
            conexion = conex.getConexion();
            myList = new ArrayList();
            parametros = new HashMap();
            parametros.put("nombreAdmin", nombreAdmin);
            parametros.put("apellido1", apellido1);
            parametros.put("apellido2", apellido2);
            parametros.put("horariolabores", horariolabores);
            parametros.put("codigo_inventario", "null");
            parametros.put("nombre", "null");
            parametros.put("descripcion", "null");
            parametros.put("precio", "null");
            parametros.put("marca", "null");
            parametros.put("modelo", "null");
            parametros.put("no_serie", "null");
        } catch (Exception r) {
            System.out.println("Error en método reporteAdministrador del adminAction 'GetMyList' " + r);
        }
        return SUCCESS;
    }

    public String reporteResponsables() throws SQLException {
        try {
            Conexion conex = new Conexion();
            conexion = conex.getConexion();
            myList = new ArrayList();
            parametros = new HashMap();
            parametros.put("idUsuario",idUsuario);
            parametros.put("codigo_inventario","null");
            parametros.put("nombre","null");
            parametros.put("descripcion","null");
            parametros.put("precio","null");
            System.out.println("Segui");
            parametros.put("marca","null");
            parametros.put("modelo","null");
            parametros.put("no_serie","null");
        }catch (Exception r){
            System.out.println("Error en método reporteAdministrador del adminAction 'GetMyList' "+r);
        }
        return SUCCESS;
    }

    public String getNombreAdmin() {
        return nombreAdmin;
    }

    public void setNombreAdmin(String nombreAdmin) {
        this.nombreAdmin = nombreAdmin;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public List<adminAction> getListaBienes() {
        return listaBienes;
    }

    public void setListaBienes(List<adminAction> listaBienes) {
        this.listaBienes = listaBienes;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public List getMyList() {
        return myList;
    }

    public void setMyList(List myList) {
        this.myList = myList;
    }

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

    public Map getParametros() {
        return parametros;
    }

    public void setParametros(Map parametros) {
        this.parametros = parametros;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getHorariolabores() {
        return horariolabores;
    }

    public void setHorariolabores(String horariolabores) {
        this.horariolabores = horariolabores;
    }
}
