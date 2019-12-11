package com.utez.edu.mx.servicios.service;

public class BeanMail {
    private String para;
    private String token;
    private String de;
    private String contrasena;
    private String mensaje;
    private String asunto;

    public BeanMail() {

    }

    public BeanMail(String para, String token, String de, String contrasena, String tipoMensaje, String mensaje, String asunto) {
        this.para = para;
        this.token = token;
        this.de = de;
        this.contrasena = contrasena;
        this.mensaje = mensaje;
        this.asunto = asunto;
    }

    public String getPara() {
        return para;
    }

    public void setPara(String para) {
        this.para = para;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getDe() {
        return de;
    }

    public void setDe(String de) {
        this.de = de;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
}
