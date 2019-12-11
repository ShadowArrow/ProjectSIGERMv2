package com.utez.edu.mx.domains.espacioFisico.model;

import com.utez.edu.mx.domains.usuario.model.BeanUsuario;

public class EspacioFisicoBean {
    private int id_espacio_fisico;
    private String nombre;
    private int numero;
    private String descripcion;
    private BeanUsuario usuario;
    private String estatus;
    private String tipo;
    private int posicion;


    public EspacioFisicoBean() {
    }

    public EspacioFisicoBean(int id_espacio_fisico, String nombre, int numero, String descripcion, BeanUsuario usuario, String estatus, String tipo, int posicion) {
        this.id_espacio_fisico = id_espacio_fisico;
        this.nombre = nombre;
        this.numero = numero;
        this.descripcion = descripcion;
        this.usuario = usuario;
        this.estatus = estatus;
        this.tipo = tipo;
        this.posicion = posicion;
    }

    public int getId_espacio_fisico() {
        return id_espacio_fisico;
    }

    public void setId_espacio_fisico(int id_espacio_fisico) {
        this.id_espacio_fisico = id_espacio_fisico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public BeanUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(BeanUsuario usuario) {
        this.usuario = usuario;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    @Override
    public String toString() {
        return "EspacioFisicoBean{" +
                "id_espacio_fisico=" + id_espacio_fisico +
                ", nombre='" + nombre + '\'' +
                ", numero=" + numero +
                ", descripcion='" + descripcion + '\'' +
                ", usuario=" + usuario +
                ", estatus='" + estatus + '\'' +
                ", tipo='" + tipo + '\'' +
                ", posicion=" + posicion +
                '}';
    }
}
