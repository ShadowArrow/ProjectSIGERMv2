use BD_SIGERM_V1;

DELIMITER //
CREATE PROCEDURE registrar_roles(
    IN nuevo_nombre VARCHAR(50)
)
BEGIN
    INSERT INTO Rol (nombre) VALUES (nuevo_nombre);
END //DELIMITER ;







DELIMITER //
CREATE PROCEDURE registrar_usuarios(IN nuevo_nombre VARCHAR(50),
                                    IN nuevo_primer_apellido VARCHAR(50),
                                    IN nuevo_segundo_apellido VARCHAR(50),
                                    IN nuevo_fecha_nacimiento VARCHAR(50),
                                    IN nuevo_sexo VARCHAR(30),
                                    IN nuevo_rfc VARCHAR(50),
                                    IN nuevo_cuatrimestre_ingreso INT,
                                    IN nuevo_cuatrimestre_actual INT,
                                    IN nuevo_estatus VARCHAR(20),
                                    IN nuevo_horario_labores VARCHAR(20),
                                    IN nuevo_correo_institucional VARCHAR(100),
                                    IN nuevo_correo_personal VARCHAR(100),
                                    IN nuevo_contrasena VARCHAR(50),
                                    IN nuevo_telefono_celular VARCHAR(20),
                                    IN nuevo_telefono_casa VARCHAR(20),
                                    IN nuevo_universidad_egreso VARCHAR(200),
                                    IN nuevo_matricula VARCHAR(50),
                                    IN nuevo_carrera_egreso VARCHAR(200),
                                    IN nuevo_modalidad_ingreso VARCHAR(20),
                                    IN nuevo_modalidad_actual VARCHAR(20),
                                    IN nuevo_tecnologias_aplicadas VARCHAR(300),
                                    IN nuevo_fecha_ingreso VARCHAR(20),
                                    IN nuevo_fecha_egreso VARCHAR(20),
                                    IN nombre_rol VARCHAR(50))
BEGIN

    DECLARE nuevo_id_rol INT;
    DECLARE nuevo_id_usuario INT;

    INSERT INTO Usuario (nombre,
                         primer_apellido,
                         segundo_apellido,
                         fecha_nacimiento,
                         sexo,
                         rfc,
                         cuatrimestre_ingreso,
                         cuatrimestre_actual,
                         estatus,
                         horario_labores,
                         correo_institucional,
                         correo_personal,
                         contrasena,
                         telefono_celular,
                         telefono_casa,
                         universidad_egreso,
                         matricula,
                         carrera_egreso,
                         modalidad_ingreso,
                         modalidad_actual,
                         tecnologias_aplicadas,
                         fecha_ingreso,
                         fecha_egreso)
    VALUES (nuevo_nombre,
            nuevo_primer_apellido,
            nuevo_segundo_apellido,
            nuevo_fecha_nacimiento,
            nuevo_sexo,
            nuevo_rfc,
            nuevo_cuatrimestre_ingreso,
            nuevo_cuatrimestre_actual,
            nuevo_estatus,
            nuevo_horario_labores,
            nuevo_correo_institucional,
            nuevo_correo_personal,
            nuevo_contrasena,
            nuevo_telefono_celular,
            nuevo_telefono_casa,
            nuevo_universidad_egreso,
            nuevo_matricula,
            nuevo_carrera_egreso,
            nuevo_modalidad_ingreso,
            nuevo_modalidad_actual,
            nuevo_tecnologias_aplicadas,
            nuevo_fecha_ingreso,
            nuevo_fecha_egreso);

    SELECT @nuevo_id_rol := id_rol FROM Rol WHERE nombre = nombre_rol;
    SELECT @nuevo_id_usuario := id_usuario FROM Usuario ORDER BY(id_usuario) DESC LIMIT 1;

    INSERT INTO Usuario_has_Rol (id_rol, id_usuario) VALUES (@nuevo_id_rol, @nuevo_id_usuario);
END //DELIMITER ;









