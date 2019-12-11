package com.utez.edu.mx.domains.espacioFisico.controller;

import com.utez.edu.mx.domains.espacioFisico.model.EspacioFisicoBean;
import com.utez.edu.mx.domains.espacioFisico.model.EspacioFisicoDao;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;
import com.utez.edu.mx.domains.usuario.model.DAOUsuario;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class EspacioFisicoAction {
    private EspacioFisicoBean espacioFisicoBean = new EspacioFisicoBean();
    private EspacioFisicoDao espacioFisicoDao = new EspacioFisicoDao();

    private List<EspacioFisicoBean> espacioFisicoList = new ArrayList<EspacioFisicoBean>();
    private List<BeanUsuario> usuariosList = new ArrayList<BeanUsuario>();

    private String mensaje;

    public EspacioFisicoBean getEspacioFisicoBean() {
        return espacioFisicoBean;
    }

    public void setEspacioFisicoBean(EspacioFisicoBean espacioFisicoBean) {
        this.espacioFisicoBean = espacioFisicoBean;
    }

    public EspacioFisicoDao getEspacioFisicoDao() {
        return espacioFisicoDao;
    }

    public void setEspacioFisicoDao(EspacioFisicoDao espacioFisicoDao) {
        this.espacioFisicoDao = espacioFisicoDao;
    }

    public List<EspacioFisicoBean> getEspacioFisicoList() {
        return espacioFisicoList;
    }

    public void setEspacioFisicoList(List<EspacioFisicoBean> espacioFisicoList) {
        this.espacioFisicoList = espacioFisicoList;
    }

    public List<BeanUsuario> getUsuariosList() {
        return usuariosList;
    }

    public void setUsuariosList(List<BeanUsuario> usuariosList) {
        this.usuariosList = usuariosList;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }


    public String consultarEspacioFisico() {
        espacioFisicoList = espacioFisicoDao.consultarEspacioFisicos();
        DAOUsuario daoUsuario = new DAOUsuario();
        usuariosList = daoUsuario.MostraUsuarios();
        return SUCCESS;
    }

    public String registrarEspacioFisico() {
        espacioFisicoList = espacioFisicoDao.consultarEspacioFisicos();
        if (espacioFisicoList.size() == 0){
            espacioFisicoBean.setNumero(1);
        } else {
            espacioFisicoBean.setNumero(espacioFisicoList.get(espacioFisicoList.size()-1).getNumero() + 1 );
        }
        if (espacioFisicoDao.registrarEspacioFisico(espacioFisicoBean)) {
            mensaje = "Registro exitoso";
        } else {
            mensaje = "Error al registrar";
        }
        return SUCCESS;
    }

    public String consultarEspacioFisicoPorId() {
        espacioFisicoBean = espacioFisicoDao.consultarEspacioFisicoPorId(espacioFisicoBean.getId_espacio_fisico());
        DAOUsuario daoUsuario = new DAOUsuario();
        usuariosList = daoUsuario.MostraUsuarios();
        return SUCCESS;
    }

    public String modificarEspacioFisico() {
        if (espacioFisicoDao.modificarEspacioFisico(espacioFisicoBean)) {
            mensaje = "Modificación exitosa";
        } else {
            mensaje = "Error al modificar";
        }
        return SUCCESS;
    }

    public String eliminarEspacioFisico() {
        if (espacioFisicoDao.eliminarEspacioFisico(espacioFisicoBean.getId_espacio_fisico())) {
            mensaje = "Eliminacion exitosa";
        } else {
            mensaje = "Error al eliminar";
        }
        System.out.println("Mensaje" + mensaje);
        return SUCCESS;
    }

    public String activarEspacioFisico() {
        if (espacioFisicoDao.activarEspacioFisico(espacioFisicoBean.getId_espacio_fisico())) {
            mensaje = "Activación exitosa";
            return SUCCESS;
        } else {
            mensaje = "Error al activar";
            return ERROR;
        }
    }

}
