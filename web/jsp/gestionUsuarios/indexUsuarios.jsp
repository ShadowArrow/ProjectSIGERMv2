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
<% String context = request.getContextPath();%>
<html>
<s:if test="#session.usuario.correoInstitucional==null">
    <script>
        window.location.href = "<%=context%>/index.jsp";
    </script>
</s:if>
<head>
    <title>Usuarios</title>
    <link rel="icon" type="image/png" href="<%=context%>/img/logocds.png"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Core CSS - Include with every page -->
    <link href="<%=context%>/plugins/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%=context%>/fonts/contenido/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!--<link href="<%=context%>/fonts/contenido/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">-->
    <link href="<%=context%>/plugins/pace/pace-theme-big-counter.css" rel="stylesheet"/>
    <link href="<%=context%>/css/contenido/style.css" rel="stylesheet"/>
    <link href="<%=context%>/css/contenido/main-style.css" rel="stylesheet"/>
    <!--Sweet Alert 2-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <!--Macías-->
    <!--<link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="stylesheet" href="<%=context%>/fontawesome/css/all.css">
    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.min.js"></script>
    <title>SIGERM GESTIÓN DE USUARIOS</title>-->
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
                    <a href="#">
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
                <h2 class="page-header"><i class="fa fa-users"></i> Usuarios</h2>
            </div>
            <!--End Page Header -->
        </div>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-circle btn-lg" style="background-color: #00AA83; color: white;"
                        data-toggle="modal" data-target="#formularioModal" onclick="limpiarFormulario()">
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
                    <th class="text-center">Fecha de nacimiento</th>
                    <th class="text-center">Modalidad actual</th>
                    <th class="text-center">Correo institucional</th>
                    <th class="text-center">Estatus</th>
                    <th class="text-center" colspan="3">Acciones</th>
                </tr>
                </thead>
                <tbody class="text-justify">

                <s:iterator value="listUsuario" status="stat" var="lista">
                    <tr>
                        <td><s:property value="#stat.count"/></td>
                        <td><s:property value="nombre"/> <s:property value="primerApellido"/> <s:property
                                value="segundoApellido"/></td>
                        <td><s:property value="fechaNacimiento"/></td>
                        <td><s:property value="modalidadActual"/></td>
                        <td><s:property value="correoInstitucional"/></td>
                        <td><s:property value="estatus"/></td>
                        <td>
                            <button class="btn btn-warning" data-toggle="modal" data-target="#editUserModal"
                                    style="margin-left: 2px;" onclick="obtenerDatosModificar(this.value)"
                                    value="<s:property value="id" />">
                                <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"
                                   data-target="#editUserModal"></i>
                            </button>
                        </td>
                        <td>
                            <%if (request.getAttribute("estatus").equals("activo")) {%>
                            <form method="post" action="EliminarUsuarios">
                                <input type="hidden" name="bean.id" id="id" value="<s:property value="id" />"/>
                                <button class="btn btn-danger" style="margin-left: 2px;" onclick="deshabilitar()">
                                    <i data-toggle="tooltip" title="Deshabilitar" class="fa fa-times"
                                       aria-hidden="true"></i>
                                </button>
                            </form>
                            <%} else {%>
                            <form method="post" action="ActivarUsuario">
                                <input type="hidden" name="bean.id" id="id" value="<s:property value="id" />"/>
                                <button class="btn btn-success" style="margin-left: 2px;" onclick="habilitar()">
                                    <i data-toggle="tooltip" title="Habilitar" class="fa fa-check"
                                       aria-hidden="true" onclick="habilitar()"></i>
                                </button>

                            </form>

                            <%}%>
                        </td>
                        <td>
                            <button class="btn btn-info" value="<s:property value="id" />"
                                    onclick="obtenerDatosMostrar(this.value)">
                                <i data-toggle="tooltip" title="Detalles" class="fa fa-eye" aria-hidden="true"></i>
                            </button>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        <br>
        </div>
    </div>
    <!-- end page-wrapper -->
</div>
<!-- end wrapper -->

