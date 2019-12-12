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
    <title>Proyectos</title>
    <link rel="icon" type="image/png" href="<%=context%>/img/logocds.png"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Core CSS - Include with every page -->
    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<%=context%>/js/jquery-3.4.1.min.js"></script>

    <link href="<%=context%>/plugins/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%=context%>/fonts/contenido/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link href="<%=context%>/plugins/pace/pace-theme-big-counter.css" rel="stylesheet"/>
    <link href="<%=context%>/css/contenido/style.css" rel="stylesheet"/>
    <link href="<%=context%>/css/contenido/main-style.css" rel="stylesheet"/>
    <!--Sweet Alert 2-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <!--Pepe-->
    <%--    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.css">--%>
    <%--    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="<%=context%>/css/style.css">--%>
    <%--    <link rel="stylesheet" href="<%=context%>/fontawesome/css/all.css">--%>
    <%--    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>--%>
    <%--    <script src="<%=context%>/bootstrap/js/bootstrap.js"></script>--%>
    <%--    <script src="<%=context%>/bootstrap/js/bootstrap.min.js"></script>--%>
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
                    <a href="<%=context%>/inicio_rpbsi">
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
                    <a href="<%=context%>/jsp/gestionAsignaciones/indexAsignaciones.jsp">
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
                <h2 class="page-header"><i class="fa fa-folder" aria-hidden="true"></i> Proyectos</h2>
            </div>
            <!--End Page Header -->
        </div>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-circle btn-lg" style="background-color: #00AA83; color: white;"
                        data-toggle="modal" data-target="#addNewProjectModal">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead style="background-color: #00AA83; color: white;">
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">Identificador</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Cliente</th>
                    <th class="text-center">Fecha inicio</th>
                    <th class="text-center">Fecha cierre</th>
                    <th class="text-center">Estatus</th>
                    <th class="text-center" colspan="3">Acciones</th>
                </tr>
                </thead>
                <tbody class="text-justify">
                <s:iterator value="proyectoList" status="stat" var="lista">
                    <tr>
                        <td><s:property value="#stat.count"/></td>
                        <td><s:property value="identificador"/></td>
                        <td><s:property value="nombre"/></td>
                        <td><s:property value="nombreCliente"/></td>
                        <td><s:property value="fechaInicio"/></td>
                        <td><s:property value="fechaFin"/></td>
                        <td><s:property value="estatus"/></td>
                        <td class="text-center">
                            <button class="btn btn-warning" data-toggle="modal" data-target="#editProjectModal"
                                    style="margin-left: 2px;" onclick="consultarProyectoModificar(
                                <s:property value="id"/> )">
                                <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"
                                   data-target="#editProjectModal"></i>
                            </button>
                        </td>
                        <td class="text-center">
                            <s:if test="estatus=='Activo'">
                                <form method="post" action="<%=context%>/eliminarProyecto.action">
                                    <input type="hidden" name="bean.id" value="<s:property value="id" />"/>
                                    <button class="btn btn-danger" style="margin-left: 2px;" onclick="deshabilitar()">
                                        <i data-toggle="tooltip" title="Deshabilitar" class="fa fa-times"
                                           aria-hidden="true"></i>
                                    </button>
                                </form>
                            </s:if>
                            <s:if test="estatus=='Inactivo'">
                                <form method="post" action="<%=context%>/activarProyecto.action">
                                    <input type="hidden" name="bean.id" id="id" value="<s:property value="id" />"/>
                                    <button class="btn btn-success" style="margin-left: 2px;" onclick="habilitar()">
                                        <i data-toggle="tooltip" title="Habilitar" class="fa fa-check"
                                           aria-hidden="true" onclick="habilitar()"></i>
                                    </button>
                                </form>
                            </s:if>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-info" data-toggle="modal" data-target="#projectDetailsModal"
                                    onclick="consultarProyecto(
                                        <s:property value="id"/> )">
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
<!--New project-->
<div class="modal fade" id="addNewProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title" id="exampleModalLongTitle">Nuevo proyecto</h4>
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
                <form method="post" action="registrarProyecto.action">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Identificador</label>
                            <input type="text" class="form-control" maxlength="50" id="identificadorNuevo" required
                                   name="bean.identificador" value="<s:property value="bean.identificador"/>"/>
                        </div>
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" required name="bean.nombre"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Fecha inicio</label>
                            <input type="date" class="form-control" required name="bean.fechaInicio"
                                   id="fechaInicioNew"/>
                        </div>
                        <div class="col-md-6">
                            <label>Fecha de cierre</label>
                            <input type="date" class="form-control" required name="bean.fechaFin"
                                   onchange="validarFecha()" id="fechaFinNew"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" required name="bean.descripcion"
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                    <h4 style="margin-top: 20px; margin-bottom: 10px;">Datos del cliente</h4>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" required name="bean.nombreCliente"/>
                        </div>
                        <div class="col-md-6">
                            <label>Teléfono</label>
                            <input type="number" class="form-control" required name="bean.telefonoCliente"
                                   minlength="10" maxlength="10"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12">
                            <label>Dirección</label>
                            <input type="text" class="form-control" maxlength="50" required
                                   name="bean.direccionCliente"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Correo electrónico</label>
                            <input type="email" class="form-control" maxlength="50" required name="bean.correoCliente"/>
                        </div>
                    </div>
                    <div class="modal-footer" style="margin-top: -20px;">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success" id="botonGuardar">Guardar</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--End New project-->

