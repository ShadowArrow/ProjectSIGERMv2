package com.utez.edu.mx.domains.proyecto.model;

public class ProyectoBean {
    private int id;
    private String identificador;
    private String nombre;
    private String descripcion;
    private String nombreCliente;
    private String correoCliente;
    private String telefonoCliente;
    private String direccionCliente;
    private String fechaInicio;
    private String fechaFin;
    private String estatus;

    public ProyectoBean() {
    }

    public ProyectoBean(int id, String identificador, String nombre, String descripcion, String nombreCliente, String correoCliente, String telefonoCliente, String direccionCliente, String fechaInicio, String fechaFin, String estatus) {
        this.id = id;
        this.identificador = identificador;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.nombreCliente = nombreCliente;
        this.correoCliente = correoCliente;
        this.telefonoCliente = telefonoCliente;
        this.direccionCliente = direccionCliente;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.estatus = estatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
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

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getCorreoCliente() {
        return correoCliente;
    }

    public void setCorreoCliente(String correoCliente) {
        this.correoCliente = correoCliente;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    @Override
    public String toString() {
        System.out.println("ProyectoBean{" +
                "id=" + id +
                ", identificador='" + identificador + '\'' +
                ", nombre='" + nombre + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", nombreCliente='" + nombreCliente + '\'' +
                ", correoCliente='" + correoCliente + '\'' +
                ", telefonoCliente='" + telefonoCliente + '\'' +
                ", direccionCliente='" + direccionCliente + '\'' +
                ", fechaInicio='" + fechaInicio + '\'' +
                ", fechaFin='" + fechaFin + '\'' +
                ", estatus=" + estatus +
                '}');
        return "Succefull";
    }
}
