package com.utez.edu.mx.domains.rol.model;

public class BeanRol {
    private int idRol;
    private String rol;

    public BeanRol() {
    }

    public BeanRol(int idRol, String rol) {
        this.idRol = idRol;
        this.rol = rol;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