<!--Project details-->
<div class="modal fade" id="projectDetailsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Detalles del proyecto</h4>
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
                            <label>Identificador</label>
                            <input type="text" class="form-control" maxlength="50" readonly id="identificadorDetail"/>
                        </div>
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" readonly id="nombreDetail"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Fecha inicio</label>
                            <input type="date" class="form-control" readonly id="fechaInicioDetail"/>
                        </div>
                        <div class="col-md-6">
                            <label>Fecha de cierre</label>
                            <input type="date" class="form-control" readonly id="fechaCierreDetail"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" readonly id="descripcionDetail"
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                    <h4 style="margin-top: 20px; margin-bottom: 10px;">Datos del cliente</h4>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" readonly id="nombreClienteDetail"/>
                        </div>
                        <div class="col-md-6">
                            <label>Teléfono</label>
                            <input type="number" class="form-control" readonly id="telefonoClienteDetail"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12">
                            <label>Dirección</label>
                            <input type="text" class="form-control" maxlength="50" readonly
                                   id="direccionClienteDetail"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Correo electrónico</label>
                            <input type="email" class="form-control" maxlength="50" readonly id="emailClienteDetail"/>
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
<!--Projects details-->

<!--Edit project-->
<div class="modal fade" id="editProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <table>
                    <tbody>
                    <tr>
                        <td style="width: 200rem;">
                            <h4 class="modal-title">Editar proyecto</h4>
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
                <form method="post" action="modificarProyecto.action">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Identificador</label>
                            <input type="text" class="form-control" maxlength="50" required name="bean.identificador"
                                   id="identificadorModificar"/>
                            <input type="hidden" name="bean.id" id="idModificar"/>
                        </div>
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" required name="bean.nombre"
                                   id="nombreModificar"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Fecha inicio</label>
                            <input type="date" class="form-control" required name="bean.fechaInicio"
                                   id="fechaInicioModificar"/>
                        </div>
                        <div class="col-md-6">
                            <label>Fecha de cierre</label>
                            <input type="date" class="form-control" required name="bean.fechaFin"
                                   id="fechaCierreModificar"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12">
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" maxlength="50" required name="bean.descripcion"
                                      id="descripcionModificar"
                                      style="max-width: 100%; min-width: 100%; max-height: 20%; min-height: 10%;"></textarea>
                        </div>
                    </div>
                    <h4 style="margin-top: 20px; margin-bottom: 10px;">Datos del cliente</h4>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" maxlength="50" required name="bean.nombreCliente"
                                   id="nombreClienteModificar"/>
                        </div>
                        <div class="col-md-6">
                            <label>Teléfono</label>
                            <input type="number" class="form-control" required name="bean.telefonoCliente"
                                   id="telefonoClienteModificar"/>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12">
                            <label>Dirección</label>
                            <input type="text" class="form-control" maxlength="50" required name="bean.direccionCliente"
                                   id="direccionClienteModificar"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Correo electrónico</label>
                            <input type="email" class="form-control" maxlength="50" required name="bean.correoCliente"
                                   id="emailClienteModificar"/>
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
<!--End Edit project-->
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

    //Se recupera la direccion raiz del archivo
    //---------------------------------------------------------------------------------------------------------------
    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";
    //---------------------------------------------------------------------------------------------------------------

    //función de enviar correo
    //---------------------------------------------------------------------------------------------------------------
    function consultarProyecto(idProyecto) {
        $.ajax({
            type: "POST",
            url: raiz + "consultarProyectoPorId",
            data: "bean.id=" + idProyecto,
            success: function (data) {
                $("#identificadorDetail").val(data.bean.identificador);
                $("#nombreDetail").val(data.bean.nombre);
                $("#fechaInicioDetail").val(data.bean.fechaInicio);
                $("#fechaCierreDetail").val(data.bean.fechaFin);
                $("#descripcionDetail").val(data.bean.descripcion);
                $("#nombreClienteDetail").val(data.bean.nombreCliente);
                $("#telefonoClienteDetail").val(data.bean.telefonoCliente);
                $("#direccionClienteDetail").val(data.bean.direccionCliente);
                $("#emailClienteDetail").val(data.bean.correoCliente);
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }

    function validarFecha() {
        var fechaInicio = $("#fechaInicioNew").val();
        var creadaInicio = new Date(fechaInicio);
        var fechaFin = $("#fechaFinNew").val();
        var creadaFin = new Date(fechaFin);

        if (creadaFin <= creadaInicio)
            alert("La fecha de termino no puede ser menor a la fecha de inicio");
        $("#botonGuardar").prop('disabled', creadaFin <= creadaInicio);
    }

    function consultarProyectoModificar(idProyecto) {
        $.ajax({
            type: "POST",
            url: raiz + "consultarProyectoPorId",
            data: "bean.id=" + idProyecto,
            success: function (data) {
                $("#idModificar").val(data.bean.id);
                $("#identificadorModificar").val(data.bean.identificador);
                $("#nombreModificar").val(data.bean.nombre);
                $("#fechaInicioModificar").val(data.bean.fechaInicio);
                $("#fechaCierreModificar").val(data.bean.fechaFin);
                $("#descripcionModificar").val(data.bean.descripcion);
                $("#nombreClienteModificar").val(data.bean.nombreCliente);
                $("#telefonoClienteModificar").val(data.bean.telefonoCliente);
                $("#direccionClienteModificar").val(data.bean.direccionCliente);
                $("#emailClienteModificar").val(data.bean.correoCliente);
            },
            error: function (data) {
                alert("Hubo un error al enviar el correo electrónico, \n por favor intentelo de nuevo.");
            }
        });
    }
</script>

</body>
</html>

