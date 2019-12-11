package com.utez.edu.mx.domains.usuario.model;

import com.utez.edu.mx.connection.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOUsuario {
    public BeanUsuario IniciarSesion(BeanUsuario bean){
        Connection con = null;

        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call inicio_sesion(?,?)");
            stmt.setString(1,bean.getCorreoInstitucional());
            stmt.setString(2,bean.getContrasena());
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            bean = new BeanUsuario();
            while (rs.next()) {
                bean.setId(rs.getInt("id_usuario"));
                bean.setNombre(rs.getString("nombre"));
                bean.setPrimerApellido(rs.getString("primer_apellido"));
                bean.setSegundoApellido(rs.getString("segundo_apellido"));
                bean.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                bean.setSexo(rs.getString("sexo"));
                bean.setRfc(rs.getString("rfc"));
                bean.setCuatrimestreIngreso(rs.getInt("cuatrimestre_ingreso"));
                bean.setCuatrimestreActual(rs.getInt("cuatrimestre_actual"));
                bean.setEstatus(rs.getString("estatus"));
                bean.setHorarioLabores(rs.getString("horario_labores"));
                bean.setCorreoInstitucional(rs.getString("correo_institucional"));
                bean.setCorreoPersonal(rs.getString("correo_personal"));
                bean.setContrasena(rs.getString("contrasena"));
                bean.setTelefonoCelular(rs.getString("telefono_celular"));
                bean.setTelefonoCasa(rs.getString("telefono_casa"));
                bean.setUniversidadEgreso(rs.getString("universidad_egreso"));
                bean.setMatricula(rs.getString("matricula"));
                bean.setCarreraEgreso(rs.getString("carrera_egreso"));
                bean.setModalidadIngreso(rs.getString("modalidad_ingreso"));
                bean.setModalidadActual(rs.getString("modalidad_actual"));
                bean.setTecnologiasAplicadas(rs.getString("tecnologias_aplicadas"));
                bean.setFechaIngreso(rs.getString("fecha_ingreso"));
                bean.setFechaEgreso(rs.getString("fecha_egreso"));
                bean.setRol(rs.getString("rol"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consultar los usuarios: " + e.getMessage());
            e.printStackTrace();
        }
        return bean;
    }

    public BeanUsuario ConfirmarUsuario(BeanUsuario bean){
        Connection con = null;

        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call inicio_sesion(?,?)");
            stmt.setString(1,bean.getCorreoInstitucional());
            stmt.setString(2,bean.getContrasena());
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            bean = new BeanUsuario();
            while (rs.next()) {
                bean.setCorreoInstitucional(rs.getString("correo_institucional"));
                bean.setContrasena(rs.getString("contrasena"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consultar los usuarios: " + e.getMessage());
            e.printStackTrace();
        }

        return bean;
    }

    public List<BeanUsuario> MostraUsuarios(){
        Connection con = null;
        BeanUsuario bean = new BeanUsuario();
        List<BeanUsuario> listUsuario = new ArrayList<BeanUsuario>();
        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call mostrar_usuarios()");
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                bean = new BeanUsuario();
                bean.setId(rs.getInt("id_usuario"));
                bean.setNombre(rs.getString("nombre"));
                bean.setPrimerApellido(rs.getString("primer_apellido"));
                bean.setSegundoApellido(rs.getString("segundo_apellido"));
                bean.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                bean.setSexo(rs.getString("sexo"));
                bean.setRfc(rs.getString("rfc"));
                bean.setCuatrimestreIngreso(rs.getInt("cuatrimestre_ingreso"));
                bean.setCuatrimestreActual(rs.getInt("cuatrimestre_actual"));
                bean.setEstatus(rs.getString("estatus"));
                bean.setHorarioLabores(rs.getString("horario_labores"));
                bean.setCorreoInstitucional(rs.getString("correo_institucional"));
                bean.setCorreoPersonal(rs.getString("correo_personal"));
                bean.setContrasena(rs.getString("contrasena"));
                bean.setTelefonoCelular(rs.getString("telefono_celular"));
                bean.setTelefonoCasa(rs.getString("telefono_casa"));
                bean.setUniversidadEgreso(rs.getString("universidad_egreso"));
                bean.setMatricula(rs.getString("matricula"));
                bean.setCarreraEgreso(rs.getString("carrera_egreso"));
                bean.setModalidadIngreso(rs.getString("modalidad_ingreso"));
                bean.setModalidadActual(rs.getString("modalidad_actual"));
                bean.setTecnologiasAplicadas(rs.getString("tecnologias_aplicadas"));
                bean.setFechaIngreso(rs.getString("fecha_ingreso"));
                bean.setFechaEgreso(rs.getString("fecha_egreso"));
                bean.setRol(rs.getString("rol"));

                System.out.println("estatus antes de almacenarlo en la lista: " + bean.getEstatus());

                listUsuario.add(bean);
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consultar los usuarios: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("Nombre del usuario consultado: " + bean.getNombre());
        return listUsuario;
    }

    public boolean RegistrarUsuario(BeanUsuario bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call registrar_usuarios (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.setString(1,bean.getNombre());
            stmt.setString(2,bean.getPrimerApellido());
            stmt.setString(3,bean.getSegundoApellido());
            stmt.setString(4,bean.getFechaNacimiento());
            stmt.setString(5, bean.getSexo());
            stmt.setString(6,bean.getRfc());
            stmt.setInt(7,bean.getCuatrimestreIngreso());
            stmt.setInt(8, bean.getCuatrimestreActual());
            stmt.setString(9,bean.getEstatus());
            stmt.setString(10,bean.getHorarioLabores());
            stmt.setString(11,bean.getCorreoInstitucional());
            stmt.setString(12,bean.getCorreoPersonal());
            stmt.setString(13,bean.getContrasena());
            stmt.setString(14,bean.getTelefonoCelular());
            stmt.setString(15,bean.getTelefonoCasa());
            stmt.setString(16,bean.getUniversidadEgreso());
            stmt.setString(17, bean.getMatricula());
            stmt.setString(18,bean.getCarreraEgreso());
            stmt.setString(19,bean.getModalidadIngreso());
            stmt.setString(20, bean.getModalidadActual());
            stmt.setString(21,bean.getTecnologiasAplicadas());
            stmt.setString(22,bean.getFechaIngreso());
            stmt.setString(23,bean.getFechaEgreso());
            stmt.setString(24,bean.getRol());

            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al ingresar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAODocente: en el metodo RegistrarDocente");
            }

        }
        if (num == -1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean ModificarUsuario(BeanUsuario bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call modificar_usuarios (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.setInt(1,bean.getId());
            stmt.setString(2,bean.getNombre());
            stmt.setString(3,bean.getPrimerApellido());
            stmt.setString(4,bean.getSegundoApellido());
            stmt.setString(5,bean.getFechaNacimiento());
            stmt.setString(6,bean.getSexo());
            stmt.setString(7,bean.getRfc());
            stmt.setInt(8,bean.getCuatrimestreIngreso());
            stmt.setInt(9, bean.getCuatrimestreActual());
            stmt.setString(10,bean.getEstatus());
            stmt.setString(11,bean.getHorarioLabores());
            stmt.setString(12,bean.getCorreoInstitucional());
            stmt.setString(13,bean.getCorreoPersonal());
            stmt.setString(14,bean.getContrasena());
            stmt.setString(15,bean.getTelefonoCelular());
            stmt.setString(16,bean.getTelefonoCasa());
            stmt.setString(17,bean.getUniversidadEgreso());
            stmt.setString(18, bean.getMatricula());
            stmt.setString(19,bean.getCarreraEgreso());
            stmt.setString(20,bean.getModalidadIngreso());
            stmt.setString(21, bean.getModalidadActual());
            stmt.setString(22,bean.getTecnologiasAplicadas());
            stmt.setString(23,bean.getFechaIngreso());
            stmt.setString(24,bean.getFechaEgreso());
            stmt.setString(25,bean.getRol());

            System.out.println("procedimiento almacenado: " + stmt);
            num = stmt.executeUpdate();

            System.out.println("numero procedimiento: " + num);

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al modificar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAODocente: en el metodo ModificarDocente");
            }

        }
        if (num == -1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public BeanUsuario MostrarUsuarioId(BeanUsuario bean){
        Connection con = null;

        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call mostrar_usuario_id(?)");
            stmt.setInt(1,bean.getId());
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            bean = new BeanUsuario();
            while (rs.next()) {
                bean.setId(rs.getInt("id_usuario"));
                bean.setNombre(rs.getString("nombre"));
                bean.setPrimerApellido(rs.getString("primer_apellido"));
                bean.setSegundoApellido(rs.getString("segundo_apellido"));
                bean.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                bean.setSexo(rs.getString("sexo"));
                bean.setRfc(rs.getString("rfc"));
                bean.setCuatrimestreIngreso(rs.getInt("cuatrimestre_ingreso"));
                bean.setCuatrimestreActual(rs.getInt("cuatrimestre_actual"));
                bean.setEstatus(rs.getString("estatus"));
                bean.setHorarioLabores(rs.getString("horario_labores"));
                bean.setCorreoInstitucional(rs.getString("correo_institucional"));
                bean.setCorreoPersonal(rs.getString("correo_personal"));
                bean.setContrasena(rs.getString("contrasena"));
                bean.setTelefonoCelular(rs.getString("telefono_celular"));
                bean.setTelefonoCasa(rs.getString("telefono_casa"));
                bean.setUniversidadEgreso(rs.getString("universidad_egreso"));
                bean.setMatricula(rs.getString("matricula"));
                bean.setCarreraEgreso(rs.getString("carrera_egreso"));
                bean.setModalidadIngreso(rs.getString("modalidad_ingreso"));
                bean.setModalidadActual(rs.getString("modalidad_actual"));
                bean.setTecnologiasAplicadas(rs.getString("tecnologias_aplicadas"));
                bean.setFechaIngreso(rs.getString("fecha_ingreso"));
                bean.setFechaEgreso(rs.getString("fecha_egreso"));
                bean.setRol(rs.getString("rol"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consultar los usuarios: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("Nombre del usuario consultado: " + bean.getNombre());
        return bean;
    }

    public boolean EliminarUsuario(BeanUsuario bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call desactivar_usuario(?)}");
            stmt.setInt(1,bean.getId());
            System.out.println("Id del usuario: " + bean.getId());
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al ingresar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAODocente: en el metodo RegistrarDocente");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean ActivarUsuario(BeanUsuario bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call activar_usuario(?)}");
            stmt.setInt(1,bean.getId());
            System.out.println("Id del usuario: " + bean.getId());
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al ingresar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAODocente: en el metodo RegistrarDocente");
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
