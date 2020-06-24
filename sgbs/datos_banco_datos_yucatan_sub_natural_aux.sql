--Esta sección es para el componente natural usv
--Borrando todos los datos de estados para correr el archivo sql
DELETE FROM development.bd_usv_c2_mun;
--Ingresando información de la tabla \sub_natural\bd_usv_c2_mun.csv en development.bd_usv_c2_mun
--La siguiente instrucción se debe correr como superuser
COPY development.bd_usv_c2_mun
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_natural/bd_usv_c2_mun.csv'
WITH DELIMITER ',' CSV HEADER;

--Se colocan correctamente las claves de municipios
UPDATE development.bd_usv_c2_mun SET cve_mun = RIGHT('00'||bd_usv_c2_mun.cve_mun,3);

--Se colocan correctamente las claves cve_geo
UPDATE development.bd_usv_c2_mun SET cve_geo = CONCAT(cve_ent,cve_mun);

--Se borran los espacios en blanco del final de region
UPDATE development.bd_usv_c2_mun SET region=rtrim(region);

--Esta sección es para el componente natural anp
--Borrando todos los datos de estados para correr el archivo sql
DELETE FROM development.bd_anp_c2_mun;
--Ingresando información de la tabla \sub_natural\bd_anp_c2_mun.csv en development.bd_anp_c2_mun
--La siguiente instrucción se debe correr como superuser
COPY development.bd_anp_c2_mun
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_natural/bd_anp_c2_mun.csv'
WITH DELIMITER ',' CSV HEADER;

--Se colocan correctamente las claves de municipios
UPDATE development.bd_anp_c2_mun SET cve_mun = RIGHT('00'||bd_anp_c2_mun.cve_mun,3);

--Se colocan correctamente las claves cve_geo
UPDATE development.bd_anp_c2_mun SET cve_geo = CONCAT(cve_ent,cve_mun);

--Se borran los espacios en blanco del final de region
UPDATE development.bd_anp_c2_mun SET region=rtrim(region);

--Esta sección es para el componente natural deg
--Borrando todos los datos de estados para correr el archivo sql
DELETE FROM development.bd_deg_c2_mun;
--Ingresando información de la tabla \sub_natural\bd_deg_c2_mun.csv en development.bd_deg_c2_mun
--La siguiente instrucción se debe correr como superuser
COPY development.bd_deg_c2_mun
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_natural/bd_deg_c2_mun.csv'
WITH DELIMITER ',' CSV HEADER;

--Se colocan correctamente las claves de municipios
UPDATE development.bd_deg_c2_mun SET cve_mun = RIGHT('00'||bd_deg_c2_mun.cve_mun,3);

--Se colocan correctamente las claves cve_geo
UPDATE development.bd_deg_c2_mun SET cve_geo = CONCAT(cve_ent,cve_mun);

--Se borran los espacios en blanco del final de region
UPDATE development.bd_deg_c2_mun SET region=rtrim(region);