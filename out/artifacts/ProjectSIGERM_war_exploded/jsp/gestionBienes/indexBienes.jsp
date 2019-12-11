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
    <title>Bienes</title>
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
                    <label class="text-right"><s:property value="#session.usuario.nombre"/><br><small><s:property
                            value="#session.usuario.rol"/></small></label>
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
                <h2 class="page-header"><i class="fa fa-desktop" aria-hidden="true"></i> Bienes</h2>
            </div>
            <!--End Page Header -->
        </div>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-circle btn-lg" style="background-color: #00AA83; color: white;"
                        data-toggle="modal" data-target="#addNewPropertyModal">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead style="background-color: #00AA83; color: white;">
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">Código</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Marca</th>
                    <th class="text-center">Modelo</th>
                    <th class="text-center">Estatus</th>
                    <th class="text-center" colspan="3">Acciones</th>
                </tr>
                </thead>
                <tbody class="text-justify">
                <!--<tr>
                    <td class="text-center">1</td>
                    <td>123456</td>
                    <td>Monitor</td>
                    <td>Dell</td>
                    <td>SE2719H</td>
                    <td>Activo</td>
                    <td class="text-center">
                        <button class="btn btn-info" data-toggle="modal" data-target="#propertyDetailsModal">
                            <i data-toggle="tooltip" title="Detalles" class="fa fa-eye" aria-hidden="true"></i>
                        </button>
                        <button class="btn btn-warning" data-toggle="modal" data-target="#editPropertyModal"
                                style="margin-left: 2px;">
                            <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"
                               data-target="#editUserModal"></i>
                        </button>
                        <button class="btn btn-success" style="margin-left: 2px;" onclick="deshabilitar()">
                            <i data-toggle="tooltip" title="Deshabilitar" class="fa fa-check"
                               aria-hidden="true"></i>
                        </button>
                    </td>
                </tr>-->
                <s:iterator value="listBien" status="stat" var="lista">
                    <tr>
                        <td><s:property value="#stat.count"/></td>
                        <td><s:property value="codigo_inventario"/></td>
                        <td><s:property value="nombre"/></td>
                        <td><s:property value="marca"/></td>
                        <td><s:property value="modelo"/></td>
                        <td><s:property value="estatus"/></td>
                        <td class="text-center">
                            <button class="btn btn-warning" onclick="consultarDatosM(<s:property value="id_bien" />)">
                                <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"
                                   data-target="#editUserModal"></i>
                            </button>
                        </td>
                        <td class="text-center">
                            <s:if test="estatus=='Activo'">
                                <form method="post" action="<%=context%>/EliminarBien.action">
                                    <input type="hidden" name="bean.id_bien" value="<s:property value="id_bien" />"/>
                                    <button class="btn btn-danger" style="margin-left: 2px;" onclick="deshabilitar()">
                                        <i data-toggle="tooltip" title="Deshabilitar" class="fa fa-times"
                                           aria-hidden="true"></i>
                                    </button>
                                </form>
                            </s:if>
                            <s:if test="estatus=='Inactivo'">
                                <form method="post" action="<%=context%>/activarBien.action">
                                    <input type="hidden" name="bean.id_bien" id="id" value="<s:property value="id_bien" />"/>
                                    <button class="btn btn-success" style="margin-left: 2px;" onclick="habilitar()">
                                        <i data-toggle="tooltip" title="Habilitar" class="fa fa-check"
                                           aria-hidden="true" onclick="habilitar()"></i>
                                    </button>
                                </form>
                            </s:if>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-info"  onclick="consultarDatos(<s:property value="id_bien" />)">
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
<!--New bien-->
<div class="modal fade" id="addNewPropertyModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title" id="exampleModalLongTitle">Nuevo bien</h4>
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
                <form method="post" action="InsertarBien.action" id="registrarBien">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Código</label>
                            <input type="text" class="form-control" name="bean.codigo_inventario" id="codigo_inventario" maxlength="50" required/>
                        </div>
                        <div class="col-md-6">
                            <label>Número de serie</label>
                            <input type="text" class="form-control" name="bean.no_serie" id="no_serie" maxlength="50" required/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" name="bean.nombre" id="nombre" required/>
                        </div>
                        <div class="col-md-6">
                            <label>Marca</label>
                            <input type="text" class="form-control" name="bean.marca" id="marca" required/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Modelo</label>
                            <input type="text" class="form-control" name="bean.modelo" id="modelo" maxlength="50" required/>
                        </div>
                        <div class="col-md-6">
                            <label>Precio</label>
                            <input type="number" class="form-control" name="bean.precio" id="precio" maxlength="50" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" name="bean.descripcion" id="descripcion" maxlength="50" required
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="registrarBien.submit()">Guardar</button>
            </div>
        </div>
        </form>
    </div>
