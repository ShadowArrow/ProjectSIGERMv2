<%@ page import="java.util.List" %>
<%@ page import="com.utez.edu.mx.domains.usuario.model.BeanUsuario" %><%--
  Created by IntelliJ IDEA.
  User: yoshi
  Date: 08/11/2019
  Time: 01:42 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
    int cont = 0;
    int cont2 = 0;
%>
<% String context = request.getContextPath();%>
<html>
<s:if test="#session.usuario.correoInstitucional==null">
    <script>
        window.location.href = "<%=context%>/index.jsp";
    </script>
</s:if>
<head>
    <title>Asignaciones</title>
    <link rel="icon" type="image/png" href="<%=context%>/img/logocds.png"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Core CSS - Include with every page -->
    <link href="<%=context%>/plugins/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%=context%>/fonts/contenido/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link href="<%=context%>/plugins/pace/pace-theme-big-counter.css" rel="stylesheet"/>
    <link href="<%=context%>/css/contenido/style.css" rel="stylesheet"/>
    <link href="<%=context%>/css/contenido/main-style.css" rel="stylesheet"/>
    <!--Sweet Alert 2-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <!--Hugo-->
    <!--<link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="stylesheet" href="<%=context%>/fontawesome/css/all.css">
    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.min.js"></script>
    <title>SIGERM GESTION DE USUARIOS</title>-->
</head>
<body>

<!-- wrapper -->
<div id="wrapper">
    <!-- navbar top -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
        <!-- navbar-header -->
        <div class="navbar-header">
            <a class="navbar-brand" href=""
               style="color: white; font-size: 35px; margin-top: 10px;">
                SIGERM
            </a>
        </div>
        <!-- end navbar-header -->
        <!-- navbar-top-links -->
        <ul class="nav navbar-top-links navbar-right">
            <!--Usuario-->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <!--Aquí hay que evaluar el sexo, para mostrar la imagen de hombre o de mujer-->
                    <label class="text-right"><s:property value="#session.usuario.nombre"/><br>
                        <small><s:property
                                value="#session.usuario.rol"/></small>
                    </label>
                    <img src="<%=context%>/img/man.png" width="35" height="35" style="margin: -15px 0 0 5px;">
                </a>
                <!-- dropdown user-->
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <a href="<%=context%>/CerrarSesion.action"><i class="fa fa-sign-out fa-fw"></i> Cerrar
                            sesión</a>
                    </li>
                </ul>
                <!-- end dropdown-user -->
            </li>
            <!-- end main dropdown -->
        </ul>
        <!-- end navbar-top-links -->
    </nav>
    <!-- end navbar top -->
    <!-- navbar side -->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <!-- sidebar-collapse -->
        <div class="sidebar-collapse">
            <!-- side-menu -->
            <ul class="nav" id="side-menu">
                <li class="" style="padding-top: 15px; padding-left: -15px;">
                    <a href="<%=context%>/inicio_rpbsi.action">
                        <i class="fa fa-user fa-fw" aria-hidden="true"></i> Mi perfil
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/jsp/reportesAdmin.jsp">
                        <i class="fa fa-file-text fa-fw" aria-hidden="true"></i> Reportes
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/MostrarUsuarios">
                        <i class="fa fa-users fa-fw"></i> Usuarios
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/consultarEspacioFisicos">
                        <i class="fa fa-building-o fa-fw" aria-hidden="true"></i> Espacios físicos
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/consultarProyectos.action">
                        <i class="fa fa-folder fa-fw" aria-hidden="true"></i> Proyectos
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/MostrarBienes">
                        <i class="fa fa-desktop fa-fw" aria-hidden="true"></i> Bienes
                    </a>
                </li>
                <li class="">
                    <a href="<%=context%>/ConsultaAsignaciones.action">
                        <i class="fa fa-edit fa-fw"></i> Asignaciones
                    </a>
                </li>
            </ul>
            <!-- end side-menu -->
        </div>
        <!-- end sidebar-collapse -->
    </nav>
    <!-- end navbar side -->
    <!--page-wrapper -->
    <div id="page-wrapper">
        <div class="row">
            <!-- Page Header -->
            <div class="col-md-12">
                <h2 class="page-header"><i class="fa fa-edit fa-fw"></i> Asignaciones</h2>
            </div>
            <!--End Page Header -->
        </div>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-circle btn-lg" style="background-color: #00AA83; color: white;"
                        data-toggle="modal" data-target="#addNewAssignmentModal">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
        </div>
        <div class="table-responsive">

            <table class="table table-bordered">
                <thead style="background-color: #00AA83; color: white;">
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">Bien</th>
                    <th class="text-center">Responsable</th>
                    <th class="text-center">Asignado a</th>
                    <th class="text-center">Lugar</th>
                    <th class="text-center">Proyecto</th>
                    <th class="text-center">Estatus</th>
                    <th class="text-center" colspan="3">Acciones</th>
                </tr>
                </thead>
                <tbody class="text-justify">
                <s:iterator value="listAsignacion" status="stat" var="lista">
                    <tr>
                        <td><s:property value="#stat.count"/></td>
                        <td><s:property value="Bien.nombre"/></td>
                        <td><s:property value="usuarioResponsable.nombre"/></td>
                        <td><s:property value="usuarioUtiliza.nombre"/></td>
                        <td><s:property value="EspacioFisico.nombre"/></td>
                        <td><s:property value="Proyecto.nombre"/></td>
                        <td><s:property value="estatus"/></td>

                        <td class="text-center">
                            <button class="btn btn-warning"
                                    onclick="consultarDatosMm(<s:property value="id_asignacion"/>)">
                                <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"
                                   data-target="#editUserModal"></i>
                            </button>
                        </td>
                        <td class="text-center">
                            <s:if test="estatus=='Activo'">
                                <form method="post" action="<%=context%>/desactivarAsignacion.action">
                                    <input type="hidden" name="id_asignacion" value="<s:property value="id_asignacion" />"/>
                                    <button class="btn btn-danger" style="margin-left: 2px;" onclick="deshabilitar()">
                                        <i data-toggle="tooltip" title="Deshabilitar" class="fa fa-times"
                                           aria-hidden="true"></i>
                                    </button>
                                </form>
                            </s:if>
                            <s:if test="estatus=='Inactivo'">
                                <form method="post" action="<%=context%>/activarAsignacion.action">
                                    <input type="hidden" name="id_asignacion" id="id" value="<s:property value="id_asignacion" />"/>
                                    <button class="btn btn-success" style="margin-left: 2px;" onclick="habilitar()">
                                        <i data-toggle="tooltip" title="Habilitar" class="fa fa-check"
                                           aria-hidden="true" onclick="habilitar()"></i>
                                    </button>
                                </form>
                            </s:if>
                        </td>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-info" onclick="consultarDatos(<s:property value="id_asignacion"/>)">
                                <i data-toggle="tooltip" title="Detalles" class="fa fa-eye" aria-hidden="true"></i>
                            </button>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    <!-- end page-wrapper -->
