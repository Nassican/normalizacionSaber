
--tabla hecha
CREATE TABLE departamentos (
  cod_depto int,
  nom_depto char(15),
);

--tabla hecha
CREATE TABLE municipios (
  cod_municipio int,
  nom_municipio char(15),
  departamentos_cod_depto int
);

--tabla hecha
CREATE TABLE colegios (
  cod_cole_icfes int,
  departamentos_cod_depto int,
  municipios_cod_municipio int,
  dane_est char(100),
  cole_genero ,
  cole_naturaleza ,
  cole_calendario ,
  cole_bilingue ,
  cole_caracter ,
  cole_area_ubic ,
  cole_jornada ,
  cole_mcpio_ubic ,
  cole_depto_ubic ,
  cod_dane_colegio int,
  cod_dane_sede , --unique
  cole_dane_nom_sede , --unique
  cole_dane_sede_princ BOOL,
);

--tabla hecha
CREATE TABLE estudiantes (
  id_estudiante varchar(16),
  familias_id_familia int,
  departamentos_cod_depto int,
  municipios_cod_municipio int,
  colegios_cod_cole_icfes int,
  estu_nacion char(10),
  estu_genero char(1),
  estu_fecha_nac date,
  estu_tipodoc char(2),
  estu_es_estudiante char(15),
  estu_pais_reside char(10),
  estu_tiene_etnia char(2),
  estu_etnia char(30),
  estu_limita_motriz char(1),
  estu_depto_reside int(2),
  estu_mcpio_reside int(5),
  estu_privado_lib ,
  estu_mcpio_presentacion , ---llave foranea
  estu_nse_establecimiento , 
  estu_inse_individual ,
  estu_estado_inv ,
  estu_generacione , ---notnull
  estu_lectura_diaria varchar(230),
  estu_dedica_internet varchar(20),
  estu_horas_semanatrab varchar(25),
  estu_tipo_remun char(20)
);


CREATE TABLE familias (
  id_familia int,
  fami_est_vivienda varchar(10),
  fami_pers_hogar varchar(5),
  fami_cuartos_hogar char(10),
  fami_situ_eco char(5),
  fami_come_leche_deriv char(30),
  fami_come_carne_pesc_huev char(30),
  fami_come_cereal_frut_legumb char(30),
  fami_edu_padre char(50),
  fami_edu_madre char(50),
  fami_trabajo_padre char(100),
  fami_trabajo_madre char(100),
  fami_tiene_internet char(2),
  fami_tiene_serv_tv char(2),
  fami_tiene_computador char(2),
  fami_tiene_lavadora char(2),
  fami_tiene_hornomic char(2),
  fami_tiene_automovil char(2),
  fami_tiene_moto char(2),
  fami_tiene_consolavideo char(2),
  fami_tiene_num_libros varchar(15)
);

--tabla ya hecha
CREATE TABLE materias_estadisticas (
  estudiantes_id_estudiante ,
  punt_lecturacrit INTEGER UNSIGNED NULL,
  percent_lecturacrit INTEGER UNSIGNED NULL,
  desemp_lecturacrit INTEGER UNSIGNED NULL,
  punt_matematicas INTEGER UNSIGNED NULL,
  percent_matematicas INTEGER UNSIGNED NULL,
  desemp_matematicas INTEGER UNSIGNED NULL,
  punt_cnaturales INTEGER UNSIGNED NULL,
  percent_cnaturales INTEGER UNSIGNED NULL,
  desemp_cnaturales INTEGER UNSIGNED NULL,
  punt_soyciu INTEGER UNSIGNED NULL,
  percent_soyciu INTEGER UNSIGNED NULL,
  desemp_soyciu INTEGER UNSIGNED NULL,
  punt_ingles INTEGER UNSIGNED NULL,
  percent_ingles INTEGER UNSIGNED NULL,
  desemp_ingles INTEGER UNSIGNED NULL,
  punt_global INTEGER UNSIGNED NULL,
  percent_global INTEGER UNSIGNED NULL
);

--definicion de llaves primarias alterando las tablas
alter table departamentos add primary key(cod_depto);
alter table municipios add primary key(cod_municipio);
alter table colegios add primary key(cod_cole_icfes);
alter table estudiantes add primary key(id_estudiante);
alter table materias_estadisticas add primary key(); ---Aun no se como hacer esto 
alter table familias add primary key(id_familia);
-----------------------------------------------------
-----------------------------------------------------
--definicion de llaves foraneas alterando las tablas
--municipios
alter table municipios add foreign key(departamentos_cod_depto) references departamentos(cod_depto);
--colegios
alter table colegios add foreign key(departamentos_cod_depto) references departamentos(cod_depto);--talves se borre despues
alter table colegios add foreign key(municipios_cod_municipio) references municipios(cod_municipio);
--estudiantes
alter table estudiantes add foreign key(familias_id_familia) references familias(id_familia);
alter table estudiantes add foreign key(colegios_cod_cole_icfes) references colegios(cod_cole_icfes);
alter table estudiantes add foreign key(municipios_cod_municipio) references municipios(cod_municipio);
alter table estudiantes add foreign key(departamentos_cod_depto) references departamentos(cod_depto); --Talves se borre despues
alter table estudiantes add foreign key(municipios_cod_municipio_pres) references municipios(cod_municipio);
--materias-estadisticas
alter table materias_estadisticas add foreign key(estudiantes_id_estudiante) references estudiantes(id_estudiante);
--colegios
alter table colegios add foreign key(departamentos_cod_depto) references departamentos(cod_depto);
--------------------------------
--------------------------------
--Creacion de llaves candidatas
--departamentos
alter table departamentos add constraint ck_nom_depto unique(nom_depto);
--municipios
alter table municipios add constraint ck_nom_municipio unique(nom_municipio);
--colegios
alter table colegios add constraint ck_cod_dane_sede unique(cod_dane_sede);
alter table colegios add constraint ck_cole_dane_nom_sede unique(cole_dane_nom_sede);

-- ===========================
-- AUN CREO QUE PUEDEN FALTAR
-- Las llaves son candidatas son de datos que son unicos enla tabla
---------------------------------------
--DEFINICION DE MODIFICADORES--not null--default <valor> 
--departamentos
alter table departamentos alter cod_depto set not null;
alter table departamentos alter nom_depto set not null;
--municipios
alter table municipios alter cod_municipio set not null;
alter table municipios alter nom_municipio set not null;
--colegios
alter table colegios alter cod_cole_icfes set not null;
alter table colegios alter cod_dane_sede set not null;
alter table colegios alter cole_dane_nom_sede set not null;
alter table colegios alter cod_dane_colegio set not null;
--estudiantes
alter table estudiantes alter id_estudiante set not null;

id_estudiante
