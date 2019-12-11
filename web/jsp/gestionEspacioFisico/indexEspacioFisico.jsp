<%@ page import="java.util.List" %>
<%@ page import="com.utez.edu.mx.domains.usuario.model.BeanUsuario" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<% String context = request.getContextPath();%>
<html>
<s:if test="#session.usuario.correoInstitucional==null">
    <script>
        window.location.href = "<%=context%>/index.jsp";
    </script>
</s:if>

<head>
    <title>Espacios físicos</title>
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

</head>

<body>
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
                    <a href="<%=context%>/consultarEspacioFisicos.action">
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
                <h2 class="page-header"><i class="fa fa-building-o" aria-hidden="true"></i> Espacios físicos</h2>
            </div>
            <!--End Page Header -->
        </div>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-circle btn-lg" style="background-color: #00AA83; color: white;"
                        data-toggle="modal" data-target="#addNewPhysicalSpaceModal">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead style="background-color: #00AA83; color: white;">
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Tipo</th>
                    <th class="text-center">Posición</th>
                    <th class="text-center">Responsable</th>
                    <th class="text-center">Estatus</th>
                    <th class="text-center" colspan="3">Acciones</th>
                </tr>
                </thead>
                <tbody class="text-justify">
                <s:iterator value="espacioFisicoList" status="stat" var="lista">
                    <tr>
                        <td><s:property value="#stat.count"/></td>
                        <td><s:property value="nombre"/></td>
                        <td><s:property value="tipo"/></td>
                        <s:if test="posicion!=0">
                            <td><s:property value="posicion"/></td>
                        </s:if>
                        <s:if test="posicion==0">
                            <td>No tiene</td>
                        </s:if>
                        <td><s:property value="usuario.nombre"/></td>
                        <td><s:property value="estatus"/></td>
                        <td class="text-center">
                            <button class="btn btn-warning" data-toggle="modal" data-target="#editPhysicalSpaceModal"
                                    onclick="consultarEspacioFisicoModificar(
                                        <s:property value="id_espacio_fisico"/> )" style="margin-left: 2px;">
                                <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"
                                   data-target="#editPhysicalSpaceModal"></i>
                            </button>
                        </td>
                        <td class="text-center">
                            <s:if test="estatus=='Activo'">
                                <form method="post" action="<%=context%>/eliminarEspacioFisico.action">
                                    <input type="hidden" name="espacioFisicoBean.id_espacio_fisico"
                                           value="<s:property value="id_espacio_fisico" />"/>
                                    <button class="btn btn-danger" style="margin-left: 2px;" onclick="deshabilitar()">
                                        <i data-toggle="tooltip" title="Deshabilitar" class="fa fa-times"
                                           aria-hidden="true"></i>
                                    </button>
                                </form>
                            </s:if>
                            <s:if test="estatus=='Inactivo'">
                                <form method="post" action="<%=context%>/activarEspacioFisico.action">
                                    <input type="hidden" name="espacioFisicoBean.id_espacio_fisico"
                                           id="id_espacio_fisico" value="<s:property value="id_espacio_fisico" />"/>
                                    <button class="btn btn-success" style="margin-left: 2px;" onclick="habilitar()">
                                        <i data-toggle="tooltip" title="Habilitar" class="fa fa-check"
                                           aria-hidden="true" onclick="habilitar()"></i>
                                    </button>
                                </form>
                            </s:if>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-info" data-toggle="modal" data-target="#physicalSpaceDetailsModal"
                                    onclick="consultarEspacioFisico(
                                        <s:property value="id_espacio_fisico"/> )">
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
<!--New physicalSpace-->
<div class="modal fade" id="addNewPhysicalSpaceModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title" id="exampleModalLongTitle">Nuevo espacio físico</h4>
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
                <form method="post" action="registrarEspacioFisico.action">>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" required
                                   name="espacioFisicoBean.nombre"/>
                        </div>
                        <div class="col-md-6">
                            <label>Responsable</label>
                            <select class="form-control" required name="espacioFisicoBean.usuario.id">
                                <s:iterator value="usuariosList" status="stat" var="lista">
                                    <option value="<s:property value="id"/>"><s:property value="nombre"/></option>
                                </s:iterator>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Tipo</label>
                            <select class="form-control" required name="espacioFisicoBean.tipo">
                                <option value="isla">Isla</option>
                                <option value="oficina">Oficina</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" required
                                      name="espacioFisicoBean.descripcion"
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer" style="margin-top: -20px;">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Guardar</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--End New physicalSpace-->

<!--PhysicalSpace details-->
<div class="modal fade" id="physicalSpaceDetailsModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Detalles del espacio físico</h4>
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
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" readonly id="nombreDetail"/>
                        </div>
                        <div class="col-md-6">
                            <label>Responsable</label>
                            <input type="text" class="form-control" maxlength="50" readonly id="responsableDetail"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Tipo</label>
                            <input type="text" class="form-control" maxlength="50" readonly id="tipoDetail"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" readonly id="descripcionDetail"
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="margin-top: -20px;">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!--End PhysicalSpace details-->

<!--Edit PhysicalSpace-->
<div class="modal fade" id="editPhysicalSpaceModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Editar espacio físico</h4>
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
                <form method="post" action="modificarEspacioFisico.action">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="hidden" name="espacioFisicoBean.id_espacio_fisico"
                                   id="idModificar"/>
                            <input type="text" class="form-control" maxlength="50" required
                                   name="espacioFisicoBean.nombre"
                                   id="nombreModificar"/>
                        </div>
                        <div class="col-md-6">
                            <label>Responsable</label>
                            <select class="form-control" required name="espacioFisicoBean.usuario.id"
                                    id="responsableModificar">
                                <s:iterator value="usuariosList" status="stat" var="lista">
                                    <option value="<s:property value="id"/>"><s:property value="nombre"/></option>
                                </s:iterator>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Tipo</label>
                            <select class="form-control" required name="espacioFisicoBean.tipo" id="tipoModificar">
                                <option value="isla">Isla</option>
                                <option value="oficina">Oficina</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" required
                                      name="espacioFisicoBean.descripcion" id="descripcionModificar"
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer" style="margin-top: -20px;">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Actualizar</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--End Edit PhysicalSpace-->
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

    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";

    function consultarEspacioFisico(idEspacio) {
        $.ajax({
            type: "POST",
            url: raiz + "consultarEspacioFisicoPorId",
            data: "espacioFisicoBean.id_espacio_fisico=" + idEspacio,
            success: function (data) {
                $("#nombreDetail").val(data.espacioFisicoBean.nombre);
                $("#responsableDetail").val(data.espacioFisicoBean.usuario.nombre);
                $("#tipoDetail").val(data.espacioFisicoBean.tipo);
                $("#descripcionDetail").val(data.espacioFisicoBean.descripcion);
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }

    function consultarEspacioFisicoModificar(idEspacio) {
        $.ajax({
            type: "POST",
            url: raiz + "consultarEspacioFisicoPorId",
            data: "espacioFisicoBean.id_espacio_fisico=" + idEspacio,
            success: function (data) {
                $("#idModificar").val(data.espacioFisicoBean.id_espacio_fisico);
                $("#nombreModificar").val(data.espacioFisicoBean.nombre);
                $("#responsableModificar").val(data.espacioFisicoBean.usuario.id);
                $("#tipoModificar").val(data.espacioFisicoBean.tipo);
                $("#descripcionModificar").val(data.espacioFisicoBean.descripcion);
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }

</script>

</body>
</html>
