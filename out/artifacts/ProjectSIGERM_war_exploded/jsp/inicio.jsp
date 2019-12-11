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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="stylesheet" href="<%=context%>/fontawesome/css/all.css">
    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.min.js"></script>
    <title>SIGERM</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <a class="navbar-brand" href="#">SIGERM</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">Perfil de usuario <i class="fas fa-user"></i></i><span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=context%>/MostrarUsuarios">Gestión de usuarios <i
                        class="fas fa-user-friends"></i><span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=context%>/MostrarBienes">Gestión de bienes <i
                        class="fas fa-user-friends"></i><span
                        class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a data-toggle="modal" class="nav-link" data-target="#exampleModal">
                    Cerrar Sesión <i class="fas fa-power-off"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>

<!-- Modal cerrar sesión  -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro que deseas cerrar sesión? <i
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
</div>

<br/>

<div class="container">
    <div class="row">
        <!-- tails de información de perfil -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
            <br/>

            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="#datos_personales" class="nav-link active" role="tab" data-toggle="tab">Información
                        personal</a>
                </li>

                <li class="nav-item">
                    <a href="#datos_escolares" class="nav-link" role="tab" data-toggle="tab">Información escolar</a>
                </li>

                <li class="nav-item">
                    <a href="#datos_laborales" class="nav-link" role="tab" data-toggle="tab">Información laboral</a>
                </li>

                <li class="nav-item">
                    <a href="#tecnologias_aplicadas" class="nav-link" role="tab" data-toggle="tab">Tecnologías
                        aplicadas</a>
                </li>
            </ul>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane in active" id="datos_personales">
                    <hr/>
                    <div class="row">
                        <div class="col-md-4">
                            <h5>Nombre(s):</h5>
                            <p><s:property value="#session.usuario.nombre"/></p>
                            <br/>
                            <h5>Primer apellido:</h5>
                            <p><s:property value="#session.usuario.primerApellido"/></p>
                            <br/>
                            <h5>Segundo Apellido:</h5>
                            <p><s:property value="#session.usuario.segundoApellido"/></p>
                            <br/>
                            <h5>Fecha de nacimiento:</h5>
                            <p><s:property value="#session.usuario.fechaNacimiento"/></p>
                        </div>
                        <div class="col-md-4">
                            <h5>Correo electrónico personal:</h5>
                            <p><s:property value="#session.usuario.correoPersonal"/></p>
                            <br/>
                            <h5>Teléfono celular:</h5>
                            <p><s:property value="#session.usuario.telefonoCelular"/></p>
                            <br/>
                            <h5>Teléfono de casa:</h5>
                            <p><s:property value="#session.usuario.telefonoCasa"/></p>
                        </div>
                    </div>
                    <hr/>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="datos_escolares">
                    <hr/>
                    <h5>Universidad de egreso:</h5>
                    <p><s:property value="#session.usuario.universidadEgreso"/></p>
                    <br/>
                    <h5>Carrera de egreso:</h5>
                    <p><s:property value="#session.usuario.carreraEgreso"/></p>
                    <br/>
                    <h5>Cuatrimestre en el que ingresó:</h5>
                    <p><s:property value="#session.usuario.cuatrimestreIngreso"/></p>
                    <br/>
                    <h5>Cuatrimestre actual:</h5>
                    <p><s:property value="#session.usuario.cuatrimestreActual"/></p>
                    <br/>
                    <h5>Correo institucional:</h5>
                    <p><s:property value="#session.usuario.correoInstitucional"/></p>
                    <hr/>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="datos_laborales">
                    <hr/>
                    <h5>Modalidad que ingresó:</h5>
                    <p><s:property value="#session.usuario.modalidadIngreso"/></p>
                    <br/>
                    <h5>Modalidad actual:</h5>
                    <p><s:property value="#session.usuario.modalidadActual"/></p>
                    <br/>
                    <h5>Fecha en la que ingresó:</h5>
                    <p><s:property value="#session.usuario.fechaIngreso"/></p>
                    <br/>
                    <h5>Fecha en la que egresó:</h5>
                    <p><s:property value="#session.usuario.fechaEgreso"/></p>
                    <br/>
                    <h5>Rol asignado:</h5>
                    <p><s:property value="#session.usuario.rol"/></p>
                    <hr/>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="tecnologias_aplicadas">
                    <hr/>
                    <h5>Tecnologías aplicadas:</h5>
                    <p><s:property value="#session.usuario.tecnologiasAplicadas"/></p>
                    <hr/>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
