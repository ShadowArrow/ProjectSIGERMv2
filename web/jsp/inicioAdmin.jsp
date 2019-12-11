<%--
  Created by IntelliJ IDEA.
  User: yoshi
  Date: 08/11/2019
  Time: 01:25 a. m.
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
    <title>Mi perfil</title>
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
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }

        .fb-profile img.fb-image-lg {
            z-index: 0;
            width: 100%;
            margin-bottom: 10px;
        }

        .fb-image-profile {
            margin: -90px 0px 0px 43%;
            z-index: 9;
            width: 15%;
        }

        @media (max-width: 768px) {

            .fb-profile-text > h1 {
                font-size: 14px;
            }

            .fb-image-profile {
                margin: -45px 10px 0px 25px;
                z-index: 9;
                width: 15%;
            }
        }
    </style>

</head>
<body>
<!--wrapper-->
<div id="wrapper">
    <!-- navbar top -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
        <!-- navbar-header -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
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
    <!--  page-wrapper -->
    <div id="page-wrapper">
        <div class="row">
            <!-- Page Header -->
            <div class="col-md-12">
                <h1 class="page-header"><i class="fa fa-user" aria-hidden="true"></i> Mi perfil</h1>
            </div>
            <!--End Page Header -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <!--Basic Tabs-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <div class="row" style="padding: 30px;">
                            <div class="col-md-12">
                                <div class="fb-profile">
                                    <img align="center" class="fb-image-lg" src="<%=context%>/img/portadaCds.png"
                                         alt="Imagen de portada" style="border: 2px solid #CDD8DA;"/>
                                    <!--Aquí hay que validar el sexo del usuario para mostrar la imagen correspondiente-->
                                    <img align="center" class="fb-image-profile" src="<%=context%>/img/man.png"
                                         alt="Imagen de perfil"/>
                                </div>
                            </div>
                        </div>
                        <!--Sections-->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#informacionPersonal" data-toggle="tab">Información personal</a>
                            </li>
                            <li>
                                <a href="#informacionAcademica" data-toggle="tab">Información académica</a>
                            </li>
                            <li>
                                <a href="#tecnologias" data-toggle="tab">Tecnologías aplicadas</a>
                            </li>
                            <li>
                                <a href="#cambiarContraseña" data-toggle="tab">Cambiar contraseña</a>
                            </li>
                        </ul>
                        <!--End Sections-->
                        <!--Panels-->
                        <div class="tab-content" style="padding: 20px;">
                            <!--Información personal-->
                            <div class="tab-pane fade in active " id="informacionPersonal">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="hidden" value="<s:property value="#session.usuario.id"/>" id="id">
                                        <input type="hidden" value="<s:property value="#session.usuario.correoInstitucional" />" id="correoActual">
                                        <input type="hidden" value="<s:property value="#session.usuario.contrasena" />" id="contrasenaActual">
                                        <label>Nombre(s)*</label>
                                        <input type="text" class="form-control" maxlength="50" required
                                               value="<s:property value="#session.usuario.nombre"/>" id="nombre"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Primer apellido*</label>
                                        <input type="text" class="form-control" maxlength="50" required
                                               value="<s:property value="#session.usuario.primerApellido"/>" id="primerApellido"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Segundo apellido*</label>
                                        <input type="text" class="form-control" maxlength="50" required
                                               value="<s:property value="#session.usuario.segundoApellido"/>" id="segundoApellido"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4">
                                        <label>Fecha de nacimiento*</label>
                                        <input type="date" class="form-control" maxlength="50" required
                                               value="<s:property value="#session.usuario.fechaNacimiento"/>" id="fechaNacimiento"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Sexo*</label>
                                        <select class="form-control" id="sexo" headerKey="-1" headerValue="Seleccione el sexo">
                                            <option value="Masculino">Masculino</option>
                                            <option value="Femenino">Femenino</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>RFC*</label>
                                        <input type="text" class="form-control" maxlength="10" id="rfc"
                                               value="<s:property value="#session.usuario.rfc"/>"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4">
                                        <label>Correo electrónico personal*</label>
                                        <input type="email" class="form-control" maxlength="50" required id="correoPersonal"
                                               value="<s:property value="#session.usuario.correoPersonal"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Teléfono celular</label>
                                        <input type="number" class="form-control" maxlength="50" id="telefonoCelular"
                                               value="<s:property value="#session.usuario.telefonoCelular"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Teléfono de casa</label>
                                        <input type="number" class="form-control" maxlength="50" id="telefonoCasa"
                                               value="<s:property value="#session.usuario.telefonoCasa"/>"/>
                                    </div>
                                </div>

                            </div>
                            <!--End Información personal-->
                            <!--Información académica-->
                            <div class="tab-pane fade" id="informacionAcademica">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Universidad de egreso*</label>
                                        <input type="text" class="form-control" maxlength="50" required id="universidadEgreso"
                                               value="<s:property value="#session.usuario.universidadEgreso"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Carrera de egreso*</label>
                                        <input type="text" class="form-control" maxlength="50" required id="carreraEgreso"
                                               value="<s:property value="#session.usuario.carreraEgreso"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Matrícula</label>
                                        <input type="text" class="form-control" maxlength="50" id="matricula"
                                               value="<s:property value="#session.usuario.matricula"/>"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4">
                                        <label>Correo electrónico institucional*</label>
                                        <input type="email" class="form-control" maxlength="50" required id="correoInstitucional"
                                               value="<s:property value="#session.usuario.correoInstitucional"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Cuatrimestre ingreso</label>
                                        <input type="number" class="form-control" maxlength="50" id="cuatrimestreIngreso"
                                               value="<s:property value="#session.usuario.cuatrimestreIngreso"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Cuatrimestre actual</label>
                                        <input type="number" class="form-control" maxlength="50" id="cuatrimestreActual"
                                               value="<s:property value="#session.usuario.cuatrimestreActual"/>"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4">
                                        <label>Modalidad ingreso*</label>
                                        <select class="form-control" id="modalidadIngreso" headerKey="-1" headerValue="Seleccione modalidad">
                                            <option value="Becario">Becario</option>
                                            <option value="Estadías">Estadías</option>
                                            <option value="Docente">Docente</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Modalidad actual*</label>
                                        <select class="form-control" id="modalidadActual" headerKey="-1" headerValue="Seleccione modalidad">
                                            <option value="Becario">Becario</option>
                                            <option value="Estadías">Estadías</option>
                                            <option value="Docente">Docente</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Fecha ingreso*</label>
                                        <input type="date" class="form-control" maxlength="50" required id="fechaIngreso"
                                               value="<s:property value="#session.usuario.fechaIngreso"/>"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4">
                                        <label>Fecha egreso</label>
                                        <input type="date" class="form-control" maxlength="50" id="fechaEgreso"
                                               value="<s:property value="#session.usuario.fexchaEgreso"/>"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Horario de labores</label>
                                        <select headerKey="-1" headerValue="Seleccione horario" id="horarioLabores" class="form-control">
                                            <option value="08:00 a.m. a 02:00 p.m.">08:00 a.m. a 02:00 p.m.</option>
                                            <option value="08:00 a.m. a 04:00 p.m.">08:00 a.m. a 04:00 p.m.</option>
                                            <option value="Horario docente">Horario docente</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Rol</label>
                                        <input type="text" class="form-control" maxlength="50" readonly id="rol"
                                               value="<s:property value="#session.usuario.rol"/>"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4">
                                        <label>Estatus</label>
                                        <input type="text" class="form-control" maxlength="50" readonly id="estatus"
                                               value="<s:property value="#session.usuario.estatus"/>"/>
                                    </div>
                                </div>
                            </div>
                            <!--End Información académica-->
                            <!--Tecnologías aplicadas-->
                            <div class="tab-pane fade" id="tecnologias">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Tecnologías aplicadas*</label>
                                        <textarea class="form-control" maxlength="100"
                                                  style="max-width: 100%; min-width: 100%; max-height: 40%; min-height: 10%;"
                                                  required
                                        id="tecnologiasAplicadas"><s:property
                                                value="#session.usuario.tecnologiasAplicadas"/></textarea>
                                    </div>
                                </div>
                            </div>
                            <!--End Tecnologías aplicadas-->
                            <!--Cambiar contraseña-->
                            <div class="tab-pane fade" id="cambiarContraseña">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Contraseña actual</label>
                                        <input type="password" value="" class="form-control" maxlength="50" required onchange="validarContrasena(this.value)"/>
                                    </div>
                                    <div class="col-md-4" id="campoContrasena1">

                                    </div>
                                    <div class="col-md-4" id="campoContrasena2">

                                    </div>
                                </div>
                            </div>
                            <!--Cambiar contraseña-->

                            <hr />
                            <div class="row" style="margin-top: 15px;">
                                <div class="col-md-12 text-right">
                                    <button type="button" class="btn btn-success" onclick="modificarUsuario() ">Guardar Cambios</button>
                                </div>
                            </div>
                        </div>
                        <!--End Panels-->
                    </div>
                </div>
                <!--End Basic Tabs-->
            </div>
        </div>
        <!-- end page-wrapper -->
    </div>