DELIMITER //
CREATE PROCEDURE mostrar_usuarios()
BEGIN
    SELECT U.id_usuario AS id_usuario,
           U.nombre     AS nombre,
           primer_apellido,
           segundo_apellido,
           fecha_nacimiento,
           sexo,
           rfc,
           cuatrimestre_ingreso,
           cuatrimestre_actual,
           estatus,
           horario_labores,
           correo_institucional,
           correo_personal,
           contrasena,
           telefono_celular,
           telefono_casa,
           universidad_egreso,
           matricula,
           carrera_egreso,
           modalidad_ingreso,
           modalidad_actual,
           tecnologias_aplicadas,
           fecha_ingreso,
           fecha_egreso,
           R.nombre     AS rol
    FROM Usuario AS U
             INNER JOIN Usuario_has_Rol AS UR ON U.id_usuario = UR.id_usuario
             INNER JOIN Rol AS R ON UR.id_rol = R.id_rol;
END //DELIMITER ;










DELIMITER //
CREATE PROCEDURE desactivar_usuario(
    IN nuevo_id_usuario INT
)
BEGIN
    UPDATE Usuario SET estatus = 'inactivo' WHERE id_usuario = nuevo_id_usuario;
END //DELIMITER ;










DELIMITER //
CREATE PROCEDURE inicio_sesion(IN nuevo_correo_institucional VARCHAR(100),
                               IN nuevo_contrasena VARCHAR(50))
BEGIN
    SELECT U.id_usuario AS id_usuario,
           U.nombre     AS nombre,
           primer_apellido,
           segundo_apellido,
           fecha_nacimiento,
           sexo,
           rfc,
           cuatrimestre_ingreso,
           cuatrimestre_actual,
           estatus,
           horario_labores,
           correo_institucional,
           correo_personal,
           contrasena,
           telefono_celular,
           telefono_casa,
           universidad_egreso,
           matricula,
           carrera_egreso,
           modalidad_ingreso,
           modalidad_actual,
           tecnologias_aplicadas,
           fecha_ingreso,
           fecha_egreso,
           R.nombre     AS rol
    FROM Usuario AS U
             INNER JOIN Usuario_has_Rol AS UR ON U.id_usuario = UR.id_usuario
             INNER JOIN Rol AS R ON UR.id_rol = R.id_rol
    WHERE correo_institucional = nuevo_correo_institucional
      AND contrasena = nuevo_contrasena;
END //DELIMITER ;








DELIMITER //
CREATE PROCEDURE correo_existe(
    IN nuevo_correo_institucional VARCHAR(100)
)
BEGIN
    SELECT COUNT(id_usuario) AS num FROM Usuario WHERE correo_institucional = nuevo_correo_institucional;
END
//DELIMITER ;






DELIMITER //
CREATE PROCEDURE modificar_contrasena_correo(
    IN nuevo_correo_institucional VARCHAR(100),
    IN nuevo_contrasena VARCHAR(50)
)
BEGIN
    UPDATE Usuario SET contrasena = nuevo_contrasena WHERE correo_institucional = nuevo_correo_institucional;
END
//DELIMITER ;










DELIMITER //
CREATE PROCEDURE modificar_contrasena_id(
    IN nuevo_id_usuario INT,
    IN nuevo_contrasena VARCHAR(50)
)
BEGIN
    UPDATE Usuario SET contrasena = nuevo_contrasena WHERE id_usuario = nuevo_id_usuario;
END
//DELIMITER ;









DELIMITER //
CREATE PROCEDURE modificar_usuarios(IN nuevo_id_usuario INT,
                                    IN nuevo_nombre VARCHAR(50),
                                    IN nuevo_primer_apellido VARCHAR(50),
                                    IN nuevo_segundo_apellido VARCHAR(50),
                                    IN nuevo_fecha_nacimiento VARCHAR(50),
                                    IN nuevo_sexo VARCHAR(30),
                                    IN nuevo_rfc VARCHAR(50),
                                    IN nuevo_cuatrimestre_ingreso INT,
                                    IN nuevo_cuatrimestre_actual INT,
                                    IN nuevo_estatus BOOLEAN,
                                    IN nuevo_horario_labores VARCHAR(20),
                                    IN nuevo_correo_institucional VARCHAR(100),
                                    IN nuevo_correo_personal VARCHAR(100),
                                    IN nuevo_contrasena VARCHAR(50),
                                    IN nuevo_telefono_celular VARCHAR(20),
                                    IN nuevo_telefono_casa VARCHAR(20),
                                    IN nuevo_universidad_egreso VARCHAR(200),
                                    IN nuevo_matricula VARCHAR(50),
                                    IN nuevo_carrera_egreso VARCHAR(200),
                                    IN nuevo_modalidad_ingreso VARCHAR(20),
                                    IN nuevo_modalidad_actual VARCHAR(20),
                                    IN nuevo_tecnologias_aplicadas VARCHAR(300),
                                    IN nuevo_fecha_ingreso VARCHAR(20),
                                    IN nuevo_fecha_egreso VARCHAR(20),
                                    IN nombre_rol VARCHAR(50))
