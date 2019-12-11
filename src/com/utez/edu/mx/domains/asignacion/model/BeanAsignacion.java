package com.utez.edu.mx.domains.asignacion.model;

import com.utez.edu.mx.domains.bien.model.BeanBien;
import com.utez.edu.mx.domains.espacioFisico.model.EspacioFisicoBean;
import com.utez.edu.mx.domains.proyecto.model.ProyectoBean;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;

public class BeanAsignacion {
    private int id_asignacion;
    private BeanBien bien;
    private EspacioFisicoBean espacioFisico;
    private BeanUsuario usuarioResponsable;
    private BeanUsuario usuarioUtiliza;
    private ProyectoBean proyecto;
    private String estatus;

    public BeanAsignacion() {
    }

    public BeanAsignacion(int id_asignacion, BeanBien bien, EspacioFisicoBean espacioFisico, BeanUsuario usuarioResponsable, BeanUsuario usuarioUtiliza, ProyectoBean proyecto, String estatus) {
        this.id_asignacion = id_asignacion;
        this.bien = bien;
        this.espacioFisico = espacioFisico;
        this.usuarioResponsable = usuarioResponsable;
        this.usuarioUtiliza = usuarioUtiliza;
        this.proyecto = proyecto;
        this.estatus = estatus;
    }

    public int getId_asignacion() {
        return id_asignacion;
    }

    public void setId_asignacion(int id_asignacion) {
        this.id_asignacion = id_asignacion;
    }

    public BeanBien getBien() {
        return bien;
    }

    public void setBien(BeanBien bien) {
        this.bien = bien;
    }

    public EspacioFisicoBean getEspacioFisico() {
        return espacioFisico;
    }

    public void setEspacioFisico(EspacioFisicoBean espacioFisico) {
        this.espacioFisico = espacioFisico;
    }

    public BeanUsuario getUsuarioResponsable() {
        return usuarioResponsable;
    }

    public void setUsuarioResponsable(BeanUsuario usuarioResponsable) {
        this.usuarioResponsable = usuarioResponsable;
    }

    public BeanUsuario getUsuarioUtiliza() {
        return usuarioUtiliza;
    }

    public void setUsuarioUtiliza(BeanUsuario usuarioUtiliza) {
        this.usuarioUtiliza = usuarioUtiliza;
    }

    public ProyectoBean getProyecto() {
        return proyecto;
    }

    public void setProyecto(ProyectoBean proyecto) {
        this.proyecto = proyecto;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }
}
