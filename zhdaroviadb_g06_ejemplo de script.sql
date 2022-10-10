--CREACION DE TABLAS

create table paises(
    codPais int,
	nomPais varchar(60)
);
create table departamentos(
    codDepartamento int,
    nomDepartamento varchar(60),
    pais int
);
create table municipios(
    codMunicipio int,
    nomMunicipio varchar(60),
    departamento int
);
create table barrios(
    codBarrio int,
    nomBarrio varchar(60),
    comBarrio int,
    tipBarrio varchar(60),
    municipio int
);
create table diagnosticos(
    codDiagnostico int,
    nomDiagnostico varchar(60)
);
create table epss(
    codEps int,
    nomEps varchar(60)
);
create table usuarios(
    idUsuario int,
    nomUsuario varchar(60),
    sexUsuario char(1),
    edaUsuario int,
    fecUsuario date,
    celUsuario int,
    emailUsuario varchar(60),
    rhUsuario char(4),
    regUsuario varchar(60),
    barrio int,
    eps int,
    diagnostico int
);

create table profesionales(
    tarjProfesional int,
    cedProfesional int,
    nomProfesional varchar(60),
    sexProfesional char(1),
    edaProfesional int,
    fecProfesional date,
    celProfesional int,
    emailProfesional varchar(60),
    barrio int,
    especialidad int
);

create table especialidades(
    codEspecialidad int,
    nomEspecialidad varchar(60)
);