</div>
<!-- end wrapper -->

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

<script src="<%=context%>/js/jquery-3.4.1.min.js"></script>
<script src="<%=context%>/plugins/jquery-1.10.2.js"></script>
<script src="<%=context%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=context%>/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=context%>/plugins/pace/pace.js"></script>
<script src="<%=context%>/js/contenido/siminta.js"></script>

<script>
    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";

    function validarContrasena(contrasenaConf){
        var correoInstitucional = $("#correoInstitucional").val();
        var contrasena = contrasenaConf;

        $.ajax({
            type: "POST",
            url: raiz +  "ConfirmarUsuario",
            data: "bean.correoInstitucional=" + correoInstitucional + "&bean.contrasena=" + contrasena,
            success: function (data) {
                document.getElementById("campoContrasena1").innerHTML = "<label>Nueva contraseña</label>\n <input type=\"password\" class=\"form-control\" maxlength=\"50\" required id=\"contrasena\"/>";
                document.getElementById("campoContrasena2").innerHTML = "<label>Confirmar contraseña</label>\n <input type=\"password\" class=\"form-control\" maxlength=\"50\" required id=\"conf\"/>";
            }, error: function (data) {
                document.getElementById("campoContrasena1").innerHTML = "";
                document.getElementById("campoContrasena2").innerHTML = "";
            }
        });
    }

    function modificarUsuario(){

        var id= $("#id").val();
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
            }, error: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "No se pudo modificar intente nuevamente.";
                document.getElementById("img-mensaje").innerHTML = "<img width=\"100px\" src=\"<%=context%>/img/warning.png\" />";
                $("#mensajeModal").modal("show");
            }
        });
    }

</script>

</body>
</html>
