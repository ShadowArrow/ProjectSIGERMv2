package com.utez.edu.mx.domains.asignacion.model;

import com.utez.edu.mx.connection.Conexion;
import com.utez.edu.mx.domains.bien.model.BeanBien;
import com.utez.edu.mx.domains.espacioFisico.model.EspacioFisicoBean;
import com.utez.edu.mx.domains.proyecto.model.ProyectoBean;
import com.utez.edu.mx.domains.rol.model.BeanRol;
import com.utez.edu.mx.domains.usuario.model.BeanUsuario;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOAsignacion {

    public List<BeanAsignacion> MostraAsignaciones(){
        Connection con = null;
        BeanAsignacion bean = new BeanAsignacion();
        BeanUsuario usuario;
        BeanRol rol;
        EspacioFisicoBean espacioFisico;
        BeanBien bien;
        ProyectoBean proyecto;
        List<BeanAsignacion> listAsignacion = new ArrayList<BeanAsignacion>();
        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call mostrar_asignaciones()");
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                bean = new BeanAsignacion();
                bean.setId_asignacion(rs.getInt("Asignacion.id_asignacion"));

                bien = new BeanBien();
                bien.setId_bien(rs.getInt("Bien.id_bien"));
                bien.setCodigo_inventario(rs.getString("Bien.codigo_inventario"));
                bien.setNombre(rs.getString("Bien.nombre"));
                bien.setDescripcion(rs.getString("Bien.descripcion"));
                bien.setPrecio(rs.getString("Bien.precio"));
                bien.setMarca(rs.getString("Bien.marca"));
                bien.setModelo(rs.getString("Bien.modelo"));
                bien.setNo_serie(rs.getString("Bien.no_serie"));
                bien.setEstatus(rs.getString("Bien.estatus"));
                bean.setBien(bien);

                espacioFisico = new EspacioFisicoBean();
                espacioFisico.setId_espacio_fisico(rs.getInt("EspacioFisico.id_espacio_fisico"));
                espacioFisico.setNombre(rs.getString("EspacioFisico.nombre"));
                espacioFisico.setNumero(rs.getInt("EspacioFisico.numero"));
                espacioFisico.setDescripcion(rs.getString("EspacioFisico.descripcion"));
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("Responsable.id_usuario"));
                usuario.setNombre(rs.getString("Responsable.nombre"));
                usuario.setPrimerApellido(rs.getString("Responsable.primer_apellido"));
                usuario.setSegundoApellido(rs.getString("Responsable.segundo_apellido"));
                usuario.setFechaNacimiento(rs.getString("Responsable.fecha_nacimiento"));
                usuario.setCuatrimestreIngreso(rs.getInt("Responsable.cuatrimestre_ingreso"));
                usuario.setCuatrimestreActual(rs.getInt("Responsable.cuatrimestre_actual"));
                usuario.setEstatus(rs.getString("Responsable.estatus"));
                usuario.setHorarioLabores(rs.getString("Responsable.horario_labores"));
                usuario.setCorreoInstitucional(rs.getString("Responsable.correo_institucional"));
                usuario.setCorreoPersonal(rs.getString("Responsable.correo_personal"));
                usuario.setContrasena(rs.getString("Responsable.contrasena"));
                usuario.setTelefonoCelular(rs.getString("Responsable.telefono_celular"));
                usuario.setTelefonoCasa(rs.getString("Responsable.telefono_casa"));
                usuario.setUniversidadEgreso(rs.getString("Responsable.universidad_egreso"));
                usuario.setMatricula(rs.getString("Responsable.matricula"));
                usuario.setCarreraEgreso(rs.getString("Responsable.carrera_egreso"));
                usuario.setModalidadIngreso(rs.getString("Responsable.modalidad_ingreso"));
                usuario.setModalidadActual(rs.getString("Responsable.modalidad_actual"));
                usuario.setTecnologiasAplicadas(rs.getString("Responsable.tecnologias_aplicadas"));
                usuario.setFechaIngreso(rs.getString("Responsable.fecha_ingreso"));
                usuario.setFechaEgreso(rs.getString("Responsable.fecha_egreso"));
                usuario.setRol(rs.getString("R.nombre"));
                espacioFisico.setUsuario(usuario);
                espacioFisico.setEstatus(rs.getString("EspacioFisico.estatus"));
                bean.setEspacioFisico(espacioFisico);
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("ResponsableBien.id_usuario"));
                usuario.setNombre(rs.getString("ResponsableBien.nombre"));
                usuario.setPrimerApellido(rs.getString("ResponsableBien.primer_apellido"));
                usuario.setSegundoApellido(rs.getString("ResponsableBien.segundo_apellido"));
                usuario.setFechaNacimiento(rs.getString("ResponsableBien.fecha_nacimiento"));
                usuario.setCuatrimestreIngreso(rs.getInt("ResponsableBien.cuatrimestre_ingreso"));
                usuario.setCuatrimestreActual(rs.getInt("ResponsableBien.cuatrimestre_actual"));
                usuario.setEstatus(rs.getString("ResponsableBien.estatus"));
                usuario.setHorarioLabores(rs.getString("ResponsableBien.horario_labores"));
                usuario.setCorreoInstitucional(rs.getString("ResponsableBien.correo_institucional"));
                usuario.setCorreoPersonal(rs.getString("ResponsableBien.correo_personal"));
                usuario.setContrasena(rs.getString("ResponsableBien.contrasena"));
                usuario.setTelefonoCelular(rs.getString("ResponsableBien.telefono_celular"));
                usuario.setTelefonoCasa(rs.getString("ResponsableBien.telefono_casa"));
                usuario.setUniversidadEgreso(rs.getString("ResponsableBien.universidad_egreso"));
                usuario.setMatricula(rs.getString("ResponsableBien.matricula"));
                usuario.setCarreraEgreso(rs.getString("ResponsableBien.carrera_egreso"));
                usuario.setModalidadIngreso(rs.getString("ResponsableBien.modalidad_ingreso"));
                usuario.setModalidadActual(rs.getString("ResponsableBien.modalidad_actual"));
                usuario.setTecnologiasAplicadas(rs.getString("ResponsableBien.tecnologias_aplicadas"));
                usuario.setFechaIngreso(rs.getString("ResponsableBien.fecha_ingreso"));
                usuario.setFechaEgreso(rs.getString("ResponsableBien.fecha_egreso"));
                usuario.setRol(rs.getString("RU.nombre"));
                bean.setUsuarioResponsable(usuario);
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("Utiliza.id_usuario"));
                usuario.setNombre(rs.getString("Utiliza.nombre"));
                usuario.setPrimerApellido(rs.getString("Utiliza.primer_apellido"));
                usuario.setSegundoApellido(rs.getString("Utiliza.segundo_apellido"));
                usuario.setFechaNacimiento(rs.getString("Utiliza.fecha_nacimiento"));
                usuario.setCuatrimestreIngreso(rs.getInt("Utiliza.cuatrimestre_ingreso"));
                usuario.setCuatrimestreActual(rs.getInt("Utiliza.cuatrimestre_actual"));
                usuario.setEstatus(rs.getString("Utiliza.estatus"));
                usuario.setHorarioLabores(rs.getString("Utiliza.horario_labores"));
                usuario.setCorreoInstitucional(rs.getString("Utiliza.correo_institucional"));
                usuario.setCorreoPersonal(rs.getString("Utiliza.correo_personal"));
                usuario.setContrasena(rs.getString("Utiliza.contrasena"));
                usuario.setTelefonoCelular(rs.getString("Utiliza.telefono_celular"));
                usuario.setTelefonoCasa(rs.getString("Utiliza.telefono_casa"));
                usuario.setUniversidadEgreso(rs.getString("universidad_egreso"));
                usuario.setMatricula(rs.getString("Utiliza.matricula"));
                usuario.setCarreraEgreso(rs.getString("Utiliza.carrera_egreso"));
                usuario.setModalidadIngreso(rs.getString("Utiliza.modalidad_ingreso"));
                usuario.setModalidadActual(rs.getString("Utiliza.modalidad_actual"));
                usuario.setTecnologiasAplicadas(rs.getString("Utiliza.tecnologias_aplicadas"));
                usuario.setFechaIngreso(rs.getString("Utiliza.fecha_ingreso"));
                usuario.setFechaEgreso(rs.getString("Utiliza.fecha_egreso"));
                usuario.setRol(rs.getString("UT.nombre"));
                bean.setUsuarioUtiliza(usuario);
                proyecto = new ProyectoBean();
                proyecto.setId(rs.getInt("Proyecto.id_proyecto"));
                proyecto.setIdentificador(rs.getString("Proyecto.identificador"));
                proyecto.setNombre(rs.getString("Proyecto.nombre"));
                proyecto.setDescripcion(rs.getString("Proyecto.descripcion"));
                proyecto.setNombreCliente(rs.getString("Proyecto.nombre_cliente"));
                proyecto.setCorreoCliente(rs.getString("Proyecto.correo_cliente"));
                proyecto.setTelefonoCliente(rs.getString("Proyecto.telefono_cliente"));
                proyecto.setDireccionCliente(rs.getString("Proyecto.direccion_cliente"));
                proyecto.setFechaInicio(rs.getString("Proyecto.fecha_inicio"));
                proyecto.setFechaFin(rs.getString("Proyecto.fecha_fin"));
                proyecto.setEstatus(rs.getString("Proyecto.estatus"));
                bean.setProyecto(proyecto);
                bean.setEstatus(rs.getString("Asignacion.estatus"));

                System.out.println("estatus antes de almacenarlo en la lista: " + bean.getEstatus());

                listAsignacion.add(bean);
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consultar Asignacions: " + e.getMessage());
            e.printStackTrace();
        }

        return listAsignacion;
    }

    public boolean RegistrarAsignacion(int bien, int lugar, int proyecto, int utuliza, int responsable){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call registrar_asignacion(?,?,?,?,?,?)}");
            stmt.setInt(1,bien);
            stmt.setInt(2,lugar);
            stmt.setInt(3,responsable);
            stmt.setInt(4,utuliza);
            stmt.setInt(5,proyecto);
            stmt.setString(6,"Activo");

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
                System.out.println("ERROR: en la clase DAOBien: en el metodo RegistrarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    /*public boolean ModificarBien(BeanAsignacion bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call modificar_usuarios (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            stmt.setInt(1,bean.getId_bien());
            stmt.setString(2,bean.getCodigo_inventario());
            stmt.setString(3,bean.getNombre());
            stmt.setString(4,bean.getDescripcion());
            stmt.setString(5,bean.getPrecio());
            stmt.setString(6,bean.getMarca());
            stmt.setString(7, bean.getModelo());
            stmt.setString(8,bean.getNo_serie());
            stmt.setString(9,bean.getEstatus());

            num = stmt.executeUpdate();

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
                System.out.println("ERROR: en la clase DAOBien: en el metodo ModificarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }*/

    public boolean EliminarAsignacion(BeanAsignacion bean){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call desactivar_asignacion(?)}");
            stmt.setInt(1,bean.getId_asignacion());
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al eliminar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo EliminarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public BeanAsignacion ConsultaEspecificaAsignacion(int id){
        Connection con = null;
        BeanAsignacion bean = new BeanAsignacion();
        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call consulta_especifica_asignacion(?)");
            stmt.setInt(1,id);
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            bean = new BeanAsignacion();
            if (rs.next()) {
                bean.setId_asignacion(rs.getInt("id_asignacion"));
                ProyectoBean proyecto = new ProyectoBean();
                proyecto.setId(rs.getInt("Proyecto.id_proyecto"));
                bean.setProyecto(proyecto);
                BeanUsuario usuario = new BeanUsuario();
                usuario.setId(rs.getInt("Utiliza.id_usuario"));
                bean.setUsuarioUtiliza(usuario);
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("ResponsableBien.id_usuario"));
                bean.setUsuarioResponsable(usuario);
                BeanBien bien = new BeanBien();
                bien.setId_bien(rs.getInt("Bien.id_bien"));
                bean.setBien(bien);
                EspacioFisicoBean espacioFisico = new EspacioFisicoBean();
                espacioFisico.setId_espacio_fisico(rs.getInt("EspacioFisico.id_espacio_fisico"));
                bean.setEspacioFisico(espacioFisico);
                bean.setEstatus(rs.getString("Asignacion.estatus"));
            }
        } catch (SQLException e) {
            System.out.println("ERROR al consulta espacifica los bien: " + e.getMessage());
            e.printStackTrace();
        }
        return bean;
    }
    public BeanAsignacion ConsultaAsignacion(int id){
        Connection con = null;
        BeanAsignacion bean = new BeanAsignacion();
        BeanUsuario usuario;
        BeanRol rol;
        EspacioFisicoBean espacioFisico;
        BeanBien bien;
        ProyectoBean proyecto;

        try {
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("call consulta_asignaciones(?)");
            stmt.setInt(1,id);
            // hace la consulta
            ResultSet rs = stmt.executeQuery();
            bean = new BeanAsignacion();
            while (rs.next()) {
                bean = new BeanAsignacion();
                bean.setId_asignacion(rs.getInt("Asignacion.id_asignacion"));

                bien = new BeanBien();
                bien.setId_bien(rs.getInt("Bien.id_bien"));
                bien.setCodigo_inventario(rs.getString("Bien.codigo_inventario"));
                bien.setNombre(rs.getString("Bien.nombre"));
                bien.setDescripcion(rs.getString("Bien.descripcion"));
                bien.setPrecio(rs.getString("Bien.precio"));
                bien.setMarca(rs.getString("Bien.marca"));
                bien.setModelo(rs.getString("Bien.modelo"));
                bien.setNo_serie(rs.getString("Bien.no_serie"));
                bien.setEstatus(rs.getString("Bien.estatus"));
                bean.setBien(bien);

                espacioFisico = new EspacioFisicoBean();
                espacioFisico.setId_espacio_fisico(rs.getInt("EspacioFisico.id_espacio_fisico"));
                espacioFisico.setNombre(rs.getString("EspacioFisico.nombre"));
                espacioFisico.setNumero(rs.getInt("EspacioFisico.numero"));
                espacioFisico.setDescripcion(rs.getString("EspacioFisico.descripcion"));
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("Responsable.id_usuario"));
                usuario.setNombre(rs.getString("Responsable.nombre"));
                usuario.setPrimerApellido(rs.getString("Responsable.primer_apellido"));
                usuario.setSegundoApellido(rs.getString("Responsable.segundo_apellido"));
                usuario.setFechaNacimiento(rs.getString("Responsable.fecha_nacimiento"));
                usuario.setCuatrimestreIngreso(rs.getInt("Responsable.cuatrimestre_ingreso"));
                usuario.setCuatrimestreActual(rs.getInt("Responsable.cuatrimestre_actual"));
                usuario.setEstatus(rs.getString("Responsable.estatus"));
                usuario.setHorarioLabores(rs.getString("Responsable.horario_labores"));
                usuario.setCorreoInstitucional(rs.getString("Responsable.correo_institucional"));
                usuario.setCorreoPersonal(rs.getString("Responsable.correo_personal"));
                usuario.setContrasena(rs.getString("Responsable.contrasena"));
                usuario.setTelefonoCelular(rs.getString("Responsable.telefono_celular"));
                usuario.setTelefonoCasa(rs.getString("Responsable.telefono_casa"));
                usuario.setUniversidadEgreso(rs.getString("Responsable.universidad_egreso"));
                usuario.setMatricula(rs.getString("Responsable.matricula"));
                usuario.setCarreraEgreso(rs.getString("Responsable.carrera_egreso"));
                usuario.setModalidadIngreso(rs.getString("Responsable.modalidad_ingreso"));
                usuario.setModalidadActual(rs.getString("Responsable.modalidad_actual"));
                usuario.setTecnologiasAplicadas(rs.getString("Responsable.tecnologias_aplicadas"));
                usuario.setFechaIngreso(rs.getString("Responsable.fecha_ingreso"));
                usuario.setFechaEgreso(rs.getString("Responsable.fecha_egreso"));
                usuario.setRol(rs.getString("R.nombre"));
                espacioFisico.setUsuario(usuario);
                espacioFisico.setEstatus(rs.getString("EspacioFisico.estatus"));
                bean.setEspacioFisico(espacioFisico);
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("ResponsableBien.id_usuario"));
                usuario.setNombre(rs.getString("ResponsableBien.nombre"));
                usuario.setPrimerApellido(rs.getString("ResponsableBien.primer_apellido"));
                usuario.setSegundoApellido(rs.getString("ResponsableBien.segundo_apellido"));
                usuario.setFechaNacimiento(rs.getString("ResponsableBien.fecha_nacimiento"));
                usuario.setCuatrimestreIngreso(rs.getInt("ResponsableBien.cuatrimestre_ingreso"));
                usuario.setCuatrimestreActual(rs.getInt("ResponsableBien.cuatrimestre_actual"));
                usuario.setEstatus(rs.getString("ResponsableBien.estatus"));
                usuario.setHorarioLabores(rs.getString("ResponsableBien.horario_labores"));
                usuario.setCorreoInstitucional(rs.getString("ResponsableBien.correo_institucional"));
                usuario.setCorreoPersonal(rs.getString("ResponsableBien.correo_personal"));
                usuario.setContrasena(rs.getString("ResponsableBien.contrasena"));
                usuario.setTelefonoCelular(rs.getString("ResponsableBien.telefono_celular"));
                usuario.setTelefonoCasa(rs.getString("ResponsableBien.telefono_casa"));
                usuario.setUniversidadEgreso(rs.getString("ResponsableBien.universidad_egreso"));
                usuario.setMatricula(rs.getString("ResponsableBien.matricula"));
                usuario.setCarreraEgreso(rs.getString("ResponsableBien.carrera_egreso"));
                usuario.setModalidadIngreso(rs.getString("ResponsableBien.modalidad_ingreso"));
                usuario.setModalidadActual(rs.getString("ResponsableBien.modalidad_actual"));
                usuario.setTecnologiasAplicadas(rs.getString("ResponsableBien.tecnologias_aplicadas"));
                usuario.setFechaIngreso(rs.getString("ResponsableBien.fecha_ingreso"));
                usuario.setFechaEgreso(rs.getString("ResponsableBien.fecha_egreso"));
                usuario.setRol(rs.getString("RU.nombre"));
                bean.setUsuarioResponsable(usuario);
                usuario = new BeanUsuario();
                usuario.setId(rs.getInt("Utiliza.id_usuario"));
                usuario.setNombre(rs.getString("Utiliza.nombre"));
                usuario.setPrimerApellido(rs.getString("Utiliza.primer_apellido"));
                usuario.setSegundoApellido(rs.getString("Utiliza.segundo_apellido"));
                usuario.setFechaNacimiento(rs.getString("Utiliza.fecha_nacimiento"));
                usuario.setCuatrimestreIngreso(rs.getInt("Utiliza.cuatrimestre_ingreso"));
                usuario.setCuatrimestreActual(rs.getInt("Utiliza.cuatrimestre_actual"));
                usuario.setEstatus(rs.getString("Utiliza.estatus"));
                usuario.setHorarioLabores(rs.getString("Utiliza.horario_labores"));
                usuario.setCorreoInstitucional(rs.getString("Utiliza.correo_institucional"));
                usuario.setCorreoPersonal(rs.getString("Utiliza.correo_personal"));
                usuario.setContrasena(rs.getString("Utiliza.contrasena"));
                usuario.setTelefonoCelular(rs.getString("Utiliza.telefono_celular"));
                usuario.setTelefonoCasa(rs.getString("Utiliza.telefono_casa"));
                usuario.setUniversidadEgreso(rs.getString("universidad_egreso"));
                usuario.setMatricula(rs.getString("Utiliza.matricula"));
                usuario.setCarreraEgreso(rs.getString("Utiliza.carrera_egreso"));
                usuario.setModalidadIngreso(rs.getString("Utiliza.modalidad_ingreso"));
                usuario.setModalidadActual(rs.getString("Utiliza.modalidad_actual"));
                usuario.setTecnologiasAplicadas(rs.getString("Utiliza.tecnologias_aplicadas"));
                usuario.setFechaIngreso(rs.getString("Utiliza.fecha_ingreso"));
                usuario.setFechaEgreso(rs.getString("Utiliza.fecha_egreso"));
                usuario.setRol(rs.getString("UT.nombre"));
                bean.setUsuarioUtiliza(usuario);
                proyecto = new ProyectoBean();
                proyecto.setId(rs.getInt("Proyecto.id_proyecto"));
                proyecto.setIdentificador(rs.getString("Proyecto.identificador"));
                proyecto.setNombre(rs.getString("Proyecto.nombre"));
                proyecto.setDescripcion(rs.getString("Proyecto.descripcion"));
                proyecto.setNombreCliente(rs.getString("Proyecto.nombre_cliente"));
                proyecto.setCorreoCliente(rs.getString("Proyecto.correo_cliente"));
                proyecto.setTelefonoCliente(rs.getString("Proyecto.telefono_cliente"));
                proyecto.setDireccionCliente(rs.getString("Proyecto.direccion_cliente"));
                proyecto.setFechaInicio(rs.getString("Proyecto.fecha_inicio"));
                proyecto.setFechaFin(rs.getString("Proyecto.fecha_fin"));
                proyecto.setEstatus(rs.getString("Proyecto.estatus"));
                bean.setProyecto(proyecto);
                bean.setEstatus(rs.getString("Asignacion.estatus"));

                System.out.println("estatus antes de almacenarlo en la lista: " + bean.getEstatus());

            }
        } catch (SQLException e) {
            System.out.println("ERROR al consulta espacifica los bien: " + e.getMessage());
            e.printStackTrace();
        }
        return bean;
    }

    public boolean ModificarAsignacion(int bien, int lugar, int proyecto, int utuliza, int responsable, String estatus, int id_asignacion){
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call modificar_asignacion (?,?,?,?,?,?,?)}");
            stmt.setInt(1,id_asignacion);
            stmt.setInt(2,bien);
            stmt.setInt(3,lugar);
            stmt.setInt(4,responsable);
            stmt.setInt(5,utuliza);
            stmt.setInt(6,proyecto);
            stmt.setString(7,estatus);

            num = stmt.executeUpdate();

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
                System.out.println("ERROR: en la clase DAOBien: en el metodo ModificarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean desabilitarAsignacion(int idAsignacion) {
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call desactivar_asignacion(?)}");
            stmt.setInt(1,idAsignacion);
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al eliminar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo EliminarBien");
            }

        }
        if (num == 1) {
            rest = true;
        } else {
            rest = false;
        }
        return rest;
    }

    public boolean activarAsignacion(int idAsignacion) {
        boolean rest = false;
        int num = 0;
        Connection con = null;

        try{
            con = Conexion.getConexion();
            CallableStatement stmt = con.prepareCall("{call activar_asignacion(?)}");
            stmt.setInt(1,idAsignacion);
            num = stmt.executeUpdate();

            stmt.close();
        }catch (SQLException e) {
            System.out.println("ERROR al eliminar el registro: " + e.getMessage());
            e.printStackTrace();
        } finally {

            try {

                if (con != null) {

                    con.close();

                }

            } catch (SQLException ex) {
                System.out.println("ERROR: en la clase DAOBien: en el metodo EliminarBien");
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
