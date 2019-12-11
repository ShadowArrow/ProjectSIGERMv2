package com.utez.edu.mx.servicios.service;

import com.utez.edu.mx.connection.Conexion;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceEmail {

    private static String tokenTemp;
    private static String mailTemp;

    public boolean EnviarCorreo(BeanMail beanMail){
        Boolean respuesta = false;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(beanMail.getDe(), beanMail.getContrasena());
                    }
                });

        try {
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(new DataHandler(new FileDataSource("C:/Users/yoshi/OneDrive/Documents/universidad/7° Cuatrimestre/ProjectSIGERM/web/img/cds.png")));
            adjunto.setFileName("cds.png");

            BodyPart texto = new MimeBodyPart();
            texto.setText(beanMail.getMensaje() + beanMail.getToken());

            MimeMultipart multiParte = new MimeMultipart();

            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(beanMail.getDe()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(beanMail.getPara()));
            message.setSubject(beanMail.getAsunto());
            message.setContent(multiParte);

            this.tokenTemp = beanMail.getToken();
            this.mailTemp = beanMail.getPara();

            Transport.send(message);
            respuesta = true;
        } catch (MessagingException e) {
            respuesta = false;
            throw new RuntimeException(e);
        }
        return respuesta;
    }

    public boolean VerificarToken(BeanMail beanMail){
        if(beanMail.getToken().equals(this.tokenTemp)){
            tokenTemp = "";
            return true;
        }else{
            return false;
        }
    }

    public boolean ModificarContrasenaCorreo(BeanMail beanMail){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        System.out.println("mailTemp: " + mailTemp);
        System.out.println("contraseña: " + beanMail.getContrasena());
        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call modificar_contrasena_correo (?,?)}");
            stmt.setString(1,mailTemp);
            stmt.setString(2,beanMail.getContrasena());
            num = stmt.executeUpdate();

            System.out.println("call de procedimiento: " + stmt);

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al modificar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    beanMail = new BeanMail();
                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase ServiceEmail: en el metodo ModificarContrasenaCorreo");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean CorreoExiste(BeanMail beanMail){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call correo_existe (?)}");
            stmt.setString(1,beanMail.getPara());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
             num = rs.getInt("num");
            }
            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al consultar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase ServiceEmail: en el metodo CorreoExiste");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }
}
