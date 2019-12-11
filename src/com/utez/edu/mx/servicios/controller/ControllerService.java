package com.utez.edu.mx.servicios.controller;
import com.opensymphony.xwork2.ActionSupport;
import com.utez.edu.mx.servicios.service.BeanMail;
import com.utez.edu.mx.servicios.service.ServiceEmail;

// lo unico que cambia de un controller con strust2 normal a uno asincrono es que se debe de poner el extends ActionSupport

public class ControllerService extends ActionSupport {
    private ServiceEmail serviceEmail = new ServiceEmail();
    private BeanMail beanMail = new BeanMail();

    public ServiceEmail getServiceEmail() {
        return serviceEmail;
    }

    public void setServiceEmail(ServiceEmail serviceEmail) {
        this.serviceEmail = serviceEmail;
    }

    public BeanMail getBeanMail() {
        return beanMail;
    }

    public void setBeanMail(BeanMail beanMail) {
        this.beanMail = beanMail;
    }

    public String EnviarEmail(){
        int numero;
        numero = (int) (Math.random() * 999999) + 111111;

        beanMail.setDe("sigermcds@gmail.com");
        beanMail.setContrasena("sigerm_CDS");
        beanMail.setAsunto("Recuperación de contraseña.");
        beanMail.setMensaje("Se ha solicitado el cambio de contraseña de tu cuenta, si no lo haz hecho ignora este mensaje \n \n Tu token es: ");
        beanMail.setToken(numero+"");

        if(serviceEmail.EnviarCorreo(beanMail)){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }

    public  String VerificarToken(){
        if(serviceEmail.VerificarToken(beanMail)){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }

    public String CambiarContrasena(){
        if(serviceEmail.ModificarContrasenaCorreo(beanMail)){
            return SUCCESS;
        }else {
            return ERROR;
        }
    }

    public String CorreoExiste(){
        if(serviceEmail.CorreoExiste(beanMail)){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }
}