<!--Modals-->
<!--New user-->
<div class="modal fade" id="formularioModal" tabindex="-1" role="dialog" aria-labelledby="formularioModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" id="headerFormulario">

            </div>
            <div class="modal-body" id="bodyFormulario">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <br/>

                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a href="#datos_personales" class="nav-link active" role="tab"
                               data-toggle="tab">Información
                                personal</a>
                        </li>

                        <li class="nav-item">
                            <a href="#datos_escolares" class="nav-link" role="tab" data-toggle="tab">Información
                                escolar</a>
                        </li>

                        <li class="nav-item">
                            <a href="#datos_laborales" class="nav-link" role="tab" data-toggle="tab">Información
                                laboral</a>
                        </li>

                        <li class="nav-item">
                            <a href="#tecnologias_aplicadas" class="nav-link" role="tab" data-toggle="tab">Tecnologías
                                aplicadas</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane in active" id="datos_personales">
                            <hr/>
                            <label>Nombre(s)</label>
                            <input type="text" name="bean.nombre" id="nombre" class="form-control" value=""/>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Primer Apellido</label>
                                    <input type="text" name="bean.primerApellido" id="primerApellido"
                                           class="form-control" value=""/>
                                </div>
                                <div class="col-md-6">
                                    <label>Segundo Apellido</label>
                                    <input type="text" name="bean.segundoApellido" id="segundoApellido"
                                           class="form-control" value=""/>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Fecha de Nacimiento</label>
                                    <input type="date" name="bean.fechaNacimiento" id="fechaNacimiento"
                                           class="form-control" value=""/>
                                </div>
                                <div class="col-md-6">
                                    <label>Sexo</label>
                                    <select name="bean.sexo" id="sexo" class="form-control">
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <label>RFC</label>
                                    <input type="text" name="bean.rfc" id="rfc"
                                           class="form-control" value=""/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <h5>Información de contacto</h5>
                            <hr/>
                            <label>Correo electrónico personal</label>
                            <input type="email" name="bean.correoPersonal" id="correoPersonal"
                                   class="form-control" value=""/>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Teléfono celular</label>
                                    <input type="number" name="bean.telefonoCelular" id="telefonoCelular"
                                           class="form-control" value=""/>
                                </div>
                                <div class="col-md-6">
                                    <label>Teléfono de casa</label>
                                    <input type="number" name="bean.telefonoCasa" id="telefonoCasa"
                                           class="form-control" value=""/>
                                </div>
                            </div>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="datos_escolares">
                            <hr/>
                            <label>Universidad de egreso</label>
                            <input type="text" name="bean.universidadEgreso" id="universisdadEgreso"
                                   class="form-control" value=""/>
                            <br/>
                            <label>Carrera de egreso</label>
                            <input type="text" name="bean.carreraEgreso" id="carreraEgreso"
                                   class="form-control" value=""/>
                            <br/>
                            <label>Matrícula</label>
                            <input type="text" name="bean.matricula" id="matricula" class="form-control" value=""/>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Cuatrimestre en el que ingresó</label>
                                    <input type="number" name="bean.cuatrimestreIngreso" id="cuatrimestreIngreso"
                                           class="form-control" value=""/>
                                </div>
                                <div class="col-md-6">
                                    <label>Cuatrimestre actual</label>
                                    <input type="number" name="bean.cuatrimestreActual" id="cuatrimestreActual"
                                           class="form-control" value=""/>
                                </div>
                            </div>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="datos_laborales">
                            <hr/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Correo electrónico institucional</label>
                                    <input type="email" name="bean.correoInstitucional" id="correoInstitucional"
                                           class="form-control" value=""/>
                                    <br/>
                                    <label>Contraseña</label>
                                    <input type="password" name="bean.contrasena" id="contrasena"
                                           class="form-control" value=""/>
                                    <br/>
                                    <label>Confirmar contraseña</label>
                                    <input type="password" name="bean.contrasena" id="contrasena2"
                                           class="form-control"
                                           onchange="verificarContraseña(this.value)" value=""/>
                                    <span id="leyenda" style="color: red"></span>
                                    <script>
                                        function verificarContraseña(valor) {
                                            var contrasena = document.getElementById("contrasena").value;
                                            var leyenda = document.getElementById("leyenda");
                                            if (valor != contrasena) {
                                                leyenda.innerHTML = "Las contraseñas deben de coincidir";
                                            } else {
                                                leyenda.innerHTML = "";
                                            }
                                        }
                                    </script>
                                    <br/>
                                    <label>Estado actual</label>
                                    <select name="bean.estatus" id="estatus" class="form-control">
                                        <option value="activo">activo</option>
                                        <option value="desactivo">desactivo</option>
                                    </select>
                                    <br/>
                                    <label>Horario de labores</label>
                                    <select name="bean.horarioLabores" id="horarioLabores" class="form-control">
                                        <option value="8:00AM a 2:00PM">8:00AM a 2:00PM</option>
                                        <option value="8:00AM a 4:00PM">8:00AM a 4:00PM</option>
                                        <option value="Horario Docente">Horario Docente</option>
                                    </select>
                                    <br/>
                                </div>
                                <div class="col-md-6">
                                    <label>Modalidad en la que ingresó</label>
                                    <select class="form-control" id="modalidadIngreso">
                                        <option value="Becario">Becario</option>
                                        <option value="Estadias">Estadias</option>
                                        <option value="Docente">Docente</option>
                                    </select>
                                    <br/>
                                    <label>Modalidad actual</label>
                                    <select class="form-control" id="modalidadActual">
                                        <option value="Becario">Becario</option>
                                        <option value="Estadias">Estadias</option>
                                        <option value="Docente">Docente</option>
                                    </select>
                                    <br/>
                                    <label>Fecha de ingreso</label>
                                    <input type="date" name="bean.fechaIngreso" id="fechaIngreso" value=""
                                           class="form-control"/>
                                    <br/>
                                    <label>Fecha de egreso</label>
                                    <input type="date" name="bean.fechaEgreso" id="" fechaEgreso value=""
                                           class="form-control"/>
                                    <br/>
                                    <label>Rol</label>
                                    <select name="bean.rol" id="rol" class="form-control">
                                        <option value="RAPE">RAPE</option>
                                        <option value="RD">RD</option>
                                        <option value="AP">AP</option>
                                    </select>
                                </div>
                            </div>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="tecnologias_aplicadas">
                            <hr/>
                            <label>Tecnologías aplicadas</label>
                            <textarea name="bean.tecnologiasAplicadas" id="tecnologiasAplicadas" value=""
                                      class="form-control"></textarea>
                            <hr/>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer" id="formulario">

            </div>
        </div>
    </div>
