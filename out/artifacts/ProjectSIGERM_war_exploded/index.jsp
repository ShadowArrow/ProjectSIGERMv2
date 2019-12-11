<%--
  Created by IntelliJ IDEA.
  User: yoshi
  Date: 22/10/2019
  Time: 06:48 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<% String context = request.getContextPath();%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=context%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <link rel="stylesheet" href="<%=context%>/css/back.css">
    <script src="<%=context%>/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<%=context%>/js/jquery-3.4.1.min.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.js"></script>
    <script src="<%=context%>/bootstrap/js/bootstrap.min.js"></script>
    <title>SIGERM</title>
    <link rel="icon" type="image/png" href="<%=context%>/img/logocds.png"/>
</head>
<body>
<div class="wave">

</div>
<div class="transparent-back">
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card card-login" style="width: 20rem; height: 40rem;" id="login">
                    <img src="<%=context%>/img/cds.png" class="card-img-top growing-up" alt="...">
                    <div class="card-body">
                        <h3 class="card-title">Iniciar Sesión</h3>
                        <form method="post" action="<%=context%>/IniciarSesion">
                            <label>Correo Electrónico</label>
                            <br/>
                            <input type="email" class="form-control" name="bean.correoInstitucional"
                                   id="correoInstitucional"/>
                            <br/>
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="bean.contrasena" id="contrasena">
                            <hr/>
                            <button type="submit" class="btn btn-success btn-block">Iniciar Sesión</button>
                            <br/>
                            <a data-toggle="modal" data-target="#recuperarModal" style="text-decoration: none;">
                                ¿Olvidaste tu contraseña? <i class="fas fa-power-off"></i>
                            </a>
                            <p style="color: red;"><s:property value="mensaje"/></p>
                        </form>
                    </div>
                    <br/>
                </div>

                <div class="card card-login" style="width: 20rem; height: 40rem; display: none;"
                     id="introducirToken">
                    <img src="<%=context%>/img/cds.png" class="card-img-top growing-up" alt="...">
                    <div class="card-body">
                        <h3 class="card-title">Recuperar Contraseña</h3>
                        <h5>Introduce el código enviado a tu correo electrónico ingresado.</h5>
                        <hr/>
                        <labe>Token.</labe>
                        <br/>
                        <input type="number" class="form-control" name="beanMail.token"
                               id="token"/>
                        <hr/>
                        <button type="submit" class="btn btn-success btn-block" onclick="verificarToken()">Enviar Código</button>
                        <br/>
                    </div>
                    <br/>
                    <br/>
                </div>

                <div class="card card-login" style="width: 20rem; height: 40rem; display: none;"
                     id="recuperarContraseña">
                    <img src="<%=context%>/img/cds.png" class="card-img-top growing-up" alt="...">
                    <div class="card-body">
                        <h5>Introduce tu nueva contraseña.</h5>
                        <hr/>
                        <labe>Contraseña.</labe>
                        <br/>
                        <input type="password" class="form-control" name="beanMail.contrasena"
                               id="contrasena2"/>
                        <br/>
                        <labe>Confirma tu Contraseña.</labe>
                        <br/>
                        <input type="password" class="form-control" name="beanMail.contrasena"
                               id="confirmacion"/>
                        <hr/>
                        <button type="button" class="btn btn-success btn-block" onclick="modificarContrasena()">Cambiar Contraseña</button>
                        <br/>
                    </div>
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal que abre la acción asincrona "EnviarEmail" -->

<div class="modal fade" id="recuperarModal" tabindex="-1" role="dialog" aria-labelledby="recuperarModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="recuperarModalLabel">Ingresa tu correo electrónico</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Ingresa tu correo electrónico para confirmar que eres tu.</p>
                <label>Correo Electrónico</label>
                <br/>
                <!-- Input con el valor que obtiene el metodo -->
                <input type="email" class="form-control" id="para"/>
            </div>
            <div class="modal-footer">

                <!-- Boton que ejecuta el metodo asincrono para enviar el email de recuperación de contraseña-->
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="CorreoExiste()">Enviar
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="mensajeModal" tabindex="-1" role="dialog" aria-labelledby="mensajeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-sm-3" id="img-mensaje">

                    </div>
                    <div class="col-md-8">
                        <h5 id="mensajeAccion"></h5>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="mensajeCargaModal" tabindex="-1" role="dialog" aria-labelledby="mensajeCargaModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-3" id="img-carga">

                    </div>
                    <div class="col-md-8">
                        <h5 id="mensaje"></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


