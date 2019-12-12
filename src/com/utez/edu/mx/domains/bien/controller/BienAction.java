package com.utez.edu.mx.domains.bien.controller;

import com.utez.edu.mx.domains.asignacion.model.BeanAsignacion;
import com.utez.edu.mx.domains.asignacion.model.DAOAsignacion;
import com.utez.edu.mx.domains.bien.model.BeanBien;
import com.utez.edu.mx.domains.bien.model.DAOBien;
import com.utez.edu.mx.domains.rol.model.BeanRol;
import com.utez.edu.mx.domains.rol.model.DAORol;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class BienAction {
    private String mensajeBien;
    private BeanBien bean = new BeanBien();
    private DAOBien dao = new DAOBien();
    private DAOAsignacion daoAsignacion = new DAOAsignacion();
    private List<BeanAsignacion> listAsignacion = new ArrayList<BeanAsignacion>();
    private List<BeanBien> listBien = new ArrayList<BeanBien>();
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMensajeBien() {
        return mensajeBien;
    }

    public void setMensajeBien(String mensajeBien) {
        this.mensajeBien = mensajeBien;
    }

    public BeanBien getBean() {
        return bean;
    }

    public void setBean(BeanBien bean) {
        this.bean = bean;
    }

    public DAOBien getDao() {
        return dao;
    }

    public void setDao(DAOBien dao) {
        this.dao = dao;
    }

    public List<BeanBien> getListBien() {
        return listBien;
    }

    public void setListBien(List<BeanBien> listBien) {
        this.listBien = listBien;
    }

    public String MostrarBienes() {
        listBien = dao.MostraBienes();
        return SUCCESS;
    }

    public String InsertarBien() {
        if (dao.RegistrarBien(bean)) {
            mensajeBien = "El bien ha sido registrado con exito";
            return SUCCESS;
        } else {
            mensajeBien = "El bien no ha sido registrado con exito";
            return ERROR;
        }
    }

    public String EliminarBien() {
        listAsignacion = daoAsignacion.MostraAsignaciones();
        int v = 0;
        for (int i = 0; i < listAsignacion.size(); i++) {
            if (listAsignacion.get(i).getBien().getId_bien() == bean.getId_bien() && listAsignacion.get(i).getEstatus().equals("Activo")) {
                v = 1;
                break;
            }
        }
        if (v == 0) {
            if (dao.EliminarBien(bean)) {
                mensajeBien = "El usuario ha sido eliminado con exito";
                return SUCCESS;
            } else {
                mensajeBien = "El usuario no ha sido eliminado con exito";
                return ERROR;
            }
        } else {
            return ERROR;
        }

    }

    public String ConsultaEspecificaBien() {
        bean = dao.ConsultaEspecificaBien(id);
        return SUCCESS;
    }

    public String ModificarBien() {
        if (dao.ModificarBien(bean)) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String activarBien() {
        if (dao.activarBien(bean)) {
            /*mensaje = "Activación exitosa";*/
            return SUCCESS;
        } else {
            /*mensaje = "Error al activar";*/
            return ERROR;
        }
    }

    public String MostrarFormularioModificar() {
        bean = dao.ConsultaEspecificaBien(id);
        return SUCCESS;
    }
}

