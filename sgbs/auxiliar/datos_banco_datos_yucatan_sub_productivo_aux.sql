/*
*****************************************
Importamos los csv a nuestras tablas
*****************************************
*/

-- Importamos el csv al catálogo de rama de actividad económica del SCIAN (Sistema de Clasificación Industrial para América del Norte)

DELETE FROM auxiliar.tb_rama;
COPY auxiliar.tb_rama (act_ec_cod,rama)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/catalogos/ct_rama.csv'
WITH CSV HEADER;

-- Importamos el csv al catálogo de subsector de actividad económica del SCIAN (Sistema de Clasificación Industrial para América del Norte)

DELETE FROM auxiliar.tb_sector;
COPY auxiliar.tb_sector (sector,descripcion)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/catalogos/ct_sector.csv'
WITH CSV HEADER;

-- Importamos el csv al catálogo de sector de actividad económica del SCIAN (Sistema de Clasificación Industrial para América del Norte)

DELETE FROM auxiliar.tb_subsector;
COPY auxiliar.tb_subsector(act_ec_sub_cod,subsector)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/catalogos/ct_subsector.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de principal rama de actividad económica del municipio

DELETE FROM auxiliar.bd_activ_ec_principal;
COPY auxiliar.bd_activ_ec_principal(serie, cve_mun, act_ec_cod)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_activ_ec_principal.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Coeficientes de especialización

DELETE FROM auxiliar.bd_coef_esp;
COPY auxiliar.bd_coef_esp (serie,cve_mun,act_ec_cod,ce_pbt,ce_per_ocup)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_coef_esp.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de  Coeficientes técnicos

DELETE FROM auxiliar.bd_coef_tec;
COPY auxiliar.bd_coef_tec(sector,agr_pesca_coef,mineria_coef,en_elec_coef,construc_coef,manufac_coef,comercio_coef,trans_cor_coef,med_masiv_coef,s_finan_coef,s_inmob_coef,s_prof_coef,corporat_coef,s_ap_neg_coef,s_educ_coef,s_salud_coef,s_espar_coef,s_aloj_alm_coef,ot_serv_coef,act_gub_coef)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_coef_tec.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Concentración Industrial

DELETE FROM auxiliar.bd_conc_indust;
COPY auxiliar.bd_conc_indust (serie,cve_mun,concen_ind)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_conc_indust.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Cantidad de unidades económicas que operan con distintas cantidades de trabajadores por rama de actividad económica por municipio

DELETE FROM auxiliar.bd_denue_yuc_rama;
COPY auxiliar.bd_denue_yuc_rama (cve_mun,serie,act_ec_cod,de_0_a_5_personas,de_6_a_10_personas,de_11_a_30_personas,de_31_a_50_personas,de_51_a_100_personas,de_101_a_250_personas,de_250_y_mas_personas)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_denue_yuc_rama_wide.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Tasa de crecimiento de la inversión, personal ocupado,producción fija bruta y unidades económicas del municipio para 2009 y 2014.

DELETE FROM auxiliar.bd_mat_tc_muni;
COPY auxiliar.bd_mat_tc_muni (cve_mun,serie,tc_inv_total_mun,tc_per_ocupado_mun,tc_prod_brut_tot_mun,tc_ue_mun)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_mat_tc_muni.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Tasa de crecimiento de inversión, personal ocupado,producción fija bruta y unidades económicas de cada rama de actividad económica dentro del total municipal para 2009 y 2014.

DELETE FROM auxiliar.bd_mat_tc_muni_rama;
COPY auxiliar.bd_mat_tc_muni_rama (cve_mun,serie,act_ec_cod,tc_inv_total,tc_per_ocupado,tc_prod_brut_tot,tc_ue)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_mat_tc_muni_rama.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Tasa de crecimiento de inversión, personal ocupado,producción fija bruta y unidades económicas de cada subsector de actividad económica dentro del total municipal para 2009 y 2014.

DELETE FROM auxiliar.bd_mat_tc_muni_subsector;
COPY auxiliar.bd_mat_tc_muni_subsector (cve_mun,serie,act_ec_sub_cod,tc_inv_total_mun_subsector,tc_per_ocupado_mun_subsector,tc_prod_brut_tot_mun_subsector,tc_ue_mun_subsector)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_mat_tc_muni_subsector.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Tasa de crecimiento de inversión, personal ocupado,producción fija bruta y unidades económicas por rama de actividad económica para 2009 y 2014.

DELETE FROM auxiliar.bd_mat_tc_rama;
COPY auxiliar.bd_mat_tc_rama (act_ec_cod,serie,tc_inv_total_rama,tc_per_ocupado_rama,tc_prod_brut_tot_rama,tc_ue_rama)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_mat_tc_rama.csv'
WITH CSV HEADER;
UPDATE auxiliar.bd_mat_tc_rama SET tc_inv_total_rama = 'NaN'
WHERE tc_inv_total_rama = 'inf';

-- Importamos el csv a la Tabla de Tasa de crecimiento de inversión, personal ocupado,producción fija bruta y unidades económicas por subsector de actividad económica para 2009 y 2014.

DELETE FROM auxiliar.bd_mat_tc_subsector;
COPY auxiliar.bd_mat_tc_subsector (act_ec_sub_cod,serie,tc_inv_total_subsector,tc_per_ocupado_subsector,tc_prod_brut_tot_subsector,tc_ue_subsector)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_mat_tc_subsector.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Producto Interno Bruto anual total y por sectores del estado de Yucatán

DELETE FROM auxiliar.bd_pib_yucatan;
COPY auxiliar.bd_pib_yucatan (serie,pib_total,pib_prim,pib_sec,pib_ter,tc_anual)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_pib_yucatan.csv'
WITH CSV HEADER;

-- Importamos el csv a la Tabla de Participación de cada rama de actividad económica en el total municipal de la inversión, personal ocupado,producción fija bruta y unidades económicas para 2004, 2009 y 2014.

DELETE FROM auxiliar.bd_yuc_porcentajes_act_ec_muni;
COPY auxiliar.bd_yuc_porcentajes_act_ec_muni (cve_mun,serie,ct_rama_act_ec_cod,prod_brut_tot_valor,inv_total_valor,per_ocupado_valor,ue_valor,prod_brut_tot_porcen,inv_total_porcen,per_ocupado_porcen,ue_porcen)
FROM '/mnt/c/Dropbox (LANCIS)/FOMIX/fmx_insumos/fmx_estadisticas/banco_datos/procesamiento/sub_productivo/finales/csv/tablas/bd_yuc_porcentajes_act_ec_muni_wide.csv'
WITH CSV HEADER;