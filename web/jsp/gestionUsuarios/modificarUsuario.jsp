<%--
  Created by IntelliJ IDEA.
  User: yoshi
  Date: 14/11/2019
  Time: 02:40 p. m.
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
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="stylesheet" href="<%=context%>/fontawesome/css/all.css">
    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.min.js"></script>
    <title>SIGERM GESTION DE USUARIOS</title>
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
                <a class="nav-link" href="<%=context%>/inicio">Perfil de usuario <i class="fas fa-user"></i></i>
                    <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=context%>/MostrarUsuarios">Gestión de usuarios <i class="fas fa-user-friends"></i><span
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
                <a data-toggle="modal" class="nav-link" data-target="#modalCerrarSesion">
                    Cerrar Sesión <i class="fas fa-power-off"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>
<hr />
<br />

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


<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">

        </div>
        <div class="col-md-10">
            <h1>Modificar usuario: <s:property value="bean.nombre"/> <s:property value="bean.primerApellido"/> <s:property value="bean.segundoApellido"/></h1>
            <form method="post" action="ModificarUsuario">
                <input type="hidden" id="id" name="bean.id" value="<s:property value="bean.id" />"/>
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
                            <hr />
                            <label>Nombre(s)</label>
                            <input type="text" name="bean.nombre" id="nombre" class="form-control" value="<s:property value="bean.nombre" />"/>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Primer Apellido</label>
                                    <input type="text" name="bean.primerApellido" id="primerApellido"
                                           class="form-control" value="<s:property value="bean.primerApellido" />"/>
                                </div>
                                <div class="col-md-6">
                                    <label>Segundo Apellido</label>
                                    <input type="text" name="bean.segundoApellido" id="segundoApellido"
                                           class="form-control" value="<s:property value="bean.segundoApellido" />"/>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Fecha de Nacimiento</label>
                                    <input type="date" name="bean.fechaNacimiento" id="fechaNacimiento"
                                           class="form-control" value="<s:property value="bean.fechaNacimiento" />"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <h5>Información de contacto</h5>
                            <hr/>
                            <label>Correo electrónico personal</label>
                            <input type="email" name="bean.correoPersonal" id="correoPersonal"
                                   class="form-control" value="<s:property value="bean.correoPersonal" />"/>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Teléfono celular</label>
                                    <input type="number" name="bean.telefonoCelular" id="telefonoCelular"
                                           class="form-control" value="<s:property value="bean.telefonoCelular" />"/>
                                </div>
                                <div class="col-md-6">
                                    <label>Teléfono de casa</label>
                                    <input type="number" name="bean.telefonoCasa" id="telefonoCasa"
                                           class="form-control" value="<s:property value="bean.telefonoCasa" />"/>
                                </div>
                            </div>
                            <hr />
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="datos_escolares">
                            <hr />
                            <label>Universidad de Egreso</label>
                            <input type="text" name="bean.universidadEgreso" id="universisdadEgreso"
                                   class="form-control" value="<s:property value="bean.universidadEgreso" />"/>
                            <br/>
                            <label>Carrera de egreso</label>
                            <input type="text" name="bean.carreraEgreso" id="carreraEgreso"
                                   class="form-control" value="<s:property value="bean.carreraEgreso" />"/>
                            <br/>
                            <label>Matrícula</label>
                            <input type="text" name="bean.matricula" id="matricula" class="form-control" value="<s:property value="bean.matricula" />"/>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Cuatrimestre en el que ingresó</label>
                                    <input type="number" name="bean.cuatrimestreIngreso" id="cuatrimestreIngreso"
                                           class="form-control" value="<s:property value="bean.cuatrimestreIngreso" />"/>
                                </div>
                                <div class="col-md-6">
                                    <label>Cuatrimestre Actual</label>
                                    <input type="number" name="bean.cuatrimestreActual" id="cuatrimestreActual"
                                           class="form-control" value="<s:property value="bean.cuatrimestreActual" />"/>
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
                                           class="form-control" value="<s:property value="bean.correoInstitucional" />"/>
                                    <br/>
                                    <label>Contraseña</label>
                                    <input type="password" name="bean.contrasena" id="contrasena"
                                           class="form-control" value="<s:property value="bean.contrasena" />"/>
                                    <br/>
                                    <label>Repita la contraseña</label>
                                    <input type="password" name="bean.contrasena" id="contrasena2"
                                           class="form-control"
                                           value="<s:property value="bean.contrasena" />"
                                           onchange="verificarContraseña(this.value)"/>
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
                                    <br />
                                    <label>Estado Actual</label>
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
                                    <input type="text" name="bean.modalidadIngreso" id="modalidadIngreso"
                                           class="form-control" value="<s:property value="bean.modalidadEgreso" />"/>
                                    <br/>
                                    <label>Modalidad actual</label>
                                    <input type="text" name="bean.modalidadActual" id="modalidadActual"
                                           class="form-control" value="<s:property value="bean.modalidadActual" />"/>
                                    <br/>
                                    <label>Fecha de ingreso</label>
                                    <input type="date" name="bean.fechaIngreso" id="fechaIngreso"
                                           class="form-control" value="<s:property value="bean.fechaIngreso" />"/>
                                    <br/>
                                    <label>Fecha de egreso</label>
                                    <input type="date" name="bean.fechaEgreso" id="" fechaEgreso
                                           class="form-control" value="<s:property value="bean.fechaEgreso" />"/>
                                    <br/>
                                    <label>Rol</label>
                                    <select name="bean.rol" id="rol" class="form-control">
                                        <s:iterator value="listRol" status="stat" var="lista">
                                            <option value="<s:property value="rol" />"><s:property
                                                    value="rol"/></option>
                                        </s:iterator>
                                    </select>
                                </div>
                            </div>
                            <hr/>
                        </div>

                        <div role="tabpanel" class="tab-pane fade" id="tecnologias_aplicadas">
                            <hr/>
                            <label>Tecnologías aplicadas</label>
                            <textarea name="bean.tecnologiasAplicadas" id="tecnologiasAplicadas"
                                      class="form-control" value="<s:property value="bean.tecnologiasAplicadas" />"></textarea>
                            <hr/>
                        </div>

                    </div>
                </div>

                <button class="btn btn-success" type="submit">
                    Guardar
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