BEGIN

    DECLARE nuevo_id_rol INT;

    SELECT @nuevo_id_rol := id_rol FROM Rol WHERE nombre = nombre_rol;

    UPDATE Usuario
    SET nombre                = nuevo_nombre,
        primer_apellido       = nuevo_primer_apellido,
        segundo_apellido      = nuevo_segundo_apellido,
        fecha_nacimiento      = nuevo_fecha_nacimiento,
        sexo                  = nuevo_sexo,
        rfc                   = nuevo_rfc,
        cuatrimestre_ingreso  = nuevo_cuatrimestre_ingreso,
        cuatrimestre_actual   = nuevo_cuatrimestre_actual,
        estatus               = nuevo_estatus,
        horario_labores       = nuevo_horario_labores,
        correo_institucional  = nuevo_correo_institucional,
        correo_personal       = nuevo_correo_personal,
        contrasena            = nuevo_contrasena,
        telefono_celular      = nuevo_telefono_celular,
        telefono_casa         = nuevo_telefono_casa,
        universidad_egreso    = nuevo_universidad_egreso,
        matricula             = nuevo_matricula,
        carrera_egreso        = nuevo_carrera_egreso,
        modalidad_ingreso     = nuevo_modalidad_ingreso,
        modalidad_actual      = nuevo_modalidad_actual,
        tecnologias_aplicadas = nuevo_tecnologias_aplicadas,
        fecha_ingreso         = nuevo_fecha_ingreso,
        fecha_egreso          = nuevo_fecha_egreso
    WHERE id_usuario = nuevo_id_usuario;

    UPDATE Usuario_has_Rol SET id_rol = @nuevo_id_rol WHERE id_usuario = nuevo_id_usuario;
END //DELIMITER ;












DELIMITER //
CREATE PROCEDURE mostrar_rol()
BEGIN
    SELECT * FROM Rol;
END //DELIMITER ;








DELIMITER //
CREATE PROCEDURE mostrar_usuario_id(
    IN nuevo_id_usuario INT
)
BEGIN
    SELECT U.id_usuario AS id_usuario,
           U.nombre     AS nombre,
           primer_apellido,
           segundo_apellido,
           fecha_nacimiento,
           sexo,
           rfc,
           cuatrimestre_ingreso,
           cuatrimestre_actual,
           estatus,
           horario_labores,
           correo_institucional,
           correo_personal,
           contrasena,
           telefono_celular,
           telefono_casa,
           universidad_egreso,
           matricula,
           carrera_egreso,
           modalidad_ingreso,
           modalidad_actual,
           tecnologias_aplicadas,
           fecha_ingreso,
           fecha_egreso,
           R.nombre     AS rol
    FROM Usuario AS U
             INNER JOIN Usuario_has_Rol AS UR ON U.id_usuario = UR.id_usuario
             INNER JOIN Rol AS R ON UR.id_rol = R.id_rol
    WHERE U.id_usuario = nuevo_id_usuario;
END //DELIMITER ;









DELIMITER //
CREATE PROCEDURE mostrar_bienes()
BEGIN
    SELECT * FROM Bien;
END
//DELIMITER ;


DELIMITER //
CREATE PROCEDURE registrar_bienes(IN nuevo_codigo_inventario VARCHAR(50),
                                  IN nuevo_nombre VARCHAR(50),
                                  IN nuevo_descripcion VARCHAR(200),
                                  IN nuevo_precio VARCHAR(50),
                                  IN nuevo_marca VARCHAR(50),
                                  IN nuevo_modelo VARCHAR(50),
                                  IN nuevo_no_serie VARCHAR(50),
                                  IN nuevo_estatus VARCHAR(20))
