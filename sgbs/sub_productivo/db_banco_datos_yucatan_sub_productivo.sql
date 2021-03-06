/*
  ##############
  Crea el schema
  ##############
*/

CREATE SCHEMA IF NOT EXISTS sub_productivo;

/*
  ###################################################
  Creamos los catálogos del componente sub_productivo
  ###################################################
*/

-- Catálogo de sector de actividad económica del SCIAN (Sistema de Clasificación Industrial para América del Norte)

CREATE TABLE IF NOT EXISTS sub_productivo.ct_sectores(
    sector VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(40) NOT NULL
);

-- Catálogo de subsector de actividad económica del SCIAN (Sistema de Clasificación Industrial para América del Norte)

CREATE TABLE IF NOT EXISTS sub_productivo.ct_subsectores(
    act_ec_sub_cod CHAR(2) PRIMARY KEY,
    subsector VARCHAR(160) NOT NULL
);

-- Catálogo de rama de actividad económica del SCIAN (Sistema de Clasificación Industrial para América del Norte)
CREATE TABLE IF NOT EXISTS sub_productivo.ct_ramas(
    act_ec_cod CHAR(4) PRIMARY KEY,
    rama VARCHAR(130) NOT NULL,
    act_ec_sub_cod CHAR(2) NOT NULL REFERENCES sub_productivo.ct_subsectores(act_ec_sub_cod)
);

-- Catalogo necesario para el archivo bd_coef_esp.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_coef_esp(
    ce_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(130) NOT NULL
);

-- Catalogo necesario para el archivo bd_coef_tec.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_coef_tec(
    ct_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(240) NOT NULL
);

-- Catalogo necesario para el archivo bd_conc_indust.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_conc_indust(
    ci_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Catalogo necesario para el archivo bd_denue_yuc_rama_wide.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_denue(
    denue_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(60) NOT NULL
);

-- Catalogo necesario para los archivos bd_mat_tc_*.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_mat_tc(
    mt_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(70) NOT NULL
);

-- Catalogo necesario para el archivo bd_pib_yucatan.xlsx.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_pib(
    pib_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(120) NOT NULL
);

-- Catalogo necesario para el archivo bd_yuc_porcentajes_act_ec_muni.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_act_ec_valores(
    valor_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

-- Catalogo necesario para el archivo bd_yuc_porcentajes_act_ec_muni.csv
CREATE TABLE IF NOT EXISTS sub_productivo.ct_act_ec_cantidades(
    cantidad_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(30) NOT NULL
);

/*
  ############################################
  Creamos las tablas del componente sub_productivo
  ############################################
*/

-- Tabla de principal rama de actividad económica del municipio

CREATE TABLE IF NOT EXISTS sub_productivo.ramas_municipios(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_coef_esp.csv
CREATE TABLE IF NOT EXISTS sub_productivo.coef_esp(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    coeficiente NUMERIC(10,6) NOT NULL,
    ce_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_coef_esp(ce_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_coef_tec.csv
CREATE TABLE IF NOT EXISTS sub_productivo.coef_tec(
    sector VARCHAR(10) NOT NULL REFERENCES sub_productivo.ct_sectores(sector),
    coeficiente NUMERIC(5,4) NOT NULL,
    ct_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_coef_tec(ct_id)
);

-- Tabla que guarda información del bd_conc_indust.csv
CREATE TABLE IF NOT EXISTS sub_productivo.conc_indust(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    cantidad NUMERIC(9,6) NOT NULL,
    ci_id SMALLINT REFERENCES sub_productivo.ct_conc_indust(ci_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_denue_yuc_rama_wide.csv
CREATE TABLE IF NOT EXISTS sub_productivo.denue(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    ue INTEGER NOT NULL,
    denue_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_denue(denue_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_mat_tc_muni.csv
CREATE TABLE IF NOT EXISTS sub_productivo.mat_tc_muni(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    tasa NUMERIC(10,6) NOT NULL,
    mt_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_mat_tc(mt_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_mat_tc_muni_rama.csv
CREATE TABLE IF NOT EXISTS sub_productivo.mat_tc_muni_rama(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    tasa NUMERIC(10,6) NOT NULL,
    mt_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_mat_tc(mt_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_mat_tc_muni_subsector.csv
CREATE TABLE IF NOT EXISTS sub_productivo.mat_tc_muni_subsector(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_sub_cod CHAR(2) NOT NULL REFERENCES sub_productivo.ct_subsectores(act_ec_sub_cod),
    tasa NUMERIC(10,6) NOT NULL,
    mt_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_mat_tc(mt_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tabla que guarda información del archivo bd_mat_tc_rama.csv
CREATE TABLE IF NOT EXISTS sub_productivo.mat_tc_rama(
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    serie SMALLINT NOT NULL,
    tasa NUMERIC(10,6) NOT NULL,
    mt_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_mat_tc(mt_id)
);

-- Tabla que guarda información del archivo bd_mat_tc_subsector.csv
CREATE TABLE IF NOT EXISTS sub_productivo.mat_tc_subsector(
    act_ec_sub_cod CHAR(2) NOT NULL REFERENCES sub_productivo.ct_subsectores(act_ec_sub_cod),
    serie SMALLINT NOT NULL,
    tasa NUMERIC(10,6) NOT NULL,
    mt_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_mat_tc(mt_id)
);

-- Tabla que guarda información del archivo bd_pib_yucatan.csv
CREATE TABLE IF NOT EXISTS sub_productivo.pib(
    serie SMALLINT NOT NULL,
    millones_pesos NUMERIC(9,3) NOT NULL,
    pib_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_pib(pib_id)
);

-- Tablas que guardan información de las dos primeras columnas del archivo bd_yuc_porcentajes_act_ec_muni.csv
CREATE TABLE IF NOT EXISTS sub_productivo.act_ec_valores(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    millones_pesos NUMERIC(8,3) NOT NULL,
    valor_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_act_ec_valores(valor_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);

-- Tablas que guardan información de las dos últimas columnas del archivo bd_yuc_porcentajes_act_ec_muni.csv
CREATE TABLE IF NOT EXISTS sub_productivo.act_ec_cantidades(
    cve_ent CHAR(2) NOT NULL,
    cve_mun CHAR(3) NOT NULL,
    serie SMALLINT NOT NULL,
    act_ec_cod CHAR(4) NOT NULL REFERENCES sub_productivo.ct_ramas(act_ec_cod),
    cantidad INTEGER NOT NULL,
    cantidad_id SMALLINT NOT NULL REFERENCES sub_productivo.ct_act_ec_cantidades(cantidad_id),
    FOREIGN KEY (cve_ent, cve_mun) REFERENCES general.ct_municipios
);