<!-- Script de metodos asincronos en el jsp -->
<script>
    //Se recupera la direccion raiz del archivo
    //---------------------------------------------------------------------------------------------------------------
    let raiz = window.location.origin + "/ProjectSIGERM_war_exploded/";
    //---------------------------------------------------------------------------------------------------------------

    function CorreoExiste(){
        var para = $("#para").val();
        $.ajax({
            type: "POST",
            url: raiz +  "CorreoExiste",
            data: "BeanMail.para=" + para,
            success: function (data) {
                function enviarCorreo() {
                    document.getElementById("img-carga").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/loading.gif\" />";
                    document.getElementById("mensaje").innerHTML = "Enviando el correo electrónico, \n por favor espere...";
                    $("#mensajeCargaModal").modal("show");
                    var para = $("#para").val();
                    $.ajax({
                        type: "POST",
                        url: raiz + "EnviarEmail",
                        data: "BeanMail.para=" + para,
                        success: function (data) {
                            $("#mensajeCargaModal").modal("hide");
                            document.getElementById("mensajeAccion").innerHTML = "Se ha enviado un correo electrónico con los pasos para recuperar tu contraseña.";
                            document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/check.png\" />";
                            $("#introducirToken").fadeToggle();
                            $("#login").fadeToggle();
                            $("#mensajeModal").modal("show");
                        },
                        error: function (data) {
                            $("#mensajeCargaModal").modal("hide");
                            document.getElementById("mensajeAccion").innerHTML = "No se ha podido enviar el correo electrónico, \n intente nuevamente.";
                            document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/warning.png\" />";
                            $("#mensajeModal").modal("show");
                        }
                    });
                }
                return enviarCorreo();
            },
            error: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "ERROR: \n El correo electrónico ingresado no esta registrado en la base de datos.";
                document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/warning.png\" />";
                $("#mensajeModal").modal("show");
            }
        });
    }

    //--------------------------------------------------------------------------------------------------------------


    //función de verificarToken
    //---------------------------------------------------------------------------------------------------------------
    function verificarToken() {
        var token = $("#token").val();
        $.ajax({
            type: "POST",
            url: raiz +  "VerificarToken",
            data: "BeanMail.token=" + token,
            success: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "El codigo de verificacion es el correcto.";
                document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/check.png\" />";
                $("#mensajeModal").modal("show");
                $("#introducirToken").fadeToggle();
                $("#recuperarContraseña").fadeToggle();
            },
            error: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "Hubo un error al enviar verificar el token, \n por favor intentelo de nuevo.";
                document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/warning.png\" />";
                $("#mensajeModal").modal("show");
            }
        });
    }
    //---------------------------------------------------------------------------------------------------------------


    //función modificar contrasena
    //---------------------------------------------------------------------------------------------------------------
    function modificarContrasena(){
        var contrasena = $("#contrasena2").val();
        $.ajax({
            type: "POST",
            url: raiz +  "CambiarContrasena",
            data: "BeanMail.contrasena=" + contrasena,
            success: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "Se ha modificado correctamente la contraseña.";
                document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/check.png\" />";
                $("#mensajeModal").modal("show");
                $("#login").fadeToggle();
                $("#recuperarContraseña").fadeToggle();
            },
            error: function (data) {
                document.getElementById("mensajeAccion").innerHTML = "Hubo un error al modificar la contraseña, \n por favor intentelo de nuevo.";
                document.getElementById("img-mensaje").innerHTML = "<img class=\"img-fluid\" src=\"<%=context%>/img/warning.png\" />";
                $("#mensajeModal").modal("show");
            }
        });
    }
</script>
</html>
