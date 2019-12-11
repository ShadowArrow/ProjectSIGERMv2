SET GLOBAL time_zone = '-3:00';

drop database BD_SIGERM_V1;
create database BD_SIGERM_V1;
use BD_SIGERM_V1;

create table Usuario
(
    id_usuario            INT primary key auto_increment NOT NULL,
    nombre                VARCHAR(50)                    NOT NULL,
    primer_apellido       VARCHAR(50)                    NOT NULL,
    segundo_apellido      VARCHAR(50),
    fecha_nacimiento      VARCHAR(20)                    NOT NULL,
    sexo                  VARCHAR(30)                    NOT NULL,
    rfc                   VARCHAR(50)                    NOT NULL,
    cuatrimestre_ingreso  INT,
    cuatrimestre_actual   INT,
    estatus               VARCHAR(20)                    NOT NULL,
    horario_labores       VARCHAR(20),
    correo_institucional  VARCHAR(100)                   NOT NULL,
    correo_personal       VARCHAR(190)                   NOT NULL,
    contrasena            VARCHAR(50)                    NOT NULL,
    telefono_celular      VARCHAR(20)                    NOT NULL,
    telefono_casa         VARCHAR(20),
    universidad_egreso    VARCHAR(200)                   NOT NULL,
    matricula             VARCHAR(50)                    NOT NULL,
    carrera_egreso        VARCHAR(200)                   NOT NULL,
    modalidad_ingreso     VARCHAR(20)                    NOT NULL,
    modalidad_actual      VARCHAR(20)                    NOT NULL,
    tecnologias_aplicadas VARCHAR(300)                   NOT NULL,
    fecha_ingreso         VARCHAR(20)                    NOT NULL,
    fecha_egreso          VARCHAR(20),
    UNIQUE (correo_institucional)
);

create table EspacioFisico
(
    id_espacio_fisico INT primary key auto_increment NOT NULL,
    nombre            VARCHAR(50)                    NOT NULL,
    numero            INT                            NOT NULL,
    descripcion       VARCHAR(200)                   NOT NULL,
    id_usuario        INT                            NOT NULL,
    estatus           VARCHAR(20)                    NOT NULL,
    tipo              VARCHAR(9)                     NOT NULL,
    posicion          INT,
    CONSTRAINT fk_idUsuario_lugar foreign key (id_usuario) references Usuario (id_usuario)
);

create table Rol
(
    id_rol INT primary key auto_increment NOT NULL,
    nombre VARCHAR(50)                    NOT NULL
);

create table Usuario_has_Rol
(
    id_usuario_has_rol INT AUTO_INCREMENT,
    id_usuario         INT NOT NULL,
    id_rol             INT NOT NULL,
    PRIMARY KEY (id_usuario_has_rol),
    CONSTRAINT fk_idUsuarioRol FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_idRol FOREIGN KEY (id_rol) REFERENCES Rol (id_rol)
);

create table Bien
(
    id_bien           INT primary key auto_increment NOT NULL,
    codigo_inventario VARCHAR(50)                    NOT NULL,
    nombre            VARCHAR(50)                    NOT NULL,
    descripcion       VARCHAR(200)                   NOT NULL,
    precio            VARCHAR(50)                    NOT NULL,
    marca             VARCHAR(50) default 'S/N',
    modelo            VARCHAR(50) default 'S/N',
    no_serie          VARCHAR(50) default 'S/N',
    estatus           VARCHAR(20)                    NOT NULL
);

create table Proyecto
(
    id_proyecto       INT primary key auto_increment NOT NULL,
    identificador     VARCHAR(50)                    NOT NULL,
    nombre            VARCHAR(50)                    NOT NULL,
    descripcion       VARCHAR(200)                   NOT NULL,
    nombre_cliente    VARCHAR(100)                   NOT NULL,
    correo_cliente    VARCHAR(100)                   NOT NULL,
    telefono_cliente  VARCHAR(20)                    NOT NULL,
    direccion_cliente VARCHAR(100)                   NOT NULL,
    fecha_inicio      VARCHAR(20)                    NOT NULL,
    fecha_fin         VARCHAR(20)                    NOT NULL,
    estatus           VARCHAR(20)                    NOT NULL
);

create table Asignacion
(
    id_asignacion          INT primary key auto_increment NOT NULL,
    id_bien                INT                            NOT NULL,
    id_espacio_fisico      INT                            NOT NULL,
    id_usuario_responsable INT                            NOT NULL,
    id_usuario_utiliza     INT                            NOT NULL,
    id_proyecto            INT                            NOT NULL,
    estatus                VARCHAR(20)                    NOT NULL,
    CONSTRAINT fk_id_bien foreign key (id_bien) references Bien (id_bien),
    CONSTRAINT fk_id_espacio_fisico foreign key (id_espacio_fisico) references EspacioFisico (id_espacio_fisico),
    CONSTRAINT fk_idUsuario_responsable foreign key (id_usuario_responsable) references Usuario (id_usuario),
    CONSTRAINT fk_idUsuario_utiliza foreign key (id_usuario_utiliza) references Usuario (id_usuario),
    CONSTRAINT fk_id_proyecto foreign key (id_proyecto) references Proyecto (id_proyecto)
);