</div>
<!--End New property modal-->

<!--Bien details-->
<div class="modal fade" id="propertyDetailsModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Detalles del bien</h4>
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
                <form>
                    <input type="text" class="form-control" style="visibility:hidden" name="bean.id_bien" id="id_bienp" maxlength="50" readonly/>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Código</label>
                            <input type="text" class="form-control" maxlength="50" id="codigo" readonly/>
                        </div>
                        <div class="col-md-6">
                            <label>Número de serie</label>
                            <input type="text" class="form-control" maxlength="50" id="no_seriep" readonly/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" id="nombrep" readonly/>
                        </div>
                        <div class="col-md-6">
                            <label>Marca</label>
                            <input type="text" class="form-control" id="marcap" readonly/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Modelo</label>
                            <input type="text" class="form-control" maxlength="50" id="modelop" readonly/>
                        </div>
                        <div class="col-md-6">
                            <label>Precio</label>
                            <input type="number" class="form-control" maxlength="50" id="preciop" readonly/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" id="descripcionp" readonly
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!--End Property details-->

<!--Edit bien-->
<div class="modal fade" id="editPropertyModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Editar bien</h4>
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
                <form method="post" action="ModificarBien.action" id="modificarBien">
                    <input type="text" class="form-control" style="visibility:hidden" name="bean.id_bien" id="id_bienm" maxlength="50" readonly/>
                    <input type="text" class="form-control" style="visibility:hidden" name="bean.estatus" id="estatusm" maxlength="50" readonly/>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Código</label>
                            <input type="text" class="form-control" name="bean.codigo_inventario" maxlength="50" id="codigom" required/>
                        </div>
                        <div class="col-md-6">
                            <label>Número de serie</label>
                            <input type="text" class="form-control" name="bean.no_serie" maxlength="50" id="no_seriem" required/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" name="bean.nombre" id="nombrem" required/>
                        </div>
                        <div class="col-md-6">
                            <label>Marca</label>
                            <input type="text" class="form-control" name="bean.marca" id="marcam" required/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Modelo</label>
                            <input type="text" class="form-control" maxlength="50" name="bean.modelo" id="modelom" required/>
                        </div>
                        <div class="col-md-6">
                            <label>Precio</label>
                            <input type="number" class="form-control" id="preciom" name="bean.precio"maxlength="50" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" name="bean.descripcion" id="descripcionm" maxlength="50" required
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="modificarBien.submit()">Actualizar</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!--End Edit property-->
<!--End Modals-->

<!--Hugo-->
<!--<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <a class="navbar-brand" href="#">SIGERM</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="<%=context%>/inicio">Perfil de usuario <i class="fas fa-user"></i></i>
                    <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=context%>/MostrarUsuarios">Gestión de usuarios <i class="fas fa-user-friends"></i><span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Gestión de bienes <i
                        class="fas fa-user-friends"></i><span
                        class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a data-toggle="modal" class="nav-link" data-target="#modalCerrarSesion">
                    Cerrar Sesión <i class="fas fa-power-off"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>-->
<!-- Modal cerrar sesión  -->
<!--<div class="modal fade" id="modalCerrarSesion" tabindex="-1" role="dialog" aria-labelledby="modalCerrarSesionLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalCerrarSesionLabel">¿Estas seguro que deseas cerrar sesión? <i
                        class="fas fa-power-off"></i></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                <a class="btn btn-danger" href="<%=context%>/CerrarSesion" style="text-decoration: none;">Si</a>
            </div>
        </div>
    </div>