</div>
<!-- end wrapper -->

<!--Modals-->
<!--New assignment-->
<div class="modal fade" id="addNewAssignmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title" id="exampleModalLongTitle">Nueva asignación</h4>
                        </td>
                        <td style="width: 50rem;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-body">
                <form method="post" action="InsertarAsignacion.action" id="insertar">
                    <br>
                    <label>Bien</label>
                    <select name="bien" class="form-control">
                        <option value="0">Seleccione...</option>
                        <s:iterator value="listBien" status="stat" var="usuarios">
                            <option value="<s:property value="id_bien"/>"><s:property value="nombre"/></option>
                        </s:iterator>
                    </select>
                    <br>
                    <label>Responsable</label>
                    <select name="responsable" class="form-control">
                        <option value="0">Seleccione...</option>
                        <s:iterator value="listUsuario" status="stat" var="usuarios">
                            <option value="<s:property value="id"/>"><s:property value="nombre"/></option>
                        </s:iterator>
                    </select>
                    <br>
                    <label>Asignado a</label>
                    <select name="utiliza" class="form-control">
                        <option value="0">Seleccione...</option>
                        <s:iterator value="listUsuario" status="stat" var="usuarios">
                            <option value="<s:property value="id"/>"><s:property value="nombre"/></option>
                        </s:iterator>
                    </select>
                    <br>
                    <label>Lugar</label>
                    <select name="lugar" class="form-control">
                        <option value="0">Seleccione...</option>
                        <s:iterator value="listEspacioFisico" status="stat" var="usuarios">
                            <option value="<s:property value="id_espacio_fisico"/>"><s:property
                                    value="nombre"/></option>
                        </s:iterator>
                    </select>
                    <br>
                    <label>Proyecto</label>
                    <select name="proyecto" class="form-control">
                        <option value="0">Seleccione...</option>
                        <s:iterator value="listProyecto" status="stat" var="usuarios">
                            <option value="<s:property value="id"/>"><s:property value="nombre"/></option>
                        </s:iterator>
                    </select>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="insertar.submit()">Guardar</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!--End New assignment-->

