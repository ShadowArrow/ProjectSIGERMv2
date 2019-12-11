package com.utez.edu.mx.sesion.controller;

import com.opensymphony.xwork2.ActionContext;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;
import com.utez.edu.mx.domains.usuario.model.DAOUsuario;

import java.util.Map;

import static com.opensymphony.xwork2.Action.SUCCESS;
import static com.opensymphony.xwork2.Action.ERROR;

public class IniciarSesionAction {

    //atributos
    //----------------------------------------------------------------------
    private BeanUsuario bean = new BeanUsuario();
    private DAOUsuario dao = new DAOUsuario();
    private Map session;
    private String mensaje;
    private String rol;
    //----------------------------------------------------------------------

    //getters y setters
    //----------------------------------------------------------------------
    public BeanUsuario getBean() {
        return bean;
    }

    public void setBean(BeanUsuario bean) {
        this.bean = bean;
    }

    public DAOUsuario getDao() {
        return dao;
    }

    public void setDao(DAOUsuario dao) {
        this.dao = dao;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    //----------------------------------------------------------------------

    //metodo del inicio de sesión
    //----------------------------------------------------------------------
    public String IniciarSesion(){
        session = ActionContext.getContext().getSession();
        String user = bean.getCorreoInstitucional();
        String pass = bean.getContrasena();
        bean = dao.IniciarSesion(bean);

        if (bean != null) {

            if (user.equals(bean.getCorreoInstitucional()) && pass.equals(bean.getContrasena()) && bean.getEstatus().equals("activo")) {
                if("RPBSI".equals(bean.getRol())){
                    mensaje = "¡Bienvenido!";
                    rol = bean.getRol();
                    session.put("usuario", bean);
                    return "RPBSI";
                } else {
                    mensaje = "¡Bienvenido!";
                    rol = bean.getRol();
                    session.put("usuario", bean);
                    return "COMMON_USER";
                }
            } else {
                mensaje = "Usuario y/o contraseña incorrecta";
                return ERROR;
            }

        } else {
            mensaje = "Usuario y/o contraseña no válidos, intente nuevamente";
            return ERROR;
        }
    }
    //----------------------------------------------------------------------

    //metodo de cerrar sesión
    public String CerrarSesion(){
        session = ActionContext.getContext().getSession();
        session.clear();
        return SUCCESS;
    }
}