BEGIN
    INSERT INTO Bien (codigo_inventario, nombre, descripcion, precio, marca, modelo, no_serie, estatus)
    VALUES (nuevo_codigo_inventario, nuevo_nombre, nuevo_descripcion, nuevo_precio, nuevo_marca, nuevo_modelo,
            nuevo_no_serie, nuevo_estatus);
END
//DELIMITER ;


DELIMITER //
CREATE PROCEDURE desactivar_bien(
    IN nuevo_id_bien INT
)
BEGIN
    UPDATE Bien SET estatus = 'inactivo' WHERE id_bien = nuevo_id_bien;
END
//DELIMITER ;


DELIMITER //
CREATE PROCEDURE activar_bien(
    IN nuevo_id_bien INT
)
BEGIN
    UPDATE Bien SET estatus = 'activo' WHERE id_bien = nuevo_id_bien;
END
//DELIMITER ;


DELIMITER //
CREATE PROCEDURE modificar_bien(IN nuevo_id_bien INT,
                                IN nuevo_codigo_inventario VARCHAR(50),
                                IN nuevo_nombre VARCHAR(50),
                                IN nuevo_descripcion VARCHAR(200),
                                IN nuevo_precio VARCHAR(50),
                                IN nuevo_marca VARCHAR(50),
                                IN nuevo_modelo VARCHAR(50),
                                IN nuevo_no_serie VARCHAR(50),
                                IN nuevo_estatus VARCHAR(20))
BEGIN
    UPDATE Bien
    SET codigo_inventario = nuevo_codigo_inventario,
        nombre            = nuevo_nombre,
        descripcion       = nuevo_descripcion,
        precio            = nuevo_precio,
        marca             = nuevo_marca,
        modelo            = nuevo_modelo,
        no_serie          = nuevo_no_serie,
        estatus           = nuevo_estatus
    WHERE id_bien = nuevo_id_bien;