<!--Assignment details-->
<div class="modal fade" id="assignmentDetailsModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Detalles de la asignación</h4>
                        </td>
                        <td style="width: 50rem;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-body">
                <%--<h3>Estatus de la asignación: <s:property value=""/></h3>--%>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <br/>

                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a href="#datos_bien" class="nav-link active" role="tab" data-toggle="tab">Bien</a>
                        </li>

                        <li class="nav-item">
                            <a href="#datos_espacio" class="nav-link" role="tab" data-toggle="tab">Espacio</a>
                        </li>

                        <li class="nav-item">
                            <a href="#datos_proyectos" class="nav-link" role="tab" data-toggle="tab">Proyectos
                                asignados</a>
                        </li>

                        <li class="nav-item">
                            <a href="#usuario" class="nav-link" role="tab" data-toggle="tab">Usuario</a>
                        </li>

                        <li class="nav-item">
                            <a href="#responsable_bien" class="nav-link" role="tab" data-toggle="tab">Responsable
                                del bien</a>
                        </li>

                        <li class="nav-item">
                            <a href="#responsable_espacio" class="nav-link" role="tab" data-toggle="tab">Responsable
                                del espacio</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane in active" id="datos_bien">
                            <hr/>
                            <h5>Código del inventario:</h5>
                            <input type="text" class="form-control" maxlength="50" id="codigoB" readonly/>
                            <br/>

                            <br/>
                            <h5>Nombre:</h5>
                            <input type="text" class="form-control" maxlength="50" id="nombreB" readonly/>
                            <br/>

                            <br/>
                            <h5>Descripción:</h5>
                            <input type="text" class="form-control" maxlength="50" id="descripcionB" readonly/>
                            <br/>

                            <br/>
                            <h5>Precio:</h5>
                            <input type="text" class="form-control" maxlength="50" id="precioB" readonly/>
                            <br/>

                            <br/>
                            <h5>Marca:</h5>
                            <input type="text" class="form-control" maxlength="50" id="MarcaB" readonly/>
                            <br/>

                            <br/>
                            <h5>Modelo:</h5>
                            <input type="text" class="form-control" maxlength="50" id="modeloB" readonly/>
                            <br/>

                            <br/>
                            <h5>N° Serie:</h5>
                            <input type="text" class="form-control" maxlength="50" id="serieB" readonly/>
                            <br/>

                            <br/>
                            <h5>Estatus:</h5>
                            <input type="text" class="form-control" maxlength="50" id="estatusB" readonly/>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="datos_espacio">
                            <hr/>
                            <h5>Nombre:</h5>
                            <input type="text" class="form-control" maxlength="50" id="nombreEs" readonly/>
                            <br/>

                            <br/>
                            <h5>Numero:</h5>
                            <input type="text" class="form-control" maxlength="50" id="numeroEs" readonly/>
                            <br/>

                            <br/>
                            <h5>Descripción:</h5>
                            <input type="text" class="form-control" maxlength="50" id="descipcionEs" readonly/>
                            <br/>

                            <br/>
                            <h5>Estatus:</h5>
                            <input type="text" class="form-control" maxlength="50" id="estatusEs" readonly/>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="datos_proyectos">
                            <hr/>
                            <h5>Identificador:</h5>
                            <input type="text" class="form-control" maxlength="50" id="identificadorPr" readonly/>
                            <br/>

                            <br/>
                            <h5>Nombre:</h5>
                            <input type="text" class="form-control" maxlength="50" id="nombrePr" readonly/>
                            <br/>

                            <br/>
                            <h5>Descripcion:</h5>
                            <input type="text" class="form-control" maxlength="50" id="descripcionPr" readonly/>
                            <br/>

                            <br/>
                            <h5>Nombre del cliente:</h5>
                            <input type="text" class="form-control" maxlength="50" id="nombleClientePr" readonly/>
                            <br/>

                            <br/>
                            <h5>Correo electrónico del cliente:</h5>
                            <input type="text" class="form-control" maxlength="50" id="correoElectronicoClientePr" readonly/>
                            <br/>

                            <br/>
                            <h5>Teléfono del cliente:</h5>
                            <input type="text" class="form-control" maxlength="50" id="telefonoClientePr" readonly/>
                            <br/>

                            <br/>
                            <h5>Dirección del cliente:</h5>
                            <input type="text" class="form-control" maxlength="50" id="direccionClientePr" readonly/>
                            <br/>

                            <br/>
                            <h5>Fecha de inicio:</h5>
                            <input type="text" class="form-control" maxlength="50" id="ifechaPr" readonly/>
                            <br/>

                            <br/>
                            <h5>Fecha del fin:</h5>
                            <input type="text" class="form-control" maxlength="50" id="fechaFinPr" readonly/>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="usuario">
                            <!-- tails de información de perfil -->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                <br/>

                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a href="#datos_personales1" class="nav-link active" role="tab" data-toggle="tab">Información
                                            personal</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#datos_escolares1" class="nav-link" role="tab" data-toggle="tab">Información escolar</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#datos_laborales1" class="nav-link" role="tab" data-toggle="tab">Información laboral</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#tecnologias_aplicadas1" class="nav-link" role="tab" data-toggle="tab">Tecnologías
                                            aplicadas</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane in active" id="datos_personales1">
                                        <hr/>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h5>Nombre(s):</h5>
                                                <input type="text" class="form-control" maxlength="50" id="nombreP" readonly/>
                                                <br/>
                                                <h5>Primer apellido:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="pApellidoP" readonly/>
                                                <br/>
                                                <h5>Segundo Apellido:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="sApellidoP" readonly/>
                                                <br/>
                                                <h5>Fecha de nacimiento:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="fechaP" readonly/>
                                            </div>
                                            <div class="col-md-4">
                                                <h5>Correo electrónico personal:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="correoP" readonly/>
                                                <br/>
                                                <h5>Teléfono celular:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="ctelefonoP" readonly/>
                                                <br/>
                                                <h5>Teléfono de casa:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="catelefonoP" readonly/>
                                            </div>
                                        </div>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="datos_escolares1">
                                        <hr/>
                                        <h5>Universidad de egreso:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="uniE" readonly/>
                                        <br/>
                                        <h5>Carrera de egreso:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="carreraE" readonly/>
                                        <br/>
                                        <h5>Cuatrimestre en el que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="icuatriE" readonly/>
                                        <br/>
                                        <h5>Cuatrimestre actual:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="acuatriE" readonly/>
                                        <br/>
                                        <h5>Correo institucional:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="correoInstitucionalE" readonly/>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="datos_laborales1">
                                        <hr/>
                                        <h5>Modalidad que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="imodalidadL" readonly/>
                                        <br/>
                                        <h5>Modalidad actual:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="amodalidadL" readonly/>
                                        <br/>
                                        <h5>Fecha en la que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="ifechaL" readonly/>
                                        <br/>
                                        <h5>Fecha en la que egresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="efechaL" readonly/>
                                        <br/>
                                        <h5>Rol asignado:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="rolL" readonly/>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tecnologias_aplicadas1">
                                        <hr/>
                                        <h5>Tecnologías aplicadas:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="tecnologiasL" readonly/>
                                        <hr/>
                                    </div>
                                </div>
                            </div>
                        </div>





                        <div role="tabpanel" class="tab-pane fade" id="responsable_bien">
                            <!-- tails de información de perfil -->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                <br/>

                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a href="#datos_personales2" class="nav-link active" role="tab" data-toggle="tab">Información
                                            personal</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#datos_escolares2" class="nav-link" role="tab" data-toggle="tab">Información escolar</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#datos_laborales2" class="nav-link" role="tab" data-toggle="tab">Información laboral</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#tecnologias_aplicadas2" class="nav-link" role="tab" data-toggle="tab">Tecnologías
                                            aplicadas</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane in active" id="datos_personales2">
                                        <hr/>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h5>Nombre(s):</h5>
                                                <input type="text" class="form-control" maxlength="50" id="nombreP2" readonly/>
                                                <br/>
                                                <h5>Primer apellido:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="pApellidoP2" readonly/>
                                                <br/>
                                                <h5>Segundo Apellido:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="sApellidoP2" readonly/>
                                                <br/>
                                                <h5>Fecha de nacimiento:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="fechaP2" readonly/>
                                            </div>
                                            <div class="col-md-4">
                                                <h5>Correo electrónico personal:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="correoP2" readonly/>
                                                <br/>
                                                <h5>Teléfono celular:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="ctelefonoP2" readonly/>
                                                <br/>
                                                <h5>Teléfono de casa:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="catelefonoP2" readonly/>
                                            </div>
                                        </div>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="datos_escolares2">
                                        <hr/>
                                        <h5>Universidad de egreso:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="uniE2" readonly/>
                                        <br/>
                                        <h5>Carrera de egreso:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="carreraE2" readonly/>
                                        <br/>
                                        <h5>Cuatrimestre en el que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="icuatriE2" readonly/>
                                        <br/>
                                        <h5>Cuatrimestre actual:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="acuatriE2" readonly/>
                                        <br/>
                                        <h5>Correo institucional:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="correoInstitucionalE2" readonly/>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="datos_laborales2">
                                        <hr/>
                                        <h5>Modalidad que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="imodalidadL2" readonly/>
                                        <br/>
                                        <h5>Modalidad actual:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="amodalidadL2" readonly/>
                                        <br/>
                                        <h5>Fecha en la que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="ifechaL2" readonly/>
                                        <br/>
                                        <h5>Fecha en la que egresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="efechaL2" readonly/>
                                        <br/>
                                        <h5>Rol asignado:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="rolL2" readonly/>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tecnologias_aplicadas2">
                                        <hr/>
                                        <h5>Tecnologías aplicadas:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="tecnologiasL2" readonly/>
                                        <hr/>
                                    </div>
                                </div>
                            </div>
                        </div>






                        <div role="tabpanel" class="tab-pane fade" id="responsable_espacio">
                            <!-- tails de información de perfil -->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                <br/>

                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a href="#datos_personales3" class="nav-link active" role="tab" data-toggle="tab">Información
                                            personal</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#datos_escolares3" class="nav-link" role="tab" data-toggle="tab">Información escolar</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#datos_laborales3" class="nav-link" role="tab" data-toggle="tab">Información laboral</a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#tecnologias_aplicadas3" class="nav-link" role="tab" data-toggle="tab">Tecnologías
                                            aplicadas</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane in active" id="datos_personales3">
                                        <hr/>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h5>Nombre(s):</h5>
                                                <input type="text" class="form-control" maxlength="50" id="nombreP3" readonly/>
                                                <br/>
                                                <h5>Primer apellido:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="pApellidoP3" readonly/>
                                                <br/>
                                                <h5>Segundo Apellido:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="sApellidoP3" readonly/>
                                                <br/>
                                                <h5>Fecha de nacimiento:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="fechaP3" readonly/>
                                            </div>
                                            <div class="col-md-4">
                                                <h5>Correo electrónico personal:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="correoP3" readonly/>
                                                <br/>
                                                <h5>Teléfono celular:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="ctelefonoP3" readonly/>
                                                <br/>
                                                <h5>Teléfono de casa:</h5>
                                                <input type="text" class="form-control" maxlength="50" id="catelefonoP3" readonly/>
                                            </div>
                                        </div>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="datos_escolares3">
                                        <hr/>
                                        <h5>Universidad de egreso:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="uniE3" readonly/>
                                        <br/>
                                        <h5>Carrera de egreso:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="carreraE3" readonly/>
                                        <br/>
                                        <h5>Cuatrimestre en el que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="icuatriE3" readonly/>
                                        <br/>
                                        <h5>Cuatrimestre actual:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="acuatriE3" readonly/>
                                        <br/>
                                        <h5>Correo institucional:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="correoInstitucionalE3" readonly/>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="datos_laborales3">
                                        <hr/>
                                        <h5>Modalidad que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="imodalidadL3" readonly/>
                                        <br/>
                                        <h5>Modalidad actual:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="amodalidadL3" readonly/>
                                        <br/>
                                        <h5>Fecha en la que ingresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="ifechaL3" readonly/>
                                        <br/>
                                        <h5>Fecha en la que egresó:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="efechaL3" readonly/>
                                        <br/>
                                        <h5>Rol asignado:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="rolL3" readonly/>
                                        <hr/>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tecnologias_aplicadas3">
                                        <hr/>
                                        <h5>Tecnologías aplicadas:</h5>
                                        <input type="text" class="form-control" maxlength="50" id="tecnologiasL3" readonly/>
                                        <hr/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
               <!-- <button type="button" class="btn btn-success" data-dismiss="modal">Guardar</button>-->
            </div>
        </div>
    </div>
