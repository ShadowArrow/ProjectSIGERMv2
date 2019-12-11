package com.utez.edu.mx.domains.proyecto.model;

import com.utez.edu.mx.connection.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProyectoDao {

    private Connection conexion;
    private PreparedStatement pstm;
    private ResultSet rs;

    final private String SQL_CONSULTAR_PROYECTOS = "SELECT * FROM Proyecto;";
    final private String SQL_CONSULTAR_PROYECTO_POR_ID = "SELECT * FROM Proyecto WHERE id_proyecto = ?;";
    final private String SQL_REGISTRAR_PROYECTO = "INSERT INTO Proyecto (identificador, nombre, descripcion, nombre_cliente, correo_cliente, telefono_cliente, direccion_cliente, fecha_inicio, fecha_fin, estatus) VALUES (?,?,?,?,?,?,?,?,?,?);";
    final private String SQL_MODIFICAR_PROYECTO = "UPDATE Proyecto SET  identificador= ?, nombre= ?, descripcion= ?, nombre_cliente= ?, correo_cliente= ?, telefono_cliente= ?, direccion_cliente= ?, fecha_inicio= ?, fecha_fin= ? WHERE id_proyecto = ?;";
    final private String SQL_ELIMINAR_PROYECTO = "UPDATE Proyecto SET  estatus= 'Inactivo' WHERE id_proyecto = ?;";
    final private String SQL_ACTIVAR_PROYECTO = "UPDATE Proyecto SET  estatus= 'Activo' WHERE id_proyecto = ?;";
    //final private String SQL_ELIMINAR_PROYECTO = "UPDATE Proyecto P INNER JOIN Asignacion A on P.id_proyecto = A.id_proyecto SET  P.estatus= 'Inactivo' WHERE P.id_proyecto = ? AND A.estatus = 'Inactivo' OR A.id_proyecto IS NULL;";
    //final private String SQL_ACTIVAR_PROYECTO = "UPDATE Proyecto P INNER JOIN Asignacion A on P.id_proyecto = A.id_proyecto SET  P.estatus= 'Activo' WHERE P.id_proyecto = ? AND A.estatus = 'Inactivo' OR A.id_proyecto IS NULL;";

    public List<ProyectoBean> consultarProyectos() {
        List<ProyectoBean> lista = new ArrayList();
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_CONSULTAR_PROYECTOS);
            rs = pstm.executeQuery();
            while (rs.next()) {
                ProyectoBean bean = new ProyectoBean();

                bean.setId(rs.getInt(1));
                bean.setIdentificador(rs.getString(2));
                bean.setNombre(rs.getString(3));
                bean.setDescripcion(rs.getString(4));
                bean.setNombreCliente(rs.getString(5));
                bean.setCorreoCliente(rs.getString(6));
                bean.setTelefonoCliente(rs.getString(7));
                bean.setDireccionCliente(rs.getString(8));
                bean.setFechaInicio(rs.getString(9));
                bean.setFechaFin(rs.getString(10));
                bean.setEstatus(rs.getString(11));
                lista.add(bean);
            }
        } catch (Exception e) {
            System.out.println("Error en método consultarProyectos() del DaoProyecto -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return lista;
    }

    public ProyectoBean consultarProyectoPorId(int idProyecto) {
        ProyectoBean bean = null;
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_CONSULTAR_PROYECTO_POR_ID);
            pstm.setInt(1, idProyecto);
            rs = pstm.executeQuery();
            if (rs.next()) {
                bean = new ProyectoBean();

                bean.setId(rs.getInt(1));
                bean.setIdentificador(rs.getString(2));
                bean.setNombre(rs.getString(3));
                bean.setDescripcion(rs.getString(4));
                bean.setNombreCliente(rs.getString(5));
                bean.setCorreoCliente(rs.getString(6));
                bean.setTelefonoCliente(rs.getString(7));
                bean.setDireccionCliente(rs.getString(8));
                bean.setFechaInicio(rs.getString(9));
                bean.setFechaFin(rs.getString(10));
                bean.setEstatus(rs.getString(11));
            }
        } catch (Exception e) {
            System.out.println("Error en método consultarProyectoPorId() del DaoProyecto -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return bean;
    }

    public boolean registrarProyecto(ProyectoBean bean) {
        boolean resultado = false;
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_REGISTRAR_PROYECTO);
            pstm.setString(1, bean.getIdentificador());
            pstm.setString(2, bean.getNombre());
            pstm.setString(3, bean.getDescripcion());
            pstm.setString(4, bean.getNombreCliente());
            pstm.setString(5, bean.getCorreoCliente());
            pstm.setString(6, bean.getTelefonoCliente());
            pstm.setString(7, bean.getDireccionCliente());
            pstm.setString(8, bean.getFechaInicio());
            pstm.setString(9, bean.getFechaFin());
            pstm.setString(10, "Activo");
            resultado = pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en método registrarProyecto() del DaoProyecto -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    public boolean modificarProyecto(ProyectoBean bean) {
        boolean resultado = false;
        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_MODIFICAR_PROYECTO);
            pstm.setString(1, bean.getIdentificador());
            pstm.setString(2, bean.getNombre());
            pstm.setString(3, bean.getDescripcion());
            pstm.setString(4, bean.getNombreCliente());
            pstm.setString(5, bean.getCorreoCliente());
            pstm.setString(6, bean.getTelefonoCliente());
            pstm.setString(7, bean.getDireccionCliente());
            pstm.setString(8, bean.getFechaInicio());
            pstm.setString(9, bean.getFechaFin());
            pstm.setInt(10, bean.getId());
            resultado = pstm.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error en método modificarProyecto() del DaoProyecto -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    public boolean eliminarProyecto(int idProyecto) {
        boolean resultado = false;

        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_ELIMINAR_PROYECTO);
            pstm.setInt(1, idProyecto);
            resultado = pstm.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error en método eliminarProyecto() del DaoProyecto -> " + e.getMessage());
        } finally {
            cerrar();
        }
        return resultado;
    }

    public boolean activarProyecto(int idProyecto) {
        boolean resultado = false;

        try {
            conexion = Conexion.getConexion();
            pstm = conexion.prepareStatement(SQL_ACTIVAR_PROYECTO);
            pstm.setInt(1, idProyecto);
            resultado = pstm.executeUpdate() == 1;
        } catch (Exception e) {
            System.out.println("Error en método activarProyecto() del DaoProyecto -> " + e.getMessage());
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
