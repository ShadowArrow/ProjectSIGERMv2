package com.utez.edu.mx.domains.asignacion.controller;

import com.utez.edu.mx.domains.asignacion.model.BeanAsignacion;
import com.utez.edu.mx.domains.asignacion.model.DAOAsignacion;
import com.utez.edu.mx.domains.bien.model.BeanBien;
import com.utez.edu.mx.domains.bien.model.DAOBien;
import com.utez.edu.mx.domains.espacioFisico.model.EspacioFisicoBean;
import com.utez.edu.mx.domains.espacioFisico.model.EspacioFisicoDao;
import com.utez.edu.mx.domains.proyecto.model.ProyectoBean;
import com.utez.edu.mx.domains.proyecto.model.ProyectoDao;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;
import com.utez.edu.mx.domains.usuario.model.DAOUsuario;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class AsignacionAction {
    private String mensajeBien;
    private BeanAsignacion bean = new BeanAsignacion();
    private DAOAsignacion dao = new DAOAsignacion();
    private DAOUsuario daoUsuario = new DAOUsuario();
    private DAOBien daoBien = new DAOBien();
    private EspacioFisicoDao daoEspacioFisico = new EspacioFisicoDao();
    private ProyectoDao daoProyecto = new ProyectoDao();
    private List<BeanAsignacion> listAsignacion = new ArrayList<BeanAsignacion>();
    private List<BeanUsuario> listUsuario = new ArrayList<BeanUsuario>();
    private List<BeanBien> listBien = new ArrayList<BeanBien>();
    private List<EspacioFisicoBean> listEspacioFisico = new ArrayList<EspacioFisicoBean>();
    private List<ProyectoBean> listProyecto = new ArrayList<ProyectoBean>();
    private int proyecto;
    private int bien;
    private int utiliza;
    private int responsable;
    private int lugar;
    private int id_asignacion;
    private String estatus;

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public int getId_asignacion() {
        return id_asignacion;
    }

    public void setId_asignacion(int id_asignacion) {
        this.id_asignacion = id_asignacion;
    }

    public int getUtiliza() {
        return utiliza;
    }

    public void setUtiliza(int utiliza) {
        this.utiliza = utiliza;
    }

    public int getResponsable() {
        return responsable;
    }

    public void setResponsable(int responsable) {
        this.responsable = responsable;
    }

    public int getProyecto() {
        return proyecto;
    }

    public void setProyecto(int proyecto) {
        this.proyecto = proyecto;
    }

    public int getBien() {
        return bien;
    }

    public void setBien(int bien) {
        this.bien = bien;
    }

    public int getLugar() {
        return lugar;
    }

    public void setLugar(int lugar) {
        this.lugar = lugar;
    }

    public DAOBien getDaoBien() {
        return daoBien;
    }

    public void setDaoBien(DAOBien daoBien) {
        this.daoBien = daoBien;
    }

    public EspacioFisicoDao getDaoEspacioFisico() {
        return daoEspacioFisico;
    }

    public void setDaoEspacioFisico(EspacioFisicoDao daoEspacioFisico) {
        this.daoEspacioFisico = daoEspacioFisico;
    }

    public ProyectoDao getDaoProyecto() {
        return daoProyecto;
    }

    public void setDaoProyecto(ProyectoDao daoProyecto) {
        this.daoProyecto = daoProyecto;
    }

    public List<BeanBien> getListBien() {
        return listBien;
    }

    public void setListBien(List<BeanBien> listBien) {
        this.listBien = listBien;
    }

    public List<EspacioFisicoBean> getListEspacioFisico() {
        return listEspacioFisico;
    }

    public void setListEspacioFisico(List<EspacioFisicoBean> listEspacioFisico) {
        this.listEspacioFisico = listEspacioFisico;
    }

    public List<ProyectoBean> getListProyecto() {
        return listProyecto;
    }

    public void setListProyecto(List<ProyectoBean> listProyecto) {
        this.listProyecto = listProyecto;
    }

    public String getMensajeBien() {
        return mensajeBien;
    }

    public void setMensajeBien(String mensajeBien) {
        this.mensajeBien = mensajeBien;
    }

    public BeanAsignacion getBean() {
        return bean;
    }

    public void setBean(BeanAsignacion bean) {
        this.bean = bean;
    }

    public DAOUsuario getDaoUsuario() {
        return daoUsuario;
    }

    public void setDaoUsuario(DAOUsuario daoUsuario) {
        this.daoUsuario = daoUsuario;
    }

    public List<BeanAsignacion> getListAsignacion() {
        return listAsignacion;
    }

    public void setListAsignacion(List<BeanAsignacion> listAsignacion) {
        this.listAsignacion = listAsignacion;
    }

    public List<BeanUsuario> getlistUsuario() {
        return listUsuario;
    }

    public void setlistUsuario(List<BeanUsuario> listUsuario) {
        listUsuario = listUsuario;
    }

    public DAOAsignacion getDao() {
        return dao;
    }

    public void setDao(DAOAsignacion dao) {
        this.dao = dao;
    }

    public List<BeanAsignacion> getlistAsignacion() {
        return listAsignacion;
    }

    public void setlistAsignacion(List<BeanAsignacion> listAsignacion) {
        this.listAsignacion = listAsignacion;
    }

    public List<BeanUsuario> getListUsuario() {
        return listUsuario;
    }

    public void setListUsuario(List<BeanUsuario> listUsuario) {
        this.listUsuario = listUsuario;
    }

    public String MostrarBienes() {
        listAsignacion = dao.MostraAsignaciones();
        listUsuario = daoUsuario.MostraUsuarios();
        listBien = daoBien.MostraBienes();
        listEspacioFisico = daoEspacioFisico.consultarEspacioFisicos();
        listProyecto = daoProyecto.consultarProyectos();
        return SUCCESS;
    }

    public String LlenarSpinners() {
        listAsignacion = dao.MostraAsignaciones();

        listUsuario = daoUsuario.MostraUsuarios();
        for(int i = 0; i < listUsuario.size(); i++){
            if(listUsuario.get(i).getEstatus().equals("Inactivo")){
                listUsuario.remove(i);
            }
        }
        listBien = daoBien.MostraBienes();
        for(int i = 0; i < listBien.size(); i++){
            if(listBien.get(i).getEstatus().equals("Inactivo")){
                listBien.remove(i);
            }
        }
        listEspacioFisico = daoEspacioFisico.consultarEspacioFisicos();
        for(int i = 0; i < listEspacioFisico.size(); i++){
            if(listEspacioFisico.get(i).getEstatus().equals("Inactivo")){
                listEspacioFisico.remove(i);
            }
        }
        listProyecto = daoProyecto.consultarProyectos();
        for(int i = 0; i < listProyecto.size(); i++){
            if(listProyecto.get(i).getEstatus().equals("Inactivo")){
                listProyecto.remove(i);
            }
        }
        for(int i = 0; i < listAsignacion.size(); i++){
            for(int j = 0; j < listBien.size(); j++) {

                if (listBien.get(j).getId_bien() == listAsignacion.get(i).getBien().getId_bien() && listAsignacion.get(i).getEstatus().equals("Activo")) {
                    listBien.remove(j);
                }
            }
        }
        return SUCCESS;
    }

    public String ConsultaEspecificaAsignacionModificar() {
        bean = dao.ConsultaEspecificaAsignacion(id_asignacion);

        listUsuario = daoUsuario.MostraUsuarios();
        for(int i = 0; i < listUsuario.size(); i++){
            if(listUsuario.get(i).getEstatus().equals("Inactivo")){
                listUsuario.remove(i);
            }
        }
        listBien = daoBien.MostraBienes();
        for(int i = 0; i < listBien.size(); i++){
            if(listBien.get(i).getEstatus().equals("Inactivo")){
                listBien.remove(i);
            }
        }
        listEspacioFisico = daoEspacioFisico.consultarEspacioFisicos();
        for(int i = 0; i < listEspacioFisico.size(); i++){
            if(listEspacioFisico.get(i).getEstatus().equals("Inactivo")){
                listEspacioFisico.remove(i);
            }
        }
        listProyecto = daoProyecto.consultarProyectos();
        for(int i = 0; i < listProyecto.size(); i++){
            if(listProyecto.get(i).getEstatus().equals("Inactivo")){
                listProyecto.remove(i);
            }
        }
        return SUCCESS;
    }

    public String ConsultaEspecificaAsignacion() {
        bean = dao.ConsultaAsignacion(id_asignacion);
        return SUCCESS;
    }

    public String InsertarAsignacion() {
        if (dao.RegistrarAsignacion(bien, lugar, proyecto, utiliza, responsable)) {
            mensajeBien = "El bien ha sido registrado con exito";
            return SUCCESS;
        } else {
            mensajeBien = "El bien no ha sido registrado con exito";
            return ERROR;
        }
    }

    public String MdificarAsignacion(){
        if(dao.ModificarAsignacion(bien, lugar, proyecto, utiliza, responsable, estatus, id_asignacion)){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }

    public String desabilitarAsignacion() {
        if (dao.desabilitarAsignacion(id_asignacion)) {
            /*mensaje = "Eliminacion exitosa";*/
            return SUCCESS;
        } else {
            /*mensaje = "Error al eliminar";*/
            return ERROR;
        }
    }

    public String activarAsignacion() {
        listAsignacion = dao.MostraAsignaciones();
        for (int i=0; i<listAsignacion.size();i++){
            if(listAsignacion.get(i).getId_asignacion() == id_asignacion){
                bean = new BeanAsignacion();
                bean = listAsignacion.get(i);
            }
        }
        int v = 0;
        for (int j=0; j<listAsignacion.size();j++){
            if (
                    (listAsignacion.get(j).getBien().getId_bien() == bean.getBien().getId_bien() && listAsignacion.get(j).getEstatus().equals("Activo") || bean.getBien().getEstatus().equals("Inactivo"))
                    ||
                            (listAsignacion.get(j).getUsuarioUtiliza().getId() == bean.getUsuarioUtiliza().getId() && listAsignacion.get(j).getEstatus().equals("Activo"))
                    ||
                            (listAsignacion.get(j).getUsuarioResponsable().getId() == bean.getUsuarioResponsable().getId() && listAsignacion.get(j).getEstatus().equals("Activo"))
                    ||
                            (listAsignacion.get(j).getEspacioFisico().getId_espacio_fisico() == bean.getEspacioFisico().getId_espacio_fisico() && listAsignacion.get(j).getEstatus().equals("Activo"))
                            ||
                            (listAsignacion.get(j).getProyecto().getId() == bean.getProyecto().getId() && listAsignacion.get(j).getEstatus().equals("Activo"))){
                v =1;
                break;
            }
        }
        if (v == 0) {
            if(dao.activarAsignacion(id_asignacion)){
                return SUCCESS;
            }else{
                return ERROR;
            }
            /*mensaje = "Activación exitosa";*/
        } else {
            /*mensaje = "Error al activar";*/
            return ERROR;
        }
    }

}