</div>-->
<!--<div class="container">
    <div class="row">
        <div class="col-sm-1">
            <button class="btn btn-success" data-toggle="modal" data-target="#formularioModal"><i
                    class="fas fa-plus-square"></i></button>
        </div>

        <div class="modal fade" id="formularioModal" tabindex="-1" role="dialog" aria-labelledby="formularioModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="formularioModalLabel">Registro de nuevo bien </i><span
                                class="sr-only">(current)</span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="InsertarBien.action">

                                <div class="tab-content">

                                        <hr />
                                        <label>Codigo Inventario</label>
                                        <input type="text" name="bean.codigo_inventario" id="codigo_inventario" class="form-control"/>
                                        <br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>nombre</label>
                                                <input type="text" name="bean.nombre" id="nombre" class="form-control"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label>Precio</label>
                                                <input type="text" name="bean.precio" id="precio"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Marca</label>
                                            <input type="text" name="bean.marca" id="marca" class="form-control"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Modelo</label>
                                            <input type="text" name="bean.modelo" id="modelo"
                                                   class="form-control"/>
                                        </div>
                                    </div>
                                        <br/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Numero de serie</label>
                                                <input type="textarea" name="bean.no_serie" id="no_serie"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    <label>Descripcion</label>
                                    <input type="textarea" name="bean.descripcion" id="descripcion"
                                           class="form-control"/>

                                        <hr />

                                </div>


                            <button class="btn btn-success" type="submit">
                                Guardar
                            </button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>



        <div class="col-md-12">
            <br/>
            <table class="table table-hover table-responsive">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Código</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Modelo</th>
                    <th scope="col">No. serie</th>
                    <th scope="col">Estatus</th>
                    <th scope="col" colspan="3">Acciones</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="listBien" status="stat" var="lista">
                    <tr>
                        <td><s:property value="#stat.count"/></td>
                        <td><s:property value="codigo_inventario"/></td>
                        <td><s:property value="nombre"/></td>
                        <td><s:property value="descripcion"/></td>
                        <td><s:property value="precio"/></td>
                        <td><s:property value="marca"/></td>
                        <td><s:property value="modelo"/></td>
                        <td><s:property value="no_serie"/></td>
                        <td><s:property value="estatus"/></td>

                        <td>
                               <button class="btn btn-success" data-toggle="modal" data-target="#formularioModificar<%=cont%>"><i
                                       class="fas fa-feather-alt"></i></button>
                               <div class="modal fade" id="formularioModificar<%=cont%>" tabindex="-1" role="dialog" aria-labelledby="formularioModalLabell"
                                    aria-hidden="true">
                                   <div class="modal-dialog modal-lg" role="document">
                                       <div class="modal-content">
                                           <div class="modal-header">
                                               <h5 class="modal-title" id="formularioModalLabell">Modificar bien</i><span
                                                       class="sr-only">(current)</span></h5>
                                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                               </button>
                                           </div>
                                           <div class="modal-body">
                                               <form method="post" action="ModificarBien.action">

                                                   <div class="tab-content">

                                                       <hr/>
                                                       <input type="hidden" name="bean.id_bien" id="Mid_bien" value="<s:property value="id_bien"/>"/>
                                                       <input type="hidden" name="bean.estatus" id="Mestatus" value="<s:property value="estatus"/>"/>
                                                       <label>Codigo Inventario</label>
                                                       <input type="text" name="bean.codigo_inventario" id="Mcodigo_inventario" class="form-control" value="<s:property value="codigo_inventario"/>"/>
                                                       <br/>
                                                       <div class="row">
                                                           <div class="col-md-6">
                                                               <label>nombre</label>
                                                               <input type="text" name="bean.nombre" id="Mnombre" class="form-control" value="<s:property value="nombre"/>"/>
                                                           </div>
                                                           <div class="col-md-6">
                                                               <label>Precio</label>
                                                               <input type="text" name="bean.precio" id="Mprecio"
                                                                      class="form-control" value="<s:property value="precio"/>"/>
                                                           </div>
                                                       </div>
                                                       <br/>
                                                       <div class="row">
                                                           <div class="col-md-6">
                                                               <label>Marca</label>
                                                               <input type="text" name="bean.marca" id="Mmarca" class="form-control" value="<s:property value="marca"/>"/>
                                                           </div>
                                                           <div class="col-md-6">
                                                               <label>Modelo</label>
                                                               <input type="text" name="bean.modelo" id="Mmodelo"
                                                                      class="form-control" value="<s:property value="modelo"/>"/>
                                                           </div>
                                                       </div>
                                                       <br/>
                                                       <div class="row">
                                                           <div class="col-md-6">
                                                               <label>Numero de serie</label>
                                                               <input type="textarea" name="bean.no_serie" id="Mno_serie"
                                                                      class="form-control" value="<s:property value="no_serie"/>"/>
                                                           </div>
                                                       </div>
                                                       <label>Descripcion</label>
                                                       <input type="textarea" name="bean.descripcion" id="Mdescripcion"
                                                              class="form-control" value="<s:property value="descripcion"/>"/>

                                                       <hr />

                                                   </div>


                                                   <button class="btn btn-success" type="submit">
                                                       Guardar
                                                   </button>
                                               </form>
                                           </div>
                                           <div class="modal-footer">
                                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                               <%cont++;%>
                        </td>
                        <td>
                            <form method="post" action="EliminarBien.action">
                                <input type="hidden" name="bean.id_bien" id="id_bien" value="<s:property value="id_bien" />"/>
                                <button class="btn btn-danger"><i class="fas fa-user-times"></i></button>
                            </form>
                        </td>
                        <td>
                               <button class="btn btn-primary" data-toggle="modal"  data-target="#formularioMostrar<%=cont2%>"><i
                                       class="fas fa-info-circle"></i></button>
                               <div class="modal fade" id="formularioMostrar<%=cont2%>" tabindex="-1" role="dialog" aria-labelledby="formularioModalLabell"
                                    aria-hidden="true">
                                   <div class="modal-dialog modal-lg" role="document">
                                       <div class="modal-content">
                                           <div class="modal-header">
                                               <h5 class="modal-title" id="formularioModalLabell">Detalles bien</i><span
                                                       class="sr-only">(current)</span></h5>
                                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                               </button>
                                           </div>
                                           <div class="modal-body">


                                                   <div class="tab-content">

                                                       <hr/>
                                                       <input type="hidden" name="bean.id_bien" id="Mid_bien" value="<s:property value="id_bien"/>"/>
                                                       <label>Codigo Inventario</label>
                                                       <input type="text" name="bean.codigo_inventario" id="Mcodigo_inventario" class="form-control" value="<s:property value="codigo_inventario"/>"/>
                                                       <br/>
                                                       <div class="row">
                                                           <div class="col-md-6">
                                                               <label>nombre</label>
                                                               <input type="text" name="bean.nombre" id="Mnombre" class="form-control" value="<s:property value="nombre"/>"/>
                                                           </div>
                                                           <div class="col-md-6">
                                                               <label>Precio</label>
                                                               <input type="text" name="bean.precio" id="Mprecio"
                                                                      class="form-control" value="<s:property value="precio"/>"/>
                                                           </div>
                                                       </div>
                                                       <br/>
                                                       <div class="row">
                                                           <div class="col-md-6">
                                                               <label>Marca</label>
                                                               <input type="text" name="bean.marca" id="Mmarca" class="form-control" value="<s:property value="marca"/>"/>
                                                           </div>
                                                           <div class="col-md-6">
                                                               <label>Modelo</label>
                                                               <input type="text" name="bean.modelo" id="Mmodelo"
                                                                      class="form-control" value="<s:property value="modelo"/>"/>
                                                           </div>
                                                       </div>
                                                       <br/>
                                                       <div class="row">
                                                           <div class="col-md-6">
                                                               <label>Numero de serie</label>
                                                               <input type="textarea" name="bean.no_serie" id="Mno_serie"
                                                                      class="form-control" value="<s:property value="no_serie"/>"/>
                                                           </div>
                                                       </div>
                                                       <label>Descripcion</label>
                                                       <input type="textarea" name="bean.descripcion" id="Mdescripcion"
                                                              class="form-control" value="<s:property value="descripcion"/>"/>

                                                       <hr />

                                                   </div>
                                           </div>
                                           <div class="modal-footer">
                                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                               <%cont++;%>
                        </td>

                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>-->

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
<!-- Script de metodos asincronos en el jsp -->
<script>
    //Se recupera la direccion raiz del archivo
    //---------------------------------------------------------------------------------------------------------------
    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";
    //---------------------------------------------------------------------------------------------------------------

    //función de enviar correo
    //---------------------------------------------------------------------------------------------------------------
    function consultarDatos(idBien) {
        $.ajax({
            type: "POST",
            url: raiz + "consultarDatos",
            data: "id=" + idBien,
            success: function (data) {
                /*alert("Exito");
                alert("data" + data.bean.nombre);*/
                $("#id_bienp").val(data.bean.id_bien);
                $("#codigo").val(data.bean.codigo_inventario);
                $("#no_seriep").val(data.bean.no_serie);
                $("#nombrep").val(data.bean.nombre);
                $("#marcap").val(data.bean.marca);
                $("#modelop").val(data.bean.modelo);
                $("#preciop").val(data.bean.precio);
                $("#descripcionp").val(data.bean.descripcion);
                $('#propertyDetailsModal').modal('show');
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }
    function consultarDatosM(idBien) {
        $.ajax({
            type: "POST",
            url: raiz + "consultarDatos",
            data: "id=" + idBien,
            success: function (data) {
                /*alert("Exito");
                alert("data" + data.bean.nombre);*/
                $("#id_bienm").val(data.bean.id_bien);
                $("#codigom").val(data.bean.codigo_inventario);
                $("#no_seriem").val(data.bean.no_serie);
                $("#nombrem").val(data.bean.nombre);
                $("#marcam").val(data.bean.marca);
                $("#modelom").val(data.bean.modelo);
                $("#preciom").val(data.bean.precio);
                $("#descripcionm").val(data.bean.descripcion);
                $("#estatusm").val(data.bean.estatus);
                $('#editPropertyModal').modal('show');
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }

</script>
</body>
</html>