create table citas(
    codCita int,
    tipCita varchar(60),
    diaCita date,
    horCita time,
    estCita varchar(60),
    modCita date,
    obsCita varchar(60),
    profesional int,
    usuario int,
    especialidad int
);
-----------------------------------------------------
--definicion de llaves primarias alterando las tablas
alter table paises add primary key(codPais);
alter table departamentos add primary key(codDepartamento);
alter table municipios add primary key(codMunicipio);
alter table barrios add primary key(codBarrio);
alter table diagnosticos add primary key(codDiagnostico);
alter table epss add primary key(codEps);
alter table usuarios add primary key(idUsuario);
alter table profesionales add primary key(tarjProfesional);
alter table especialidades add primary key(codEspecialidad);
alter table citas add primary key(codCita);
-----------------------------------------------------
--definicion de llaves foraneas alterando las tablas
--departamentos
alter table departamentos add foreign key(pais) references paises(codPais);
--municipios
alter table municipios add foreign key(departamento) references departamentos(codDepartamento);
--barrios
alter table barrios add foreign key(municipio) references municipios(codMunicipio);
--usuarios
alter table usuarios add foreign key(barrio) references barrios(codBarrio);
alter table usuarios add foreign key(eps) references epss(codEps);
alter table usuarios add foreign key(diagnostico) references diagnosticos(codDiagnostico);
--profesionales
alter table profesionales add foreign key(barrio) references barrios(codBarrio);
alter table profesionales add foreign key(especialidad) references especialidades(codEspecialidad);
--citas
alter table citas add foreign key(profesional) references profesionales(tarjProfesional);
alter table citas add foreign key(usuario) references usuarios(idUsuario);
alter table citas add foreign key(especialidad) references especialidades(codEspecialidad);
--------------------------------
--Creacion de llaves candidatas
--paises
alter table paises add constraint ck_nomPais unique(nomPais);
--departamentos
alter table departamentos add constraint ck_nomDepartamento unique(nomDepartamento);
--municipios
alter table municipios add constraint ck_nomMunicipio unique(nomMunicipio);
--barrios
alter table barrios add constraint ck_nomBarrio unique(nomBarrio);
--diagnosticos
alter table diagnosticos add constraint ck_nomDiagnostico unique(nomDiagnostico);
--epss
alter table epss add constraint ck_nomEps unique(nomEps);
--usuarios
alter table usuarios add constraint ck_nomUsuario unique(nomUsuario);
alter table usuarios add constraint ck_celUsuario unique(celUsuario);
alter table usuarios add constraint ck_emailUsuario unique(emailUsuario);
--profesionales
alter table profesionales add constraint ck_cedProfesional unique(cedProfesional);
alter table profesionales add constraint ck_nomProfesional unique(nomProfesional);
alter table profesionales add constraint ck_celProfesional unique(celProfesional);
alter table profesionales add constraint ck_emailProfesional unique(emailProfesional);
--especialidades
alter table especialidades add constraint ck_nomEspecialidad unique(nomEspecialidad);
--DEFINICION DE MODIFICADORES--not null--default <valor>
--paises
alter table paises alter codPais set not null;
alter table paises alter nomPais set not null;
--departamentos
alter table departamentos alter codDepartamento set not null;
alter table departamentos alter nomDepartamento set not null;
--municipios
alter table municipios alter codMunicipio set not null;
alter table municipios alter nomMunicipio set not null;
--barrios
alter table barrios alter codBarrio set not null;
alter table barrios alter nomBarrio set not null;
--diagnosticos
alter table diagnosticos alter codDiagnostico set not null;
alter table diagnosticos alter nomDiagnostico set not null;
--epss
alter table epss alter codEps set not null;
alter table epss alter nomEps set not null;
--usuarios
alter table usuarios alter idUsuario set not null;
alter table usuarios alter nomUsuario set not null;
alter table usuarios alter fecUsuario set not null;
alter table usuarios alter celUsuario set not null;
alter table usuarios alter rhUsuario set not null;
--profesionales
alter table profesionales alter tarjProfesional set not null;
alter table profesionales alter cedProfesional set not null;
alter table profesionales alter nomProfesional set not null;
alter table profesionales alter fecProfesional set not null;
alter table profesionales alter celProfesional set not null;
--especialidades
alter table especialidades alter codEspecialidad set not null;
alter table especialidades alter nomEspecialidad set not null;
--citas
alter table citas alter codCita set not null;
alter table citas alter tipCita set not null;
alter table citas alter diaCita set not null;
alter table citas alter horCita set not null;
--DEFINICION DE CHECKS
--tabla paises
alter table paises add check(codPais>0);
--tabla departamentos
alter table departamentos add check(codDepartamento>0);
--tabla municipios
alter table municipios add check(codMunicipio>0);
--tabla usuarios
alter table usuarios add check(idUsuario>0);
--check de genero
alter table usuarios add check(sexUsuario='M' or sexUsuario='F');
--check de sangre
alter table usuarios add check(rhUsuario="A+" or rhUsuario="A-" or rhUsuario="B+" or rhUsuario="B-"
or rhUsuario="AB+" or rhUsuario="AB-" or rhUsuario="O+" or rhUsuario="O-"  );
--check de regimen
alter table usuarios add check(regUsuario="contributivo" or regUsuario ="subsidiado");
--
alter table usuarios add check(fecUsuario<=CURRENT_DATE);
alter table usuarios add check(celUsuario>0);
--tabla profesionales
--
alter table profesionales add check(tarjProfesional>0);
alter table profesionales add check(cedProfesional>0);
alter table profesionales add check(edaProfesional>=18);
alter table profesionales add check(fecProfesional<CURRENT_DATE);
alter table profesionales add check(celProfesional>0);
--check de genero
alter table profesionales add check(sexProfesional='M' or sexProfesional='F');
--tabla barrios
alter table barrios add check(tipBarrio="rural" or tipBarrio="urbano");
alter table barrios add check(codBarrio>0);
alter table barrios add check(comBarrio>0);
--tabla diagnosticos
alter table diagnosticos add check(codDiagnostico>0);
--tabla epss
alter table epss add check(codEps>0);
--tabla citas
alter table citas add check(codCita>0);
alter table citas add check(tipCita="primera vez" or tipCita="control");
alter table citas add check(estCita="modificada" or estCita="cancelada" or estCita="en curso");
alter table citas add check(diaCita>=CURRENT_DATE);
alter table citas add check(modCita>CURRENT_DATE);
--tabla especialidades
alter table especialidades add check(codEspecialidad>0);
----------------------------------------
--creacion de indices unicos en LLAVES PRIMARIAS Y LLAVES CANDIDATAS
-- indices unicos sencillos 
--tabla paises
create unique index idx_codPais on paises(codPais);
create unique index idx_nomPais on paises(nomPais);
--tabla departamentos
create unique index idx_codDepartamento on departamentos(codDepartamento);
create unique index idx_nomDepartamento on departamentos(nomDepartamento);
--tabla municipios
create unique index idx_codMunicipio on municipios(codMunicipio);
create unique index idx_nomMunicipio on municipios(nomMunicipio);
--tabla barrios
create unique index idx_codBarrio on barrios(codBarrio);
create unique index idx_nomBarrio on barrios(nomBarrio);
--tabla diagnosticos
create unique index idx_codDiagnostico on diagnosticos(codDiagnostico);
create unique index idx_nomDiagnostico on diagnosticos(nomDiagnostico);
--tabla epss
create unique index idx_codEps on epss(codEps);
create unique index idx_nomEps on epss(nomEps);
--tabla usuarios
create unique index idx_cedUsuario on usuarios(codUsuario);
create unique index idx_nomUsuario on usuarios(nomUsuario);
create unique index idx_celUsuario on usuarios(celUsuario);
create unique index idx_emailUsuario on usuarios(emailUsuario);
--tabla profesionales
create unique index idx_tarjProfesional on profesionales(tarjProfesional);
create unique index idx_cedProfesional on profesionales(cedProfesional);
create unique index idx_nomProfesional on profesionales(nomProfesional);
create unique index idx_celProfesional on profesionales(celProfesional);
create unique index idx_emailProfesional on profesionales(emailProfesional);
--tabla especialidades
create unique index idx_codEspecialidad on especialidades(codEspecialidad);
create unique index idx_nomEspecialidad on especialidades(nomEspecialidad);
--tabla citas
--tabla epss
create unique index codCita on citas(codCita);
--CREACION DE INDICES REGULARES
--Son aquellos cuyos valores de los atributos que los crean se repiten
--tabla departamentos
create index idx_paises_codpais on departamentos(pais);
--tabla municipios
create index idx_departamentos_coddepartamento on municipios(departamento);
--tabla barrios
create index idx_municipios_codmunicipio on barrios(municipio);
--tabla usuarios
create index idx_usuarios_barrios_codbarrio on usuarios(barrio);
create index idx_epss_codeps on usuarios(eps);
create index idx_diagnostricos_coddiagnostico on usuarios(diagnostico);
--tabla profesionales
create index idx_profesionales_barrios_codbarrio on profesionales(barrio);
create index idx_profesionales_especialidades_codespecialidad on profesionales(especialidad);
--tabla citas
create index idx_profesionales_codprofesional on citas(profesional);
create index idx_usuarios_codusuario citas(usuario);
create index idx_citas_especialidades_codespecialidad citas(especialidad);
/*
--orden poblamiento datos
--1.tabla paises
copy paises from 'D:\backup\comercial\paises.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--2.tabla departamentos
copy departamentos from 'D:\backup\comercial\departamentos.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8'); 
--3.tabla municipios
copy ciudades from 'D:\backup\comercial\ciudades.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8'); 
--4.tabla barrios
copy barrios from 'D:\backup\comercial\barrios.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--5.tabla diagnosticos
copy lineadeproductos from 'D:\backup\comercial\lineadeproductos.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--6.tabla epss
copy cargos from 'D:\backup\comercial\cargos.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--7.tabla especialidades
copy fabricantes from 'D:\backup\comercial\fabricantes.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--8.tabla profesionales
copy clientes from 'D:\backup\comercial\clientes.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--9.tabla usuarios
copy vendedores from 'D:\backup\comercial\vendedores.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
--10.tabla citas
copy ventas from 'D:\backup\comercial\ventas.csv' with
(delimiter ';',header,format 'csv',encoding 'UTF-8');
*/