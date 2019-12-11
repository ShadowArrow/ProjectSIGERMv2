package com.utez.edu.mx.domains.rol.controller;

import com.utez.edu.mx.domains.rol.model.BeanRol;
import com.utez.edu.mx.domains.rol.model.DAORol;

import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class RolAAction {
    private BeanRol bean = new BeanRol();
    private DAORol dao = new DAORol();
    private List<BeanRol> listRol = new ArrayList<BeanRol>();

    public BeanRol getBean() {
        return bean;
    }

    public void setBean(BeanRol bean) {
        this.bean = bean;
    }

    public DAORol getDao() {
        return dao;
    }

    public void setDao(DAORol dao) {
        this.dao = dao;
    }

    public List<BeanRol> getListRol() {
        return listRol;
    }

    public void setListRol(List<BeanRol> listRol) {
        this.listRol = listRol;
    }

    public String MostrarRol(){
        listRol = dao.MostrarRol();
        return SUCCESS;
    }
}
