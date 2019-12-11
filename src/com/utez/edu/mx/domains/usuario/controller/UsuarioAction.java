package com.utez.edu.mx.domains.usuario.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.utez.edu.mx.domains.rol.model.BeanRol;
import com.utez.edu.mx.domains.rol.model.DAORol;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;
import com.utez.edu.mx.domains.usuario.model.DAOUsuario;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;
import static com.opensymphony.xwork2.Action.ERROR;

public class UsuarioAction extends ActionSupport {
    private String mensajeUsuario;
    private BeanUsuario bean = new BeanUsuario();
    private DAOUsuario dao = new DAOUsuario();
    private BeanRol beanRol = new BeanRol();
    private DAORol daoRol = new DAORol();
    private List<BeanRol> listRol = new ArrayList<BeanRol>();
    private List<BeanUsuario> listUsuario = new ArrayList<BeanUsuario>();

    public String getMensajeUsuario() {
        return mensajeUsuario;
    }

    public void setMensajeUsuario(String mensaje) {
        this.mensajeUsuario = mensaje;
    }

    public DAORol getDaoRol() {
        return daoRol;
    }

    public void setDaoRol(DAORol daoRol) {
        this.daoRol = daoRol;
    }

    public BeanRol getBeanRol() {
        return beanRol;
    }

    public void setBeanRol(BeanRol beanRol) {
        this.beanRol = beanRol;
    }

    public List<BeanRol> getListRol() {
        return listRol;
    }

    public void setListRol(List<BeanRol> listRol) {
        this.listRol = listRol;
    }

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

    public List<BeanUsuario> getListUsuario() {
        return listUsuario;
    }

    public void setListUsuario(List<BeanUsuario> listUsuario) {
        this.listUsuario = listUsuario;
    }

    public String MostrarUsuarios() {
        listRol = daoRol.MostrarRol();
        listUsuario = dao.MostraUsuarios();
        return SUCCESS;
    }

    public String InsertarUsuarios() {
        if (dao.RegistrarUsuario(bean)) {
            mensajeUsuario = "El usuario ha sido registrado con exito";
            return SUCCESS;
        } else {
            mensajeUsuario = "El usuario no ha sido registrado con exito";
            return ERROR;
        }
    }

    public String EliminarUsuarios() {
        if (dao.EliminarUsuario(bean)) {
            mensajeUsuario = "El usuario ha sido eliminado con exito";
            return SUCCESS;
        } else {
            mensajeUsuario = "El usuario no ha sido eliminado con exito";
            return ERROR;
        }
    }

    public String MostrarUsuarioId(){
        bean = dao.MostrarUsuarioId(bean);
        return SUCCESS;
    }

    public String ModificarUsuario(){
        if(dao.ModificarUsuario(bean)){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }

    public String MostrarFormularioModificar(){
        bean = dao.MostrarUsuarioId(bean);
        listRol = daoRol.MostrarRol();
        return SUCCESS;
    }

    public String ActivarUsuario(){
        if(dao.ActivarUsuario(bean)){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }

    public String ConfirmarUsuario() {
        String email = bean.getCorreoInstitucional();
        String pass = bean.getContrasena();
        bean = dao.ConfirmarUsuario(bean);

        if(bean != null){
            if(email.equals(bean.getCorreoInstitucional())&& pass.equals(bean.getContrasena())){
                return SUCCESS;
            }else{
                return ERROR;
            }
        }else{
            return ERROR;
        }
    }
}