</div>
<!--End Assignment details-->

<!--Edit assignment-->
<div class="modal fade" id="editAssignmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Editar asignación</h4>
                        </td>
                        <td style="width: 50rem;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-body">
                <form method="post" action="ModificarAsignacion.action" id="ModificarAsignacion">
                    <input type="text" class="form-control" style="visibility:hidden" name="id_asignacion"
                           id="id_asignacionm" maxlength="50" readonly/>
                    <input type="text" class="form-control" style="visibility:hidden" name="estatus" id="estatusm"
                           maxlength="50" readonly/>
                    <br>
                    <label>Bien</label>
                    <select name="bien" id="bien" class="form-control">

                    </select>
                    <br>
                    <label>Responsable</label>
                    <select name="responsable" id="responsable" class="form-control">

                    </select>
                    <br>
                    <label>Asignado a</label>
                    <select name="utiliza" id="utiliza" class="form-control">

                    </select>
                    <br>
                    <label>Lugar</label>
                    <select name="lugar" id="espacioFisico" class="form-control">

                    </select>
                    <br>
                    <label>Proyecto</label>
                    <select name="proyecto" id="proyecto" class="form-control">

                    </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="ModificarAsignacion.submit()">Guardar</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!--End Edit assignment-->
<!--End Modals-->

