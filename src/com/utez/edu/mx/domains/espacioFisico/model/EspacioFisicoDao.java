package com.utez.edu.mx.domains.espacioFisico.model;

import com.utez.edu.mx.connection.Conexion;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EspacioFisicoDao {

    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;

    final private String SQL_CONSULTAR_ESPACIO_FISICO_POR_ID = "SELECT * FROM EspacioFisico INNER JOIN Usuario U on EspacioFisico.id_usuario = U.id_usuario WHERE id_espacio_fisico = ?;";
    final private String SQL_CONSULTAR_ESPACIO_FISICOS = "SELECT * FROM EspacioFisico INNER JOIN Usuario U on EspacioFisico.id_usuario = U.id_usuario;";
    final private String SQL_REGISTRAR_ESPACIO_FISICO = "INSERT INTO EspacioFisico (nombre, numero, descripcion, id_usuario, estatus, tipo, posicion) VALUES (?,?,?,?,?,?,?);;";
    final private String SQL_MODIFICAR_ESPACIO_FISICO = "UPDATE EspacioFisico SET nombre = ?, numero = ?, descripcion = ?, id_usuario = ?, tipo = ?, posicion = ? WHERE id_espacio_fisico = ?;";
    final private String SQL_ELIMINAR_ESPACIO_FISICO = "UPDATE EspacioFisico SET  estatus= 'Inactivo' WHERE id_espacio_fisico = ?;";
    final private String SQL_ACTIVAR_ESPACIO_FISICO = "UPDATE EspacioFisico SET  estatus= 'Activo' WHERE id_espacio_fisico = ?;";

    public List<EspacioFisicoBean> consultarEspacioFisicos() {
        List<EspacioFisicoBean> lista = new ArrayList();
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_CONSULTAR_ESPACIO_FISICOS);
            rs = pstm.executeQuery();
            while (rs.next()) {
                EspacioFisicoBean bean = new EspacioFisicoBean();
                BeanUsuario usuario = new BeanUsuario();

                bean.setId_espacio_fisico(rs.getInt(1));
                bean.setNombre(rs.getString(2));
                bean.setNumero(rs.getInt(3));
                bean.setDescripcion(rs.getString(4));
                bean.setEstatus(rs.getString(6));
                bean.setTipo(rs.getString(7));
                bean.setPosicion(rs.getInt(8));

                usuario.setId(rs.getInt(9));
                usuario.setNombre(rs.getString(10));
                usuario.setPrimerApellido(rs.getString(11));
                usuario.setSegundoApellido(rs.getString(12));

                bean.setUsuario(usuario);

                lista.add(bean);
            }
        } catch (Exception e) {
            System.out.println("Error en método consultarEspacioFisicos() del DaoEspacioFisico -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return lista;
    }

    public EspacioFisicoBean consultarEspacioFisicoPorId(int idEspacioFisico)  {
        System.out.println("Llega al meetood de consulta por uid" + idEspacioFisico);
        EspacioFisicoBean bean = null;
        BeanUsuario usuario = null;
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_CONSULTAR_ESPACIO_FISICO_POR_ID);
            pstm.setInt(1, idEspacioFisico);
            rs = pstm.executeQuery();
            System.out.println("Antes");
            if (rs.next()) {
                bean = new EspacioFisicoBean();
                bean.setId_espacio_fisico(rs.getInt(1));
                bean.setNombre(rs.getString(2));
                bean.setNumero(rs.getInt(3));
                bean.setDescripcion(rs.getString(4));
                bean.setEstatus(rs.getString(6));
                bean.setTipo(rs.getString(7));
                bean.setPosicion(rs.getInt(8));

                usuario = new BeanUsuario();
                usuario.setId(rs.getInt(9));
                usuario.setNombre(rs.getString(10));
                usuario.setPrimerApellido(rs.getString(11));
                usuario.setSegundoApellido(rs.getString(12));
                bean.setUsuario(usuario);
            }
            System.out.println("Afuera");
        } catch (SQLException e) {
            System.out.println("Error en método consultarEspacioFisicoPorId() del DaoEspacioFisico -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return bean;
    }

    public boolean registrarEspacioFisico(EspacioFisicoBean bean) {
        System.out.println("Se recibe este bean" + bean.toString());
        boolean resultado = false;
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_REGISTRAR_ESPACIO_FISICO);
            if (bean.getTipo().equals("oficina")) {
                pstm.setString(1, bean.getNombre());
                pstm.setInt(2, bean.getNumero());
                pstm.setString(3, bean.getDescripcion());
                pstm.setInt(4, bean.getUsuario().getId());
                pstm.setString(5, "Activo");
                pstm.setString(6, bean.getTipo());
                pstm.setInt(7, bean.getPosicion());
                resultado = pstm.executeUpdate() == 1;
                System.out.println("Resultado de oficina" + resultado);
            } else if (bean.getTipo().equals("isla")) {
                for (int i = 1; i < 5; i++) {
                    pstm.setString(1, bean.getNombre());
                    pstm.setInt(2, bean.getNumero());
                    pstm.setString(3, bean.getDescripcion());
                    pstm.setInt(4, bean.getUsuario().getId());
                    pstm.setString(5, "Activo");
                    pstm.setString(6, bean.getTipo());
                    pstm.setInt(7, i);
                    resultado = pstm.executeUpdate() == 1;
                    System.out.println("Resultado de isla" + resultado);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en método registrarEspacioFisico() del DaoEspacioFisico -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    public boolean modificarEspacioFisico(EspacioFisicoBean bean) {
        System.out.println(bean.toString());
        boolean resultado = false;
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_MODIFICAR_ESPACIO_FISICO);
            pstm.setString(1, bean.getNombre());
            pstm.setInt(2, bean.getNumero());
            pstm.setString(3, bean.getDescripcion());
            pstm.setInt(4, bean.getUsuario().getId());
            pstm.setString(5, bean.getTipo());
            pstm.setInt(6, bean.getPosicion());
            pstm.setInt(7, bean.getId_espacio_fisico());
            System.out.println("Resultado antes" + resultado);
            resultado = pstm.executeUpdate() == 1;
            System.out.println("Resultado despues" + resultado);
        } catch (Exception e) {
            System.out.println("Error en método modificarEspacioFisico() del DaoEspacioFisico -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    public boolean eliminarEspacioFisico(int idEspacioFisico) {
        boolean resultado = false;
        System.out.println("Id recibido para borrar ****" + idEspacioFisico);
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_ELIMINAR_ESPACIO_FISICO);
            pstm.setInt(1, idEspacioFisico);
            resultado = pstm.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error en método eliminarEspacioFisico() del DaoEspacioFisico -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    public boolean activarEspacioFisico(int idEspacioFisico) {
        boolean resultado = false;

        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_ACTIVAR_ESPACIO_FISICO);
            pstm.setInt(1, idEspacioFisico);
            resultado = pstm.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error en método activarEspacioFisico() del DaoEspacioFisico -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    private void cerrar() {
        try {
            if (conexion != null) {
                conexion.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar conexion -> " + e.getMessage());
        }
    }

}
