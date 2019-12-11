package com.utez.edu.mx.domains.espacioFisico.model;

import com.utez.edu.mx.domains.usuario.model.BeanUsuario;
import com.utez.edu.mx.domains.usuario.model.DAOUsuario;

public class Pruebas {
    public static void main(String[] args) {
        System.out.println("Se inicio la prueba");
        DAOUsuario daoUsuario = new DAOUsuario();
        BeanUsuario usuario = new BeanUsuario();
        usuario.setId(1);
        usuario = daoUsuario.MostrarUsuarioId(usuario);
        System.out.println("usuario" + usuario);

        EspacioFisicoBean bean = new EspacioFisicoBean();
        bean.setId_espacio_fisico(2);
        bean.setNombre("w");
        bean.setNumero(4);
        bean.setDescripcion("w");
        bean.setUsuario(usuario);
        bean.setEstatus("w");
        bean.setTipo("Isla");
        EspacioFisicoDao espacioFisicoDao = new EspacioFisicoDao();
        espacioFisicoDao.registrarEspacioFisico(bean);
        System.out.println("Hola");

        //espacioFisicoDao.consultarEspacioFisicoPorId(1).toString();
        //System.out.println(espacioFisicoDao.consultarEspacioFisicoPorId(1).toString());

        espacioFisicoDao.consultarEspacioFisicos();
        //espacioFisicoDao.modificarEspacioFisico(bean);
        //espacioFisicoDao.registrarEspacioFisico(bean);
        //espacioFisicoDao.consultarEspacioFisicos();
        //espacioFisicoDao.eliminarEspacioFisico(2);
        //espacioFisicoDao.eliminarEspacioFisico(3);
        //espacioFisicoDao.activarEspacioFisico(1);
        //espacioFisicoDao.consultarEspacioFisicos();
        //System.out.println(espacioFisicoDao.consultarEspacioFisicoPorId(1).toString());


    }
}
