
--tabla hecha
CREATE TABLE departamentos (
  cod_depto int PRIMARY KEY NOT NULL,
  nom_depto varchar(50)
);

create unique index idx_cod_depto on departamentos(cod_depto);
create unique index idx_nom_depto on departamentos(nom_depto);

--tabla hecha
CREATE TABLE municipios (
  cod_municipio int PRIMARY KEY NOT NULL,
  nom_municipio varchar(50) NOT NULL,
  departamentos_cod_depto int NOT NULL,
  FOREIGN KEY (departamentos_cod_depto) REFERENCES departamentos(cod_depto)
);

create unique index idx_cod_municipio on municipios(cod_municipio);
create unique index idx_nom_municipio on municipios(nom_municipio);

--tabla hecha
CREATE TABLE colegios (
  cod_cole_icfes int PRIMARY KEY NOT NULL,
  municipios_cod_municipio int NOT NULL,
  cole_cod_dane_colegio bigint NOT NULL,
  cole_dane_establecimiento varchar(100) NOT NULL,
  cole_cod_dane_sede bigint NOT NULL, --unique
  cole_dane_nom_sede varchar(100) NOT NULL,
  cole_dane_sede_princ char NOT NULL,----
  cole_genero varchar(25) NOT NULL,
  cole_naturaleza varchar(30) NOT NULL,
  cole_calendario char NOT NULL,--
  cole_bilingue char,----
  cole_caracter varchar(50),
  cole_area_ubic varchar(50),-------
  cole_jornada varchar(30) NOT NULL,
  foreign key(municipios_cod_municipio) references municipios(cod_municipio)
);

--tabla hecha
CREATE TABLE estudiantes (
  id_estudiante varchar(16) PRIMARY KEY NOT NULL,
  estu_mcpio_presen int NOT NULL,
  estu_mcpio_reside int NOT NULL,
  colegios_cod_cole_icfes int NOT NULL,
  estu_nacion varchar(10) NOT NULL,
  estu_genero varchar(1) NOT NULL,
  estu_fecha_nac date NOT NULL,
  estu_tipodoc varchar(2) NOT NULL,
  estu_es_estudiante char(15) NOT NULL,
  estu_pais_reside varchar(10) NOT NULL,
  estu_tiene_etnia varchar(2) NOT NULL,
  estu_etnia varchar(50),
  estu_limita_motriz char,
  estu_privado_lib char,
  estu_nse_establecimiento int, 
  estu_inse_individual double precision,
  estu_estado_inv varchar(30) NOT NULL,
  estu_generacione varchar(50) NOT NULL,
  estu_lectura_diaria varchar(50),
  estu_dedica_internet varchar(50),
  estu_horas_semanatrab varchar(50),
  estu_tipo_remun varchar(50),
  foreign key(colegios_cod_cole_icfes) references colegios(cod_cole_icfes),
  foreign key(estu_mcpio_reside) references municipios(cod_municipio),
  foreign key(estu_mcpio_presen) references municipios(cod_municipio)
);

create unique index idx_id_estudiante on estudiantes(id_estudiante);


CREATE TABLE familias (
  estudiantes_id_estudiante varchar(16) NOT NULL,
  fami_est_vivienda varchar(10),
  fami_pers_hogar varchar(5) NOT NULL,
  fami_cuartos_hogar varchar(10) NOT NULL,
  fami_situ_eco varchar(5) NOT NULL,
  fami_come_leche_deriv varchar(30) NOT NULL,
  fami_come_carne_pesc_huev varchar(30) NOT NULL,
  fami_come_cereal_frut_legumb varchar(30) NOT NULL,
  fami_edu_padre varchar(50) NOT NULL,
  fami_edu_madre varchar(50) NOT NULL,
  fami_trabajo_padre varchar(100) NOT NULL,
  fami_trabajo_madre varchar(100) NOT NULL,
  fami_tiene_internet varchar(2) NOT NULL,
  fami_tiene_serv_tv varchar(2) NOT NULL,
  fami_tiene_computador varchar(2) NOT NULL,
  fami_tiene_lavadora varchar(2) NOT NULL,
  fami_tiene_hornomic varchar(2) NOT NULL,
  fami_tiene_automovil varchar(2) NOT NULL,
  fami_tiene_moto varchar(2) NOT NULL,
  fami_tiene_consolavideo varchar(2) NOT NULL,
  fami_tiene_num_libros varchar(15) NOT NULL,
  foreign key(estudiantes_id_estudiante) references estudiantes(id_estudiante)
);

--tabla ya hecha
CREATE TABLE materias_estadisticas (
  estudiantes_id_estudiante varchar(16) NOT NULL,
  punt_lecturacrit INTEGER NOT NULL,
  percent_lecturacrit INTEGER NOT NULL,
  desemp_lecturacrit INTEGER NOT NULL,
  punt_matematicas INTEGER NOT NULL,
  percent_matematicas INTEGER NOT NULL,
  desemp_matematicas INTEGER NOT NULL,
  punt_cnaturales INTEGER NOT NULL,
  percent_cnaturales INTEGER NOT NULL,
  desemp_cnaturales INTEGER NOT NULL,
  punt_soyciu INTEGER NOT NULL,
  percent_soyciu INTEGER NOT NULL,
  desemp_soyciu INTEGER NOT NULL,
  punt_ingles INTEGER NOT NULL,
  percent_ingles INTEGER NOT NULL,
  desemp_ingles INTEGER NOT NULL,
  punt_global INTEGER NOT NULL,
  percent_global INTEGER NOT NULL,
  foreign key(estudiantes_id_estudiante) references estudiantes(id_estudiante)
);

create unique index idx_estudiantes_id_estudiante on materias_estadisticas(estudiantes_id_estudiante);

--definicion de llaves primarias alterando las tablas
-- YA HECHA 

/*

drop table FAMILIAS;
drop table materias_estadisticas;
drop table estudiantes;
drop table colegios;
drop table municipios;
drop table departamentos;

*/

/* cast( as int)  */