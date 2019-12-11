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

public class usuariosAction extends ActionSupport {

    private List<adminAction> listaBienes = new ArrayList();
    private String mensaje;

    private List myList;
    private Connection conexion;
    private Map parametros;
    private int idUsuario;

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
            System.out.println("Segui Responsables");
            parametros.put("marca","null");
            parametros.put("modelo","null");
            parametros.put("no_serie","null");
        }catch (Exception r){
            System.out.println("Error en método reporteAdministrador del adminAction 'GetMyList' "+r);
        }
        return SUCCESS;
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
}
