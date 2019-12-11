package com.utez.edu.mx.beansReportes;

public class adminBean {
    String codigo_inventario;
    String nombre;
    String descripcion;
    String precio;
    String marca;
    String modelo;
    String no_serie;

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
}
