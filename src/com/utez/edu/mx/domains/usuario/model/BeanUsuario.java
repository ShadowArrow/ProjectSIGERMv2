package com.utez.edu.mx.domains.usuario.model;

public class BeanUsuario {
    private int id;
    private String nombre;
    private String primerApellido;
    private String segundoApellido;
    private String fechaNacimiento;
    private String sexo;
    private String rfc;
    private int cuatrimestreIngreso;
    private int cuatrimestreActual;
    private String estatus;
    private String horarioLabores;
    private String correoInstitucional;
    private String correoPersonal;
    private String telefonoCelular;
    private String telefonoCasa;
    private String universidadEgreso;
    private String matricula;
    private String carreraEgreso;
    private String modalidadIngreso;
    private String modalidadActual;
    private String tecnologiasAplicadas;
    private String fechaIngreso;
    private String fechaEgreso;
    private String contrasena;
    private String rol;

    public BeanUsuario() {
    }

    public BeanUsuario(String nombre, String primerApellido, String segundoApellido, String fechaNacimiento, String sexo, String rfc, int cuatrimestreIngreso, int cuatrimestreActual, String estatus, String horarioLabores, String correoInstitucional, String correoPersonal, String telefonoCelular, String telefonoCasa, String universidadEgreso, String matricula, String carreraEgreso, String modalidadIngreso, String modalidadActual, String tecnologiasAplicadas, String fechaIngreso, String fechaEgreso, String contrasena, String rol, int id) {
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.fechaNacimiento = fechaNacimiento;
        this.sexo = sexo;
        this.rfc = rfc;
        this.cuatrimestreIngreso = cuatrimestreIngreso;
        this.cuatrimestreActual = cuatrimestreActual;
        this.estatus = estatus;
        this.horarioLabores = horarioLabores;
        this.correoInstitucional = correoInstitucional;
        this.correoPersonal = correoPersonal;
        this.telefonoCelular = telefonoCelular;
        this.telefonoCasa = telefonoCasa;
        this.universidadEgreso = universidadEgreso;
        this.matricula = matricula;
        this.carreraEgreso = carreraEgreso;
        this.modalidadIngreso = modalidadIngreso;
        this.modalidadActual = modalidadActual;
        this.tecnologiasAplicadas = tecnologiasAplicadas;
        this.fechaIngreso = fechaIngreso;
        this.fechaEgreso = fechaEgreso;
        this.contrasena = contrasena;
        this.rol = rol;
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getCuatrimestreIngreso() {
        return cuatrimestreIngreso;
    }

    public void setCuatrimestreIngreso(int cuatrimestreIngreso) {
        this.cuatrimestreIngreso = cuatrimestreIngreso;
    }

    public int getCuatrimestreActual() {
        return cuatrimestreActual;
    }

    public void setCuatrimestreActual(int cuatrimestreActual) {
        this.cuatrimestreActual = cuatrimestreActual;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getHorarioLabores() {
        return horarioLabores;
    }

    public void setHorarioLabores(String horarioLabores) {
        this.horarioLabores = horarioLabores;
    }

    public String getCorreoInstitucional() {
        return correoInstitucional;
    }

    public void setCorreoInstitucional(String correoInstitucional) {
        this.correoInstitucional = correoInstitucional;
    }

    public String getCorreoPersonal() {
        return correoPersonal;
    }

    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    public String getTelefonoCelular() {
        return telefonoCelular;
    }

    public void setTelefonoCelular(String telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }

    public String getTelefonoCasa() {
        return telefonoCasa;
    }

    public void setTelefonoCasa(String telefonoCasa) {
        this.telefonoCasa = telefonoCasa;
    }

    public String getUniversidadEgreso() {
        return universidadEgreso;
    }

    public void setUniversidadEgreso(String universidadEgreso) {
        this.universidadEgreso = universidadEgreso;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCarreraEgreso() {
        return carreraEgreso;
    }

    public void setCarreraEgreso(String carreraEgreso) {
        this.carreraEgreso = carreraEgreso;
    }

    public String getModalidadIngreso() {
        return modalidadIngreso;
    }

    public void setModalidadIngreso(String modalidadIngreso) {
        this.modalidadIngreso = modalidadIngreso;
    }

    public String getModalidadActual() {
        return modalidadActual;
    }

    public void setModalidadActual(String modalidadActual) {
        this.modalidadActual = modalidadActual;
    }

    public String getTecnologiasAplicadas() {
        return tecnologiasAplicadas;
    }

    public void setTecnologiasAplicadas(String tecnologiasAplicadas) {
        this.tecnologiasAplicadas = tecnologiasAplicadas;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getFechaEgreso() {
        return fechaEgreso;
    }

    public void setFechaEgreso(String fechaEgreso) {
        this.fechaEgreso = fechaEgreso;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    @Override
    public String toString() {
        return "BeanUsuario{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", primerApellido='" + primerApellido + '\'' +
                ", segundoApellido='" + segundoApellido + '\'' +
                ", fechaNacimiento='" + fechaNacimiento + '\'' +
                ", cuatrimestreIngreso=" + cuatrimestreIngreso +
                ", cuatrimestreActual=" + cuatrimestreActual +
                ", estatus='" + estatus + '\'' +
                ", horarioLabores='" + horarioLabores + '\'' +
                ", correoInstitucional='" + correoInstitucional + '\'' +
                ", correoPersonal='" + correoPersonal + '\'' +
                ", telefonoCelular='" + telefonoCelular + '\'' +
                ", telefonoCasa='" + telefonoCasa + '\'' +
                ", universidadEgreso='" + universidadEgreso + '\'' +
                ", matricula='" + matricula + '\'' +
                ", carreraEgreso='" + carreraEgreso + '\'' +
                ", modalidadIngreso='" + modalidadIngreso + '\'' +
                ", modalidadActual='" + modalidadActual + '\'' +
                ", tecnologiasAplicadas='" + tecnologiasAplicadas + '\'' +
                ", fechaIngreso='" + fechaIngreso + '\'' +
                ", fechaEgreso='" + fechaEgreso + '\'' +
                ", contrasena='" + contrasena + '\'' +
                ", rol='" + rol + '\'' +
                '}';
    }
}
