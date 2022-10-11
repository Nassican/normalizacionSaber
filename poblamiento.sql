-- POBLAMIENTO
--POBLAMIENTO DEPARTAMENTOS
insert into
  departamentos(cod_depto, nom_depto)
select
  distinct cast(estu_cod_reside_depto as int),
  estu_depto_reside
from
  sbr11_narino_182
order by
  1 asc;

--select * from departamentos
-- POBLAMIENTO MUNICIPIOS
insert into
  municipios(
    cod_municipio,
    nom_municipio,
    departamentos_cod_depto
  )
select
  distinct cast(estu_cod_reside_mcpio as int),
  estu_mcpio_reside,
  departamentos.cod_depto
from
  sbr11_narino_182
  join departamentos on cod_depto = cast(estu_cod_reside_depto as int)
order by
  1 asc;

--select * from departamentos
-- POBLAMIENTO COLEGIOS
insert into
  colegios(
    cod_cole_icfes,
    municipios_cod_municipio,
    cole_dane_establecimiento,
    cole_genero,
    cole_naturaleza,
    cole_calendario,
    cole_bilingue,
    cole_caracter,
    cole_area_ubic,
    cole_jornada,
    cole_cod_dane_colegio,
    cole_cod_dane_sede,
    cole_dane_nom_sede,
    cole_dane_sede_princ
  )
select
  distinct cast(COLE_CODIGO_ICFES as int),
  cast(COLE_COD_MCPIO_UBICACION as int),
  COLE_NOMBRE_ESTABLECIMIENTO,
  COLE_GENERO,
  COLE_NATURALEZA,
  COLE_CALENDARIO,
  COLE_BILINGUE,
  COLE_CARACTER,
  COLE_AREA_UBICACION,
  COLE_JORNADA,
  cast(COLE_COD_DANE_ESTABLECIMIENTO as bigint),
  cast(COLE_COD_DANE_SEDE as bigint),
  COLE_NOMBRE_SEDE,
  COLE_SEDE_PRINCIPAL
from
  sbr11_narino_182
  join municipios on cod_municipio = cast(cole_cod_mcpio_ubicacion as int)
order by
  3 
  
  --select * from colegios order by 4
  --- POBLAMIENTO ESTUDIANTES
insert into
  estudiantes(
    id_estudiante,
    estu_mcpio_reside,
    estu_mcpio_presen,
    colegios_cod_cole_icfes,
    estu_nacion,
    estu_genero,
    estu_fecha_nac,
    estu_tipodoc,
    estu_es_estudiante,
    estu_pais_reside,
    estu_tiene_etnia,
    estu_etnia,
    estu_limita_motriz,
    estu_privado_lib,
    estu_nse_establecimiento,
    estu_inse_individual,
    estu_estado_inv,
    estu_generacione,
    estu_lectura_diaria,
    estu_dedica_internet,
    estu_horas_semanatrab,
    estu_tipo_remun
  )
select
  ESTU_CONSECUTIVO,
  cast(ESTU_COD_RESIDE_MCPIO as int),
  cast(ESTU_COD_MCPIO_PRESENTACION as int),
  cast(COLE_CODIGO_ICFES as int),
  ESTU_NACIONALIDAD,
  ESTU_GENERO,
  cast(ESTU_FECHANACIMIENTO as date),
  ESTU_TIPODOCUMENTO,
  ESTU_ESTUDIANTE,
  ESTU_PAIS_RESIDE,
  ESTU_TIENEETNIA,
  ESTU_ETNIA,
  ESTU_LIMITA_MOTRIZ,
  ESTU_PRIVADO_LIBERTAD,
  cast(ESTU_NSE_ESTABLECIMIENTO as int),
  cast(ESTU_INSE_INDIVIDUAL as DOUBLE PRECISION),
  ESTU_ESTADOINVESTIGACION,
  ESTU_GENERACIONE,
  ESTU_DEDICACIONLECTURADIARIA,
  ESTU_DEDICACIONINTERNET,
  ESTU_HORASSEMANATRABAJA,
  ESTU_TIPOREMUNERACION
from
  sbr11_narino_182
  join municipios on (cod_municipio = cast(ESTU_COD_RESIDE_MCPIO as int))
  and (
    cast(ESTU_COD_MCPIO_PRESENTACION as int) = cod_municipio
  )
  join colegios on cod_cole_icfes = cast(COLE_CODIGO_ICFES as int)
limit
  1000

--select * from estudiantes order by 1
  /* cast( as int)  */