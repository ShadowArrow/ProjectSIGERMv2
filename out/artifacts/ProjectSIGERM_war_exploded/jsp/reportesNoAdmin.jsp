<%--
  Created by IntelliJ IDEA.
  User: susi_
  Date: 01/12/2019
  Time: 06:12 p. m.
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
    <title>Mis reportes</title>
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
                    <a href="<%=context%>/jsp/inicioNoAdmin.jsp">
                        <i class="fa fa-user fa-fw" aria-hidden="true"></i> Mi perfil
                    </a>
                </li>
                <li class="">
                    <a href="#">
                        <i class="fa fa-file-text fa-fw" aria-hidden="true"></i> Reportes
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
            <div class="row">
                <div class="col-md-12">
                    <h2 class="page-header"><i class="fa fa-file-text fa-fw"></i>Mis reportes</h2>
                </div>
            </div>
            <!--End Page Header -->
            <br/><br/>
            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-3" style="max-width: 540px; background-color: white; padding: 20px;">
                        <div class="row no-gutters">
                            <div class="col-md-4 text-center" style="padding-top: 30px;">
                                <img src="<%=context%>/img/pdf.png" class="card-img" height="15%">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h3>Responsable</h3>
                                    <p class="text-justify">Esta consulta le permite observar mediante un documento PDF el
                                        reporte
                                        de todos los bienes de los cuales usted es responsable.</p>
                                    <br/>
                                    <div class="text-right">
                                        <form action="reporteResponsables" method="POST" target="_blank" >
                                            <input name="idUsuario" hidden="" type="text"  value="<s:property value="#session.usuario.id" />">

                                            <button class="btn btn-info" type="submit" >Consultar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--<div class="col-md-4">
                    <div class="card mb-3" style="max-width: 540px; background-color: white; padding: 20px">
                        <div class="row no-gutters">
                            <div class="col-md-4" style="padding-top: 30px;">
                                <img src="<%=context%>/img/pdf.png" class="card-img" height="15%">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h3>Asignados</h3>
                                    <p class="text-justify">Esta consulta le permite observar mediante un documento PDF el
                                        reporte
                                        de todos los bienes que usted tiene asignados.</p>
                                    <br/>
                                    <div class="text-right">
                                        <button class="btn btn-info">Consultar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
    <!-- end page-wrapper -->
</div>
</div>
<!-- end wrapper -->

<!-- Core Scripts - Include with every page -->
<script src="<%=context%>/plugins/jquery-1.10.2.js"></script>
<script src="<%=context%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=context%>/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=context%>/plugins/pace/pace.js"></script>
<script src="<%=context%>/js/contenido/siminta.js"></script>
</body>
</html>