END
//DELIMITER ;
call mostrar_asignaciones()
DELIMITER //
CREATE PROCEDURE mostrar_asignaciones()
BEGIN
    SELECT Asignacion.id_asignacion,
           Bien.id_bien,
           Bien.codigo_inventario,
           Bien.nombre,
           Bien.descripcion,
           Bien.precio,
           Bien.marca,
           Bien.modelo,
           Bien.no_serie,
           Bien.estatus,

           EspacioFisico.id_espacio_fisico,
           EspacioFisico.nombre,
           EspacioFisico.numero,
           EspacioFisico.descripcion,

           Responsable.id_usuario,
           Responsable.nombre,
           Responsable.primer_apellido,
           Responsable.segundo_apellido,
           Responsable.fecha_nacimiento,
           Responsable.cuatrimestre_ingreso,
           Responsable.cuatrimestre_actual,
           Responsable.estatus,
           Responsable.horario_labores,
           Responsable.correo_institucional,
           Responsable.correo_personal,
           Responsable.contrasena,
           Responsable.telefono_celular,
           Responsable.telefono_casa,
           Responsable.universidad_egreso,
           Responsable.matricula,
           Responsable.carrera_egreso,
           Responsable.modalidad_ingreso,
           Responsable.modalidad_actual,
           Responsable.tecnologias_aplicadas,
           Responsable.fecha_ingreso,
           Responsable.fecha_egreso,
           R.nombre,

           EspacioFisico.estatus,

           ResponsableBien.id_usuario,
           ResponsableBien.nombre,
           ResponsableBien.primer_apellido,
           ResponsableBien.segundo_apellido,
           ResponsableBien.fecha_nacimiento,
           ResponsableBien.cuatrimestre_ingreso,
           ResponsableBien.cuatrimestre_actual,
           ResponsableBien.estatus,
           ResponsableBien.horario_labores,
           ResponsableBien.correo_institucional,
           ResponsableBien.correo_personal,
           ResponsableBien.contrasena,
           ResponsableBien.telefono_celular,
           ResponsableBien.telefono_casa,
           ResponsableBien.universidad_egreso,
           ResponsableBien.matricula,
           ResponsableBien.carrera_egreso,
           ResponsableBien.modalidad_ingreso,
           ResponsableBien.modalidad_actual,
           ResponsableBien.tecnologias_aplicadas,
           ResponsableBien.fecha_ingreso,
           ResponsableBien.fecha_egreso,
           RU.nombre,

           Utiliza.id_usuario,
           Utiliza.nombre,
           Utiliza.primer_apellido,
           Utiliza.segundo_apellido,
           Utiliza.fecha_nacimiento,
           Utiliza.cuatrimestre_ingreso,
           Utiliza.cuatrimestre_actual,
           Utiliza.estatus,
           Utiliza.horario_labores,
           Utiliza.correo_institucional,
           Utiliza.correo_personal,
           Utiliza.contrasena,
           Utiliza.telefono_celular,
           Utiliza.telefono_casa,
           Utiliza.universidad_egreso,
           Utiliza.matricula,
           Utiliza.carrera_egreso,
           Utiliza.modalidad_ingreso,
           Utiliza.modalidad_actual,
           Utiliza.tecnologias_aplicadas,
           Utiliza.fecha_ingreso,
           Utiliza.fecha_egreso,
           UT.nombre,

           Proyecto.id_proyecto,
           Proyecto.identificador,
           Proyecto.nombre,
           Proyecto.descripcion,
           Proyecto.nombre_cliente,
           Proyecto.correo_cliente,
           Proyecto.telefono_cliente,
           Proyecto.direccion_cliente,
           Proyecto.fecha_inicio,
           Proyecto.fecha_fin,
           Proyecto.estatus,

           Asignacion.estatus

    from Asignacion
             inner join Bien on Asignacion.id_bien = Bien.id_bien
             inner join EspacioFisico on Asignacion.id_espacio_fisico = EspacioFisico.id_espacio_fisico
             inner join Usuario as Responsable on EspacioFisico.id_usuario = Responsable.id_usuario
             INNER JOIN Usuario_has_Rol AS URO ON Responsable.id_usuario = URO.id_usuario
             inner join Rol AS R ON URO.id_rol = R.id_rol
             inner join Usuario as ResponsableBien on Asignacion.id_usuario_responsable = ResponsableBien.id_usuario
             INNER JOIN Usuario_has_Rol AS URB ON Responsable.id_usuario = URB.id_usuario
             inner join Rol AS RU ON URB.id_rol = RU.id_rol
             inner join Usuario as Utiliza on Asignacion.id_usuario_utiliza = Utiliza.id_usuario
             INNER JOIN Usuario_has_Rol AS URU ON Responsable.id_usuario = URU.id_usuario
             inner join Rol AS UT ON URU.id_rol = UT.id_rol
             inner join Proyecto on Asignacion.id_proyecto = Proyecto.id_proyecto;
END //DELIMITER ;

CALL registrar_roles('RGB');
CALL registrar_roles('RAPE');
CALL registrar_roles('RD');
CALL registrar_roles('AP');
CALL registrar_usuarios(
        'Luis Daniel',
        'Macias',
        'López',
        '1999-04-07',
        8,
        10,
        'activo',
        '8:00AM a 4:00PM',
        '20173ti169@utez.edu.mx',
        'danielmacias9955@gmail.com',
        'danielml',
        '7772231182',
        '',
        'Universidad Tecnológica de Emiliano Zapata',
        '20173ti169',
        'Ingenieria en Sistemas Informáticos',
        'Becario',
        'Profesor',
        'Java, Hibernate, grails, MySQL, SQL Server, Angular 7, React, Symfony',
        '08/02/2019',
        '',
        'RGB'
    );

DELIMITER //
CREATE PROCEDURE registrar_asignacion(IN nuevo_id_bien int,
                                      IN nuevo_id_espacio_fisico int,
                                      IN nuevo_id_usuario_responsable int,
                                      IN nuevo_id_usuario_utiliza int,
                                      IN nuevo_id_proyecto int,
                                      IN nuevo_estatus VARCHAR(20))
BEGIN
    INSERT INTO Asignacion (id_bien, id_espacio_fisico, id_usuario_responsable, id_usuario_utiliza, id_proyecto,
                            estatus)
    VALUES (nuevo_id_bien, nuevo_id_espacio_fisico, nuevo_id_usuario_responsable, nuevo_id_usuario_utiliza,
            nuevo_id_proyecto, nuevo_estatus);
END
//DELIMITER ;
select *
from Usuario;
