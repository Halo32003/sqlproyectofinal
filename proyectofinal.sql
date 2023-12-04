--Lenguaje DDL
DROP DATABASE IF EXISTS proyectofinal;
CREATE DATABASE proyectofinal CHARACTER SET utf8mb4;
USE proyectofinal;

CREATE TABLE carrera (
  codigo_carrera VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE estudiante (
  matricula VARCHAR(10) PRIMARY KEY,
  ap_paterno VARCHAR(30) NOT NULL,
  ap_materno VARCHAR(30) NOT NULL,
  nombre_es VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  edad VARCHAR(5) NOT NULL,
  cod_carrera VARCHAR(10) NOT NULL,
  FOREIGN KEY (cod_carrera) REFERENCES carrera(codigo_carrera)
);

CREATE TABLE profesor (
  num_personal VARCHAR(15) PRIMARY KEY,
  ap_paterno VARCHAR(30) NOT NULL,
  ap_materno VARCHAR(30) NOT NULL,
  nombre_pr VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  grado_max VARCHAR(30) NOT NULL
);

CREATE TABLE area_formacion (
  codigo_area VARCHAR(19) PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);

CREATE TABLE materia (
  cod_materia VARCHAR(15) PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  creditos INT NOT NULL,
  bloque VARCHAR(5) NOT NULL,
  cod_carr VARCHAR(10) NOT NULL,
  cod_area VARCHAR(10) NOT NULL,
  FOREIGN KEY (cod_carr) REFERENCES carrera(codigo_carrera),
  FOREIGN KEY (cod_area) REFERENCES area_formacion(codigo_area)
);

CREATE TABLE periodo_escolar (
  codigo_periodo VARCHAR(15) PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL
);

CREATE TABLE oferta_academica (
  nrc VARCHAR(50) NOT NULL,
  codi_materia VARCHAR(10) NOT NULL,
  cod_periodo VARCHAR(15) NOT NULL,
  nume_personal VARCHAR(15) NOT NULL,
  PRIMARY KEY (nrc,codi_materia,cod_periodo, nume_personal),
  FOREIGN KEY (codi_materia) REFERENCES materia(cod_materia),
  FOREIGN KEY (cod_periodo) REFERENCES periodo_escolar(codigo_periodo),
  FOREIGN KEY (nume_personal) REFERENCES profesor(num_personal)
);

CREATE TABLE historico_cal (
  id INT UNSIGNED AUTO_INCREMENT,
  matri VARCHAR(10) NOT NULL,
  nrcc VARCHAR(50) NOT NULL,
  calificacion INT NOT NULL,
  PRIMARY KEY (id,nrcc,matri),
  FOREIGN KEY (nrcc) REFERENCES oferta_academica(nrc),
  FOREIGN KEY (matri) REFERENCES estudiante(matricula)
);

--Lenguaje DML

INSERT INTO carrera VALUES('L4334', 'LIS', 'Lic. En Ingeniería de Sofware');
INSERT INTO carrera VALUES('L4556', 'LICIC', 'Lic. en Ciberseguridad');
INSERT INTO carrera VALUES('L4285', 'LISTI', 'Lic. en Sistemas y Tecnologías de la Información');
INSERT INTO carrera VALUES('L4948', 'LE', 'Lic. en Estadística');
INSERT INTO carrera VALUES('L4007', 'LRSC', 'Lic. en Redes y Servicios de Cómputo');
INSERT INTO carrera VALUES('L41129', 'LTC', 'Lic. en tecnologías computacionales');


INSERT INTO estudiante VALUES('S407301', 'Serrano', 'Hernandez', 'Erick Orlando', 'eosh437301@hotmail.com', '20', 'L41129');
INSERT INTO estudiante VALUES('S401047', 'Villa', 'Dominguez', 'Cybele', 'cvd491047@hotmail.com', 'Null', 'L4007');
INSERT INTO estudiante VALUES('S401749', 'Huerta', 'Valera', 'Cesar Huerta', 'chhv401749@hotmail.com', '24', 'L41129');
INSERT INTO estudiante VALUES('S402848', 'Ramos', 'Rizo', 'Felipe', 'frr402848@hotmail.com', 'Null', 'L4007');
INSERT INTO estudiante VALUES('S403717', 'Mendoza', 'Pale', 'Ariadna', 'amp403717@hotmail.com', '21', 'L4556');
INSERT INTO estudiante VALUES('S402948', 'Ramos', 'Hernandez', 'Yosue', 'yrh402948@hotmail.com', '21', 'L4556');
INSERT INTO estudiante VALUES('S402847', 'Mozo', 'Rodriguez', 'Alan', 'amr402847@hotmail.com', 'Null', 'L4948');
INSERT INTO estudiante VALUES('S406850', 'Vega', 'Rojas', 'Ernesto Alexis', 'avre406850@hotmail.com', 'Null', 'L4948');
INSERT INTO estudiante VALUES('S400585', 'Jimenez', 'Rodriguez', 'Raul Alonso', 'rajr460585@hotmail.com', '19', 'L4285');
INSERT INTO estudiante VALUES('S406940', 'Perez', 'Mendoza', 'Sergio Michel', 'smpm406940@hotmail.com', '19',  'L4334');
INSERT INTO estudiante VALUES('S402379', 'Serrano', 'Perez', 'Miguel Angel', 'masp402379@hotmail.com', 'Null', 'L4285');
INSERT INTO estudiante VALUES('S402965', 'Chavez', 'Magallon', 'Luis Gerardo', 'lgcm402965@hotmail.com', 'Null', 'L4334');


INSERT INTO profesor VALUES('20201', 'Ramos', 'Gomez', 'Isabella', 'irg20201@hotmail.com', 'licenciatura');
INSERT INTO profesor VALUES('20202', 'Martinez', 'Lopez', 'Alejandro', 'aml20202@hotmail.com', 'maestría');
INSERT INTO profesor VALUES('20203', 'Sanchez', 'Orea', 'Alfonso', 'aso20203@hotmail.com', 'maestría');
INSERT INTO profesor VALUES('20204', 'Hernandez', 'Calderon', 'Jose Guillermo', 'jghc20204@hotmail.com', 'maestría');
INSERT INTO profesor VALUES('20205', 'Alonso', 'Ramirez', 'Oscar', 'oar20205@hotmail.com', 'licenciatura');
INSERT INTO profesor VALUES('20206', 'Escalante', 'Vega', 'Juana Elisa', 'jeev20206@hotmail.com', 'licenciatura');
INSERT INTO profesor VALUES('20207', 'Hernandez', 'Rodriguez', 'Maria Lourdes', 'mlhr20207@hotmail.com', 'doctorado');
INSERT INTO profesor VALUES('20208', 'Martinez', 'Armengol', 'Angel Ignacio', 'aima20208@hotmail.com', 'maestría');
INSERT INTO profesor VALUES('20209', 'Ramos', 'Prado', 'Jose Maria', 'jmrp20209@hotmail.com', 'doctorado');
INSERT INTO profesor VALUES('20210', 'Sosa', 'Jimenez', 'Candy Obdulia', 'cosj20210@hotmail.com', 'licenciatura');
INSERT INTO profesor VALUES('20211', 'Contreras', 'Vega', 'Gerardo', 'gcv20211@hotmail.com', 'doctorado');
INSERT INTO profesor VALUES('20212', 'Aguilar', 'Morales', 'Julio', 'jam20212@hotmail.com', 'maestría');


INSERT INTO area_formacion VALUES('1111', 'Básica');
INSERT INTO area_formacion VALUES('1112', 'Disciplinaria');
INSERT INTO area_formacion VALUES('1113', 'Terminal');
INSERT INTO area_formacion VALUES('1114', 'AFEL');


INSERT INTO materia VALUES('30607', 'Programacion', 'Continuación de Introducción a la programación', '9', '1', 'L4334', '1111');
INSERT INTO materia VALUES('30593', 'Computación Básica', 'Fundamentos básicos de computación', '8', '1', 'L4556', '1111');
INSERT INTO materia VALUES('30194', 'Tecnologías Web', 'Desarrollo de páginas web', '8', '2', 'L4007', '1112');
INSERT INTO materia VALUES('30193', 'Estructura de Datos', 'Estructura de datos más complejas', '8', '2', 'L41129', '1112');
INSERT INTO materia VALUES('40294', 'Interfaces de usuarios', 'Interfaces visuales', '8', '4', 'L4948', '1113');
INSERT INTO materia VALUES('49764', 'Desarrollo Móvil', 'Desarrollo de aplicaciones móviles', '7', '4', 'L4285', '1113');
INSERT INTO materia VALUES('40284', 'Ajedrez', 'Fundamentos de ajedrez', '4', '3', 'L4556', '1114');
INSERT INTO materia VALUES('30483', 'Apreciación al cine', 'Visualización de películas', '4', '3', 'L4334', '1114');


INSERT INTO periodo_escolar VALUES('A100', 'Primer Periodo', '2023-07-21', '2023-12-02');
INSERT INTO periodo_escolar VALUES('A101', 'Segundo Periodo', '2023-07-21', '2023-12-02');
INSERT INTO periodo_escolar VALUES('A102', 'Tercer Periodo', '2023-07-21', '2023-12-02');
INSERT INTO periodo_escolar VALUES('A103', 'Cuarto Periodo', '2023-07-21', '2023-12-02');


INSERT INTO oferta_academica VALUES('4440', '30607', 'A100', '20201');
INSERT INTO oferta_academica VALUES('4441', '30593', 'A103', '20202');
INSERT INTO oferta_academica VALUES('4442', '30194', 'A100', '20203');
INSERT INTO oferta_academica VALUES('4443', '30193', 'A101', '20204');
INSERT INTO oferta_academica VALUES('4444', '40294', 'A102', '20205');
INSERT INTO oferta_academica VALUES('4445', '49764', 'A102', '20206');
INSERT INTO oferta_academica VALUES('4446', '40284', 'A103', '20207');
INSERT INTO oferta_academica VALUES('4447', '30483', 'A101', '20208');


INSERT INTO historico_cal VALUES('1', 'S406850', '4440', '8');
INSERT INTO historico_cal VALUES('2', 'S401047', '4441', '7');
INSERT INTO historico_cal VALUES('3', 'S403717', '4441', '5');
INSERT INTO historico_cal VALUES('4', 'S401047', '4442', '10');
INSERT INTO historico_cal VALUES('5', 'S402965', '4443', '5');
INSERT INTO historico_cal VALUES('6', 'S402379', '4442', '7');
INSERT INTO historico_cal VALUES('7', 'S406940', '4444', '6');
INSERT INTO historico_cal VALUES('8', 'S402948', '4445', '9');
INSERT INTO historico_cal VALUES('9', 'S407301', '4440', '9');
INSERT INTO historico_cal VALUES('10', 'S402948', '4447', '10');
INSERT INTO historico_cal VALUES('11', 'S400585', '4445', '7');
INSERT INTO historico_cal VALUES('12', 'S401749', '4443', '8');
INSERT INTO historico_cal VALUES('13', 'S402847', '4447', '5');
INSERT INTO historico_cal VALUES('14', 'S402848', '4446', '8');
INSERT INTO historico_cal VALUES('15', 'S407301', '4444', '6');
INSERT INTO historico_cal VALUES('16', 'S402848', '4446', '7');