<!-- Core Scripts - Include with every page -->
<script src="<%=context%>/plugins/jquery-1.10.2.js"></script>
<script src="<%=context%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=context%>/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=context%>/plugins/pace/pace.js"></script>
<script src="<%=context%>/js/contenido/siminta.js"></script>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>
<script>
    function habilitar() {
        sweetAlert({
            type: 'success',
            title: '¡Habilitado con éxito!',
            text: '',
            showConfirmButton: false,
            timer: 1500
        });
    }

    function deshabilitar() {
        sweetAlert({
            type: 'success',
            title: '¡Deshabilitado con éxito!',
            text: '',
            showConfirmButton: false,
            timer: 1500
        });
    }
</script>
<script>
    //Se recupera la direccion raiz del archivo
    //---------------------------------------------------------------------------------------------------------------
    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";
    //---------------------------------------------------------------------------------------------------------------

    //función de enviar correo
    //---------------------------------------------------------------------------------------------------------------
    function consultarDatosMm(idAsignacion) {
        $.ajax({
            type: "POST",
            url: raiz + "ConsultaEspecificaAsignacionModificar",
            data: "id_asignacion=" + idAsignacion,
            success: function (data) {

                var responsable = data.listUsuario;
                var utiliza = data.listUsuario;
                var bien = data.listBien;
                var espacioFisico = data.listEspacioFisico;
                var proyecto = data.listProyecto;
                $('#responsable').html('');
                $('#utiliza').html('');
                $('#bien').html('');
                $('#espacioFisico').html('');
                $('#proyecto').html('');
                for (var i = 0; i < responsable.length; i++) {

                    if (data.bean.usuarioResponsable.id == responsable[i].id) {

                        $("#responsable").append('<option value="' + responsable[i].id + '" selected>' + responsable[i].nombre + '</option>');

                    } else {

                        $("#responsable").append('<option value="' + responsable[i].id + '">' + responsable[i].nombre + '</option>');
                    }
                    ;
                }
                ;
                for (var i = 0; i < utiliza.length; i++) {

                    if (data.bean.usuarioUtiliza.id == utiliza[i].id) {

                        $("#utiliza").append('<option value="' + utiliza[i].id + '" selected>' + utiliza[i].nombre + '</option>');

                    } else {

                        $("#utiliza").append('<option value="' + utiliza[i].id + '">' + utiliza[i].nombre + '</option>');
                    }
                    ;
                }
                ;

                for (var i = 0; i < bien.length; i++) {

                    if (data.bean.bien.id_bien == bien[i].id) {

                        $("#bien").append('<option value="' + bien[i].id_bien + '" selected>' + bien[i].nombre + '</option>');

                    } else {

                        $("#bien").append('<option value="' + bien[i].id_bien + '">' + bien[i].nombre + '</option>');
                    }
                    ;
                }
                ;

                for (var i = 0; i < espacioFisico.length; i++) {

                    if (data.bean.espacioFisico.id_espacio_fisico == espacioFisico[i].id_espacio_fisico) {

                        $("#espacioFisico").append('<option value="' + espacioFisico[i].id_espacio_fisico + '" selected>' + espacioFisico[i].nombre + '</option>');

                    } else {

                        $("#espacioFisico").append('<option value="' + espacioFisico[i].id_espacio_fisico + '">' + espacioFisico[i].nombre + '</option>');
                    }
                    ;
                }
                ;

                for (var i = 0; i < proyecto.length; i++) {

                    if (data.bean.proyecto.id == proyecto[i].id) {

                        $("#proyecto").append('<option value="' + proyecto[i].id + '" selected>' + proyecto[i].nombre + '</option>');

                    } else {

                        $("#proyecto").append('<option value="' + proyecto[i].id + '">' + proyecto[i].nombre + '</option>');
                    }
                    ;
                }
                ;

                $("#id_asignacionm").val(data.bean.id_asignacion);
                $("#estatusm").val(data.bean.estatus);

                $('#editAssignmentModal').modal('show');
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }

    function consultarDatos(idAsignacion) {
        $.ajax({
            type: "POST",
            url: raiz + "ConsultaEspecificaAsignacion",
            data: "id_asignacion=" + idAsignacion,
            success: function (data) {

                var bien = data.bean.bien;
                var espacioFisico = data.bean.espacioFisico;
                var espacioFisicoUsuario = data.bean.espacioFisico.usuario;
                var usuarioResponsable = data.bean.usuarioResponsable;
                var usuarioUtiliza = data.bean.usuarioUtiliza;
                var proyecto = data.bean.proyecto;

                /*Bien*/
                $("#codigoB").val(bien.codigo_inventario);
                $("#nombreB").val(bien.nombre);
                $("#descripcionB").val(bien.descripcion);
                $("#precioB").val(bien.precio);
                $("#MarcaB").val(bien.marca);
                $("#modeloB").val(bien.modelo);
                $("#serieB").val(bien.no_serie);
                $("#estatusB").val(bien.estatus);
                /*Bien*/

                /*Espacio Fisico*/
                $("#nombreEs").val(espacioFisico.nombre);
                $("#numeroEs").val(espacioFisico.numero);
                $("#descipcionEs").val(espacioFisico.descripcion);
                $("#estatusEs").val(espacioFisico.estatus);
                /*Espacio Fisico*/

                /*Espacio Fisico Responsable*/
                /*Datos Personales*/
                $("#nombreP3").val(espacioFisicoUsuario.nombre);
                $("#pApellidoP3").val(espacioFisicoUsuario.primerApellido);
                $("#sApellidoP3").val(espacioFisicoUsuario.segundoApellido);
                $("#fechaP3").val(espacioFisicoUsuario.fechaNacimiento);
                $("#correoP3").val(espacioFisicoUsuario.correoPersonal);
                $("#ctelefonoP3").val(espacioFisicoUsuario.telefonoCelular);
                $("#catelefonoP3").val(espacioFisicoUsuario.telefonoCasa);
                /*Datos Personales*/

                /*Datos Escolares*/
                $("#uniE3").val(espacioFisicoUsuario.universidadEgreso);
                $("#carreraE3").val(espacioFisicoUsuario.carreraEgreso);
                $("#icuatriE3").val(espacioFisicoUsuario.cuatrimestreIngreso);
                $("#acuatriE3").val(espacioFisicoUsuario.cuatrimestreActual);
                $("#correoInstitucionalE3").val(espacioFisicoUsuario.correoInstitucional);
                /*Datos Escolares*/

                /*Datos Laborales*/
                $("#imodalidadL3").val(espacioFisicoUsuario.modalidadIngreso);
                $("#amodalidadL3").val(espacioFisicoUsuario.modalidadActual);
                $("#ifechaL3").val(espacioFisicoUsuario.fechaIngreso);
                $("#efechaL3").val(espacioFisicoUsuario.fechaEgreso);
                $("#rolL3").val(espacioFisicoUsuario.rol);
                $("#tecnologiasL3").val(espacioFisicoUsuario.estatus);
                /*Datos Laborales*/
                /*Espacio Fisico Responsable*/
                /*Espacio Fisico*/

                /*Responsable*/
                /*Datos Personales*/
                $("#nombreP2").val(usuarioResponsable.nombre);
                $("#pApellidoP2").val(usuarioResponsable.primerApellido);
                $("#sApellidoP2").val(usuarioResponsable.segundoApellido);
                $("#fechaP2").val(usuarioResponsable.fechaNacimiento);
                $("#correoP2").val(usuarioResponsable.correoPersonal);
                $("#ctelefonoP2").val(usuarioResponsable.telefonoCelular);
                $("#catelefonoP2").val(usuarioResponsable.telefonoCasa);
                /*Datos Personales*/

                /*Datos Escolares*/
                $("#uniE2").val(usuarioResponsable.universidadEgreso);
                $("#carreraE2").val(usuarioResponsable.carreraEgreso);
                $("#icuatriE2").val(usuarioResponsable.cuatrimestreIngreso);
                $("#acuatriE2").val(usuarioResponsable.cuatrimestreActual);
                $("#correoInstitucionalE2").val(usuarioResponsable.correoInstitucional);
                /*Datos Escolares*/

                /*Datos Laborales*/
                $("#imodalidadL2").val(usuarioResponsable.modalidadIngreso);
                $("#amodalidadL2").val(usuarioResponsable.modalidadActual);
                $("#ifechaL2").val(usuarioResponsable.fechaIngreso);
                $("#efechaL2").val(usuarioResponsable.fechaEgreso);
                $("#rolL2").val(usuarioResponsable.rol);
                $("#tecnologiasL2").val(usuarioResponsable.estatus);
                /*Datos Laborales*/
                /*Responsable*/

                /*Utiliza*/
                /*Datos Personales*/
                $("#nombreP").val(usuarioUtiliza.nombre);
                $("#pApellidoP").val(usuarioUtiliza.primerApellido);
                $("#sApellidoP").val(usuarioUtiliza.segundoApellido);
                $("#fechaP").val(usuarioUtiliza.fechaNacimiento);
                $("#correoP").val(usuarioUtiliza.correoPersonal);
                $("#ctelefonoP").val(usuarioUtiliza.telefonoCelular);
                $("#catelefonoP").val(usuarioUtiliza.telefonoCasa);
                /*Datos Personales*/

                /*Datos Escolares*/
                $("#uniE").val(usuarioUtiliza.universidadEgreso);
                $("#carreraE").val(usuarioUtiliza.carreraEgreso);
                $("#icuatriE").val(usuarioUtiliza.cuatrimestreIngreso);
                $("#acuatriE").val(usuarioUtiliza.cuatrimestreActual);
                $("#correoInstitucionalE").val(usuarioUtiliza.correoInstitucional);
                /*Datos Escolares*/

                /*Datos Laborales*/
                $("#imodalidadL").val(usuarioUtiliza.modalidadIngreso);
                $("#amodalidadL").val(usuarioUtiliza.modalidadActual);
                $("#ifechaL").val(usuarioUtiliza.fechaIngreso);
                $("#efechaL").val(usuarioUtiliza.fechaEgreso);
                $("#rolL").val(usuarioUtiliza.rol);
                $("#tecnologiasL").val(usuarioUtiliza.estatus);
                /*Datos Laborales*/
                /*Utiliza*/

                /*Proyecto*/
                $("#identificadorPr").val(proyecto.identificador);
                $("#nombrePr").val(proyecto.nombre);
                $("#descripcionPr").val(proyecto.descripcion);
                $("#nombleClientePr").val(proyecto.nombreCliente);
                $("#correoElectronicoClientePr").val(proyecto.correoCliente);
                $("#telefonoClientePr").val(proyecto.telefonoCliente);
                $("#direccionClientePr").val(proyecto.direccionCliente);
                $("#ifechaPr").val(proyecto.fechaInicio);
                $("#fechaFinPr").val(proyecto.fechaFin);
                /*Proyecto*/

                $('#assignmentDetailsModal').modal('show');
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }

</script>
</body>
</html>
