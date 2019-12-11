package com.utez.edu.mx.domains.proyecto.controller;

import com.utez.edu.mx.domains.proyecto.model.ProyectoBean;
import com.utez.edu.mx.domains.proyecto.model.ProyectoDao;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class ProyectoAction {
    private String mensaje;
    private ProyectoBean bean = new ProyectoBean();
    private ProyectoDao dao = new ProyectoDao();
    private List<ProyectoBean> proyectoList = new ArrayList<ProyectoBean>();

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public ProyectoBean getBean() {
        return bean;
    }

    public void setBean(ProyectoBean bean) {
        this.bean = bean;
    }

    public ProyectoDao getDao() {
        return dao;
    }

    public void setDao(ProyectoDao dao) {
        this.dao = dao;
    }

    public List<ProyectoBean> getProyectoList() {
        return proyectoList;
    }

    public void setProyectoList(List<ProyectoBean> proyectoList) {
        this.proyectoList = proyectoList;
    }

    public String registrarProyecto() {
        if (dao.registrarProyecto(bean)) {
            mensaje = "Registro exitoso";
        } else {
            mensaje = "Error al registrar";
        }
        return SUCCESS;
    }

    public String consultarProyectos() {
        proyectoList = dao.consultarProyectos();
        return SUCCESS;
    }

    public String consultarProyectoPorId() {
        bean = dao.consultarProyectoPorId(bean.getId());
        return SUCCESS;
    }

    public String modificarProyecto() {

        if (dao.modificarProyecto(bean)) {
            mensaje = "Modificación exitosa";
        } else {
            mensaje = "Error al modificar";
        }
        return SUCCESS;
    }

    public String eliminarProyecto() {
        if (dao.eliminarProyecto(bean.getId())) {
            mensaje = "Eliminacion exitosa";
        } else {
            mensaje = "Error al eliminar";
        }
        return SUCCESS;
    }

    public String activarProyecto() {
        if (dao.activarProyecto(bean.getId())) {
            mensaje = "Activación exitosa";
            return SUCCESS;
        } else {
            mensaje = "Error al activar";
            return ERROR;
        }
    }
    }