</div>
<!--End New user modal-->


<div class="modal fade" id="mensajeModal" tabindex="-1" role="dialog" aria-labelledby="mensajeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-sm-3" id="img-mensaje">

                    </div>
                    <div class="col-md-8">
                        <h2 id="mensajeAccion"></h2>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

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
    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";

    function limpiarFormulario() {
        document.getElementById("headerFormulario").innerHTML = "<h5 class=\"modal-title\" id=\"formularioModalLabel\">Registrar nuevo usuario. </i><span\n" +
            "                        class=\"sr-only\">(current)</span></h5>\n" +
            "                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
            "                    <span aria-hidden=\"true\">&times;</span>\n" +
            "                </button>";
        document.getElementById("formulario").innerHTML = "<button class=\"btn btn-success\" type=\"button\" id=\"botonAcción\" onclick=\"InsertarUsuarios()\">Guardar</button>";
    }

    function InsertarUsuarios() {
        var nombre = $("#nombre").val();
        var primerApellido = $("#primerApellido").val();
        var segundoApellido = $("#segundoApellido").val();
        var fechaNacimiento = $("#fechaNacimiento").val();
        var sexo = $("#sexo").val();
        var rfc = $("#rfc").val();
        var cuatrimestreIngreso = $("#cuatrimestreIngreso").val();
        var cuatrimestreActual = $("#cuatrimestreActual").val();
        var estatus = $("#estatus").val();
        var horarioLabores = $("#horarioLabores").val();
        var correoInstitucional = $("#correoInstitucional").val();
        var correoPersonal = $("#correoPersonal").val();
        var telefonoCelular = $("#telefonoCelular").val();
        var telefonoCasa = $("#telefonoCasa").val();
        var universidadEgreso = $("#universidadEgreso").val();
        var matricula = $("#matricula").val();
        var carreraEgreso = $("#carreraEgreso").val();
        var modalidadIngreso = $("#modalidadIngreso").val();
        var modalidadActual = $("#modalidadActual").val();
        var tecnologiasAplicadas = $("#tecnologiasAplicadas").val();
        var fechaIngreso = $("#fechaIngreso").val();
        var fechaEgreso = $("#fechaEgreso").val();
        var contrasena = $("#contrasena").val();
        var rol = $("#rol").val();

        $.ajax({
            type: "POST",
            url: raiz + "InsertarUsuarios",
            data: "bean.nombre=" + nombre +
                "&bean.primerApellido=" + primerApellido +
                "&bean.segundoApellido=" + segundoApellido +
                "&bean.fechaNacimiento=" + fechaNacimiento +
                "&bean.sexo=" + sexo +
                "&bean.rfc=" + rfc +
                "&bean.cuatrimestreIngreso=" + cuatrimestreIngreso +
                "&bean.cuatrimestreActual=" + cuatrimestreActual +
                "&bean.estatus=" + estatus +
                "&bean.horarioLabores=" + horarioLabores +
                "&bean.correoInstitucional=" + correoInstitucional +
                "&bean.correoPersonal=" + correoPersonal +
                "&bean.telefonoCelular=" + telefonoCelular +
                "&bean.telefonoCasa=" + telefonoCasa +
                "&bean.universidadEgreso=" + universidadEgreso +
                "&bean.matricula=" + matricula +
                "&bean.carreraEgreso=" + carreraEgreso +
                "&bean.modalidadIngreso=" + modalidadIngreso +
                "&bean.modalidadActual=" + modalidadActual +
                "&bean.tecnologiasAplicadas=" + tecnologiasAplicadas +
                "&bean.fechaIngreso=" + fechaIngreso +
                "&bean.fechaEgreso=" + fechaEgreso +
                "&bean.contrasena=" + contrasena +
                "&bean.rol=" + rol,

            success: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "El registro se a guardado exitosamente.";
                document.getElementById("img-mensaje").innerHTML = "<img width=\"100px\" src=\"<%=context%>/img/check.png\" />";
                $("#mensajeModal").modal("show");
                setTimeout(actualizarPagina, 2000);
            }, error: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "Hubo un error al guardar el registro, por favor intente de nuevo.";
                document.getElementById("img-mensaje").innerHTML = "<img width=\"100px\" src=\"<%=context%>/img/warning.png\" />";
                $("#mensajeModal").modal("show");
                setTimeout(actualizarPagina, 2000);
            }
        });
    }


    function obtenerDatosModificar(id) {
        var id = id;
        document.getElementById("headerFormulario").innerHTML = "<h5 class=\"modal-title\" id=\"formularioModalLabel\">Modificar Usuario </i><span\n" +
            "                        class=\"sr-only\">(current)</span></h5>\n" +
            "                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
            "                    <span aria-hidden=\"true\">&times;</span>\n" +
            "                </button>";

        $.ajax({
            type: "GET",
            url: "MostrarUsuarioId",
            data: "bean.id=" + id,
            success: function (result) {
                document.getElementById("formulario").innerHTML = "<button class=\"btn btn-success\" type=\"button\" id=\"botonAcción\" value=\"" + result.bean.id + "\" onclick=\"modificarUsuario(this.value)\">Guardar</button>";

                $("#formularioModal").modal("show");
                document.getElementById("bodyFormulario").innerHTML = "<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12\">\n" +
                    "                        <br/>\n" +
                    "\n" +
                    "                        <ul class=\"nav nav-tabs\">\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#datos_personales\" class=\"nav-link active\" role=\"tab\"\n" +
                    "                                   data-toggle=\"tab\">Información\n" +
                    "                                    personal</a>\n" +
                    "                            </li>\n" +
                    "\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#datos_escolares\" class=\"nav-link\" role=\"tab\" data-toggle=\"tab\">Información\n" +
                    "                                    escolar</a>\n" +
                    "                            </li>\n" +
                    "\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#datos_laborales\" class=\"nav-link\" role=\"tab\" data-toggle=\"tab\">Información\n" +
                    "                                    laboral</a>\n" +
                    "                            </li>\n" +
                    "\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#tecnologias_aplicadas\" class=\"nav-link\" role=\"tab\" data-toggle=\"tab\">Tecnologías\n" +
                    "                                    aplicadas</a>\n" +
                    "                            </li>\n" +
                    "                        </ul>\n" +
                    "\n" +
                    "                        <div class=\"tab-content\">\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane in active\" id=\"datos_personales\">\n" +
                    "                                <hr/>\n" +
                    "                                <label>Nombre(s)</label>\n" +
                    "                                <input type=\"text\" name=\"bean.nombre\" id=\"nombre\" class=\"form-control\" value=\"" + result.bean.nombre  + "\"/>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Primer Apellido</label>\n" +
                    "                                        <input type=\"text\" name=\"bean.primerApellido\" id=\"primerApellido\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.primerApellido  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Segundo Apellido</label>\n" +
                    "                                        <input type=\"text\" name=\"bean.segundoApellido\" id=\"segundoApellido\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.segundoApellido  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Fecha de Nacimiento</label>\n" +
                    "                                        <input type=\"date\" name=\"bean.fechaNacimiento\" id=\"fechaNacimiento\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.fechaNacimiento  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Sexo</label>\n" +
                    "                                        <select name=\"bean.sexo\" id=\"sexo\" class=\"form-control\">\n" +
                    "                                            <option value=\"Masculino\">Masculino</option>\n" +
                    "                                            <option value=\"Femenino\">Femenino</option>\n" +
                    "                                        </select>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <br/>\n"+
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>RFC</label>\n" +
                    "                                        <input type=\"text\" name=\"bean.rfc\" id=\"rfc\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.rfc  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <br/>\n" +
                    "                                <br/>\n" +
                    "                                <h5>Información de contacto</h5>\n" +
                    "                                <hr/>\n" +
                    "                                <label>Correo electrónico personal</label>\n" +
                    "                                <input type=\"email\" name=\"bean.correoPersonal\" id=\"correoPersonal\"\n" +
                    "                                       class=\"form-control\" value=\"" + result.bean.correoPersonal  + "\"/>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Teléfono celular</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.telefonoCelular\" id=\"telefonoCelular\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.telefonoCelular  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Teléfono de casa</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.telefonoCasa\" id=\"telefonoCasa\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.telefonoCasa  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"datos_escolares\">\n" +
                    "                                <hr/>\n" +
                    "                                <label>Universidad de egreso</label>\n" +
                    "                                <input type=\"text\" name=\"bean.universidadEgreso\" id=\"universisdadEgreso\"\n" +
                    "                                       class=\"form-control\" value=\"" + result.bean.universidadEgreso  + "\"/>\n" +
                    "                                <br/>\n" +
                    "                                <label>Carrera de egreso</label>\n" +
                    "                                <input type=\"text\" name=\"bean.carreraEgreso\" id=\"carreraEgreso\"\n" +
                    "                                       class=\"form-control\" value=\"" + result.bean.carreraEgreso  + "\"/>\n" +
                    "                                <br/>\n" +
                    "                                <label>Matrícula</label>\n" +
                    "                                <input type=\"text\" name=\"bean.matricula\" id=\"matricula\" class=\"form-control\" value=\"" + result.bean.matricula  + "\"/>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Cuatrimestre en el que ingresó</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.cuatrimestreIngreso\" id=\"cuatrimestreIngreso\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.cuatrimestreIngreso  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Cuatrimestre actual</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.cuatrimestreActual\" id=\"cuatrimestreActual\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.cuatrimestreActual  + "\"/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"datos_laborales\">\n" +
                    "                                <hr/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Correo electrónico institucional</label>\n" +
                    "                                        <input type=\"email\" name=\"bean.correoInstitucional\" id=\"correoInstitucional\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.correoInstitucional  + "\"/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Contraseña</label>\n" +
                    "                                        <input type=\"password\" name=\"bean.contrasena\" id=\"contrasena\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.contrasena  + "\"/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Confirmar contraseña</label>\n" +
                    "                                        <input type=\"password\" name=\"bean.contrasena\" id=\"contrasena2\"\n" +
                    "                                               class=\"form-control\"/>\n" +
                    "                                        <span id=\"leyenda\" style=\"color: red\"></span>\n" +
                    "\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Estado actual</label>\n" +
                    "                                        <select name=\"bean.estatus\" id=\"estatus\" class=\"form-control\">\n" +
                    "                                            <option value=\"activo\">activo</option>\n" +
                    "                                            <option value=\"desactivo\">desactivo</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Horario de labores</label>\n" +
                    "                                        <select name=\"bean.horarioLabores\" id=\"horarioLabores\" class=\"form-control\">\n" +
                    "                                            <option value=\"8:00AM a 2:00PM\">8:00AM a 2:00PM</option>\n" +
                    "                                            <option value=\"8:00AM a 4:00PM\">8:00AM a 4:00PM</option>\n" +
                    "                                            <option value=\"Horario Docente\">Horario Docente</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Modalidad en la que ingresó</label>\n" +
                    "                                        <select class=\"form-control\" id=\"modalidadIngreso\">\n" +
                    "                                            <option value=\"Becario\">Becario</option>\n" +
                    "                                            <option value=\"Estadias\">Estadias</option>\n" +
                    "                                            <option value=\"Docente\">Docente</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Modalidad actual</label>\n" +
                    "                                        <select class=\"form-control\" id=\"modalidadActual\">\n" +
                    "                                            <option value=\"Becario\">Becario</option>\n" +
                    "                                            <option value=\"Estadias\">Estadias</option>\n" +
                    "                                            <option value=\"Docente\">Docente</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Fecha de ingreso</label>\n" +
                    "                                        <input type=\"date\" name=\"bean.fechaIngreso\" id=\"fechaIngreso\" value=\"" + result.bean.fechaIngreso  + "\"\n" +
                    "                                               class=\"form-control\"/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Fecha de egreso</label>\n" +
                    "                                        <input type=\"date\" name=\"bean.fechaEgreso\" id=\"\" fechaEgreso value=\"" + result.bean.fechaEgreso  + "\"\n" +
                    "                                               class=\"form-control\"/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Rol</label>\n" +
                    "                                        <select name=\"bean.rol\" id=\"rol\" class=\"form-control\">\n" +
                    "                                            <option value=\"RAPE\">RAPE</option>\n" +
                    "                                            <option value=\"RD\">RD</option>\n" +
                    "                                            <option value=\"AP\">AP</option>\n" +
                    "                                        </select>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"tecnologias_aplicadas\">\n" +
                    "                                <hr/>\n" +
                    "                                <label>Tecnologías aplicadas</label>\n" +
                    "                                <textarea name=\"bean.tecnologiasAplicadas\" id=\"tecnologiasAplicadas\" value=\"\"\n" +
                    "                                          class=\"form-control\">" + result.bean.tecnologiasAplicadas  + "</textarea>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                        </div>\n" +
                    "                    </div>";

            },
            error: function (result) {
                alert("Some error occured.");
            }
        });
    }

    function obtenerDatosMostrar(id) {
        var id = id;
        document.getElementById("headerFormulario").innerHTML = "<h5 class=\"modal-title\" id=\"formularioModalLabel\">Detalles del usuario</i><span\n" +
            "                        class=\"sr-only\">(current)</span></h5>\n" +
            "                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
            "                    <span aria-hidden=\"true\">&times;</span>\n" +
            "                </button>";

        $.ajax({
            type: "GET",
            url: "MostrarUsuarioId",
            data: "bean.id=" + id,
            success: function (result) {
                document.getElementById("bodyFormulario").innerHTML = "<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12\">\n" +
                    "                        <br/>\n" +
                    "\n" +
                    "                        <ul class=\"nav nav-tabs\">\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#datos_personales\" class=\"nav-link active\" role=\"tab\"\n" +
                    "                                   data-toggle=\"tab\">Información\n" +
                    "                                    personal</a>\n" +
                    "                            </li>\n" +
                    "\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#datos_escolares\" class=\"nav-link\" role=\"tab\" data-toggle=\"tab\">Información\n" +
                    "                                    escolar</a>\n" +
                    "                            </li>\n" +
                    "\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#datos_laborales\" class=\"nav-link\" role=\"tab\" data-toggle=\"tab\">Información\n" +
                    "                                    laboral</a>\n" +
                    "                            </li>\n" +
                    "\n" +
                    "                            <li class=\"nav-item\">\n" +
                    "                                <a href=\"#tecnologias_aplicadas\" class=\"nav-link\" role=\"tab\" data-toggle=\"tab\">Tecnologías\n" +
                    "                                    aplicadas</a>\n" +
                    "                            </li>\n" +
                    "                        </ul>\n" +
                    "\n" +
                    "                        <div class=\"tab-content\">\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane in active\" id=\"datos_personales\">\n" +
                    "                                <hr/>\n" +
                    "                                <label>Nombre(s)</label>\n" +
                    "                                <input type=\"text\" name=\"bean.nombre\" id=\"nombre\" class=\"form-control\" value=\"" + result.bean.nombre  + "\" readonly/>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Primer Apellido</label>\n" +
                    "                                        <input type=\"text\" name=\"bean.primerApellido\" id=\"primerApellido\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.primerApellido  + "\" readonly/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Segundo Apellido</label>\n" +
                    "                                        <input type=\"text\" name=\"bean.segundoApellido\" id=\"segundoApellido\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.segundoApellido  + "\" readonly/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Fecha de Nacimiento</label>\n" +
                    "                                        <input type=\"date\" name=\"bean.fechaNacimiento\" id=\"fechaNacimiento\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.fechaNacimiento  + "\" readonly />\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Sexo</label>\n" +
                    "                                        <select name=\"bean.sexo\" id=\"sexo\" class=\"form-control\" readonly >\n" +
                    "                                            <option value=\"Masculino\">Masculino</option>\n" +
                    "                                            <option value=\"Femenino\">Femenino</option>\n" +
                    "                                        </select>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <br/>\n"+
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>RFC</label>\n" +
                    "                                        <input type=\"text\" name=\"bean.rfc\" id=\"rfc\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.rfc  + "\" readonly />\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <br/>\n" +
                    "                                <br/>\n" +
                    "                                <h5>Información de contacto</h5>\n" +
                    "                                <hr/>\n" +
                    "                                <label>Correo electrónico personal</label>\n" +
                    "                                <input type=\"email\" name=\"bean.correoPersonal\" id=\"correoPersonal\"\n" +
                    "                                       class=\"form-control\" value=\"" + result.bean.correoPersonal  + "\" readonly/>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Teléfono celular</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.telefonoCelular\" id=\"telefonoCelular\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.telefonoCelular  + "\" readonly/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Teléfono de casa</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.telefonoCasa\" id=\"telefonoCasa\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.telefonoCasa  + "\" readonly/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"datos_escolares\">\n" +
                    "                                <hr/>\n" +
                    "                                <label>Universidad de egreso</label>\n" +
                    "                                <input type=\"text\" name=\"bean.universidadEgreso\" id=\"universisdadEgreso\"\n" +
                    "                                       class=\"form-control\" value=\"" + result.bean.universidadEgreso  + "\" readonly/>\n" +
                    "                                <br/>\n" +
                    "                                <label>Carrera de egreso</label>\n" +
                    "                                <input type=\"text\" name=\"bean.carreraEgreso\" id=\"carreraEgreso\"\n" +
                    "                                       class=\"form-control\" value=\"" + result.bean.carreraEgreso  + "\" readonly/>\n" +
                    "                                <br/>\n" +
                    "                                <label>Matrícula</label>\n" +
                    "                                <input type=\"text\" name=\"bean.matricula\" id=\"matricula\" class=\"form-control\" value=\"" + result.bean.matricula  + "\" readonly/>\n" +
                    "                                <br/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Cuatrimestre en el que ingresó</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.cuatrimestreIngreso\" id=\"cuatrimestreIngreso\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.cuatrimestreIngreso  + "\" readonly/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Cuatrimestre actual</label>\n" +
                    "                                        <input type=\"number\" name=\"bean.cuatrimestreActual\" id=\"cuatrimestreActual\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.cuatrimestreActual  + "\" readonly/>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"datos_laborales\">\n" +
                    "                                <hr/>\n" +
                    "                                <div class=\"row\">\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Correo electrónico institucional</label>\n" +
                    "                                        <input type=\"email\" name=\"bean.correoInstitucional\" id=\"correoInstitucional\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.correoInstitucional  + "\" readonly/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Contraseña</label>\n" +
                    "                                        <input type=\"password\" name=\"bean.contrasena\" id=\"contrasena\"\n" +
                    "                                               class=\"form-control\" value=\"" + result.bean.contrasena  + "\" readonly/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Confirmar contraseña</label>\n" +
                    "                                        <input type=\"password\" name=\"bean.contrasena\" id=\"contrasena2\"\n" +
                    "                                               class=\"form-control\" readonly/>\n" +
                    "                                        <span id=\"leyenda\" style=\"color: red\"></span>\n" +
                    "\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Estado actual</label>\n" +
                    "                                        <select name=\"bean.estatus\" id=\"estatus\" class=\"form-control\">\n" +
                    "                                            <option value=\"activo\">activo</option>\n" +
                    "                                            <option value=\"desactivo\">desactivo</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Horario de labores</label>\n" +
                    "                                        <select name=\"bean.horarioLabores\" id=\"horarioLabores\" class=\"form-control\">\n" +
                    "                                            <option value=\"8:00AM a 2:00PM\">8:00AM a 2:00PM</option>\n" +
                    "                                            <option value=\"8:00AM a 4:00PM\">8:00AM a 4:00PM</option>\n" +
                    "                                            <option value=\"Horario Docente\">Horario Docente</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-md-6\">\n" +
                    "                                        <label>Modalidad en la que ingresó</label>\n" +
                    "                                        <select class=\"form-control\" id=\"modalidadIngreso\">\n" +
                    "                                            <option value=\"Becario\">Becario</option>\n" +
                    "                                            <option value=\"Estadias\">Estadias</option>\n" +
                    "                                            <option value=\"Docente\">Docente</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Modalidad actual</label>\n" +
                    "                                        <select class=\"form-control\" id=\"modalidadActual\">\n" +
                    "                                            <option value=\"Becario\">Becario</option>\n" +
                    "                                            <option value=\"Estadias\">Estadias</option>\n" +
                    "                                            <option value=\"Docente\">Docente</option>\n" +
                    "                                        </select>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Fecha de ingreso</label>\n" +
                    "                                        <input type=\"date\" name=\"bean.fechaIngreso\" id=\"fechaIngreso\" value=\"" + result.bean.fechaIngreso  + "\"\n" +
                    "                                               class=\"form-control\" readonly/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Fecha de egreso</label>\n" +
                    "                                        <input type=\"date\" name=\"bean.fechaEgreso\" id=\"\" fechaEgreso value=\"" + result.bean.fechaEgreso  + "\"\n" +
                    "                                               class=\"form-control\" readonly/>\n" +
                    "                                        <br/>\n" +
                    "                                        <label>Rol</label>\n" +
                    "                                        <select name=\"bean.rol\" id=\"rol\" class=\"form-control\">\n" +
                    "                                            <option value=\"RAPE\">RAPE</option>\n" +
                    "                                            <option value=\"RD\">RD</option>\n" +
                    "                                            <option value=\"AP\">AP</option>\n" +
                    "                                        </select>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                            <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"tecnologias_aplicadas\">\n" +
                    "                                <hr/>\n" +
                    "                                <label>Tecnologías aplicadas</label>\n" +
                    "                                <textarea name=\"bean.tecnologiasAplicadas\" id=\"tecnologiasAplicadas\" value=\"\"\n" +
                    "                                          class=\"form-control\" readonly>" + result.bean.tecnologiasAplicadas  + "</textarea>\n" +
                    "                                <hr/>\n" +
                    "                            </div>\n" +
                    "\n" +
                    "                        </div>\n" +
                    "                    </div>";
                document.getElementById("formulario").innerHTML = "";
                $("#formularioModal").modal("show");
            },
            error: function (result) {
                alert("Some error occured.");
            }
        });
    }

    function modificarUsuario(id){

        var id = id;
        var nombre = $("#nombre").val();
        var primerApellido = $("#primerApellido").val();
        var segundoApellido = $("#segundoApellido").val();
        var fechaNacimiento = $("#fechaNacimiento").val();
        var sexo = $("#sexo").val();
        var rfc = $("#rfc").val();
        var cuatrimestreIngreso = $("#cuatrimestreIngreso").val();
        var cuatrimestreActual = $("#cuatrimestreActual").val();
        var estatus = $("#estatus").val();
        var horarioLabores = $("#horarioLabores").val();
        var correoInstitucional = $("#correoInstitucional").val();
        var correoPersonal = $("#correoPersonal").val();
        var telefonoCelular = $("#telefonoCelular").val();
        var telefonoCasa = $("#telefonoCasa").val();
        var universidadEgreso = $("#universidadEgreso").val();
        var matricula = $("#matricula").val();
        var carreraEgreso = $("#carreraEgreso").val();
        var modalidadIngreso = $("#modalidadIngreso").val();
        var modalidadActual = $("#modalidadActual").val();
        var tecnologiasAplicadas = $("#tecnologiasAplicadas").val();
        var fechaIngreso = $("#fechaIngreso").val();
        var fechaEgreso = $("#fechaEgreso").val();
        var contrasena = $("#contrasena").val();
        if(contrasena == ""){
            var contrasena = $("#contrasenaActual").val();
        }
        var rol = $("#rol").val();

        $.ajax({
            type: "POST",
            url: raiz +  "ModificarUsuarioJson",
            data: "bean.id=" + id +
                "&bean.nombre=" + nombre +
                "&bean.primerApellido=" + primerApellido +
                "&bean.segundoApellido=" + segundoApellido +
                "&bean.fechaNacimiento=" + fechaNacimiento +
                "&bean.sexo=" + sexo +
                "&bean.rfc=" + rfc +
                "&bean.cuatrimestreIngreso=" + cuatrimestreIngreso +
                "&bean.cuatrimestreActual=" + cuatrimestreActual +
                "&bean.estatus=" + estatus +
                "&bean.horarioLabores=" + horarioLabores +
                "&bean.correoInstitucional=" + correoInstitucional +
                "&bean.correoPersonal=" + correoPersonal +
                "&bean.telefonoCelular=" + telefonoCelular +
                "&bean.telefonoCasa=" + telefonoCasa +
                "&bean.universidadEgreso=" + universidadEgreso +
                "&bean.matricula=" + matricula +
                "&bean.carreraEgreso=" + carreraEgreso +
                "&bean.modalidadIngreso=" + modalidadIngreso +
                "&bean.modalidadActual=" + modalidadActual +
                "&bean.tecnologiasAplicadas=" + tecnologiasAplicadas +
                "&bean.fechaIngreso=" + fechaIngreso +
                "&bean.fechaEgreso=" + fechaEgreso +
                "&bean.contrasena=" + contrasena +
                "&bean.rol=" + rol,

            success: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "Se modificó correctamente.";
                document.getElementById("img-mensaje").innerHTML = "<img width=\"100px\" src=\"<%=context%>/img/check.png\" />";
                $("#mensajeModal").modal("show");
                setTimeout(actualizarPagina, 2000);
            }, error: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "No se pudo modificar, intente nuevamente.";
                document.getElementById("img-mensaje").innerHTML = "<img width=\"100px\" src=\"<%=context%>/img/warning.png\" />";
                $("#mensajeModal").modal("show");
                setTimeout(actualizarPagina, 2000);
            }
        });
    }

    function actualizarPagina() {
        location.reload();
    }
</script>
</body>
</html>
