package com.utez.edu.mx.domains.bien.model;

public class BeanBien {
    private int id_bien;
    private String codigo_inventario;
    private String nombre;
    private String descripcion;
    private String precio;
    private String marca;
    private String modelo;
    private String no_serie;
    private String estatus;

    public BeanBien() {
    }

    public BeanBien(int id_bien, String codigo_inventario, String nombre, String descripcion, String precio, String marca, String modelo, String no_serie, String estatus) {
        this.id_bien = id_bien;
        this.codigo_inventario = codigo_inventario;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.marca = marca;
        this.modelo = modelo;
        this.no_serie = no_serie;
        this.estatus = estatus;
    }

    public int getId_bien() {
        return id_bien;
    }

    public void setId_bien(int id_bien) {
        this.id_bien = id_bien;
    }

    public String getCodigo_inventario() {
        return codigo_inventario;
    }

    public void setCodigo_inventario(String codigo_inventario) {
        this.codigo_inventario = codigo_inventario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getNo_serie() {
        return no_serie;
    }

    public void setNo_serie(String no_serie) {
        this.no_serie = no_serie;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }
}
