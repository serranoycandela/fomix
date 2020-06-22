--Esta sección es la información que se usa de manera general
--Borrando todos los datos de estados para correr el archivo sql
DELETE FROM development.bd_usv_c2_mun;

--Se llena la información de las tablas;
--La siguiente instrucción se debe correr como superuser
COPY development.bd_usv_c2_mun
FROM '/mnt/c/Dropbox (LANCIS)/CARPETAS_TRABAJO/atorrijos/banco_datos/procesamiento/sub_natural/bd_usv_c2_mun.csv'
WITH DELIMITER ',' CSV HEADER;

--Se borran los espacios en blanco del final de region
UPDATE development.bd_usv_c2_mun SET region=rtrim(region);

--Se realiza la segunda forma normal para las columnas id_region y region
INSERT INTO development.regiones
SELECT DISTINCT id_region, region FROM development.bd_usv_c2_mun;

--Borrando todos los datos de estados para correr el archivo sql
DELETE FROM development.estados;
--Ingresando información de los estados
INSERT INTO development.estados(clave_entidad,entidad_federativa)
VALUES ('31','Yucatán');

--Borrando todos los datos de municipios para correr el archivo sql
DELETE FROM development.municipios;
--Ingresando información de los municipios
INSERT INTO development.municipios(clave_municipio,municipio,id_region,cve_ent) VALUES
('001','Abalá',2,'31'),
('002','Acanceh',2,'31'),
('003','Akil',7,'31'),
('004','Baca',2,'31'),
('005','Bokobá',4,'31'),
('006','Buctzotz',5,'31'),
('007','Cacalchén',4,'31'),
('008','Calotmul',5,'31'),
('009','Cansahcab',4,'31'),
('010','Cantamayec',6,'31'),
('011','Celestún',1,'31'),
('012','Cenotillo',5,'31'),
('013','Conkal',2,'31'),
('014','Cuncunul',6,'31'),
('015','Cuzamá',3,'31'),
('016','Chacsinkín',6,'31'),
('017','Chankom',6,'31'),
('018','Chapab',7,'31'),
('019','Chemax',6,'31'),
('020','Chicxulub Pueblo',2,'31'),
('021','Chichimilá',6,'31'),
('022','Chikindzonot',6,'31'),
('023','Chocholá',1,'31'),
('024','Chumayel',7,'31'),
('025','Dzán',7,'31'),
('026','Dzemul',4,'31'),
('027','Dzidzantún',4,'31'),
('028','Dzilam de Bravo',4,'31'),
('029','Dzilam González',4,'31'),
('030','Dzitás',6,'31'),
('031','Dzoncauich',4,'31'),
('032','Espita',5,'31'),
('033','Halachó',1,'31'),
('034','Hocabá',3,'31'),
('035','Hoctún',3,'31'),
('036','Homún',3,'31'),
('037','Huhí',3,'31'),
('038','Hunucmá',1,'31'),
('039','Ixil',2,'31'),
('040','Izamal',3,'31'),
('041','Kanasín',2,'31'),
('042','Kantunil',3,'31'),
('043','Kaua',6,'31'),
('044','Kinchil',1,'31'),
('045','Kopomá',1,'31'),
('046','Mama',7,'31'),
('047','Maní',7,'31'),
('048','Maxcanú',1,'31'),
('049','Mayapán',7,'31'),
('050','Mérida',2,'31'),
('051','Mocochá',2,'31'),
('052','Motul',4,'31'),
('053','Muna',7,'31'),
('054','Muxupip',4,'31'),
('055','Opichén',1,'31'),
('056','Oxkutzcab',7,'31'),
('057','Panabá',5,'31'),
('058','Peto',6,'31'),
('059','Progreso',2,'31'),
('060','Quintana Roo',6,'31'),
('061','Río Lagartos',5,'31'),
('062','Sacalum',7,'31'),
('063','Samahil',1,'31'),
('064','Sanahcat',3,'31'),
('065','San Felipe',5,'31'),
('066','Santa Elena',7,'31'),
('067','Seyé',2,'31'),
('068','Sinanché',4,'31'),
('069','Sotuta',6,'31'),
('070','Sucilá',5,'31'),
('071','Sudzal',3,'31'),
('072','Suma',4,'31'),
('073','Tahdziú',6,'31'),
('074','Tahmek',2,'31'),
('075','Teabo',7,'31'),
('076','Tecoh',2,'31'),
('077','Tekal de Venegas',3,'31'),
('078','Tekantó',3,'31'),
('079','Tekax',7,'31'),
('080','Tekit',7,'31'),
('081','Tekom',6,'31'),
('082','Telchac Pueblo',4,'31'),
('083','Telchac Puerto',4,'31'),
('084','Temax',4,'31'),
('085','Temozón',6,'31'),
('086','Tepakán',3,'31'),
('087','Tetiz',1,'31'),
('088','Teya',3,'31'),
('089','Ticul',7,'31'),
('090','Timucuy',2,'31'),
('091','Tinum',6,'31'),
('092','Tixcacalcupul',6,'31'),
('093','Tixkokob',2,'31'),
('094','Tixmehuac',7,'31'),
('095','Tixpéhual',2,'31'),
('096','Tizimín',5,'31'),
('097','Tunkás',3,'31'),
('098','Tzucacab',7,'31'),
('099','Uayma',6,'31'),
('100','Ucú',2,'31'),
('101','Umán',2,'31'),
('102','Valladolid',6,'31'),
('103','Xocchel',3,'31'),
('104','Yaxcabá',6,'31'),
('105','Yaxkukul',2,'31'),
('106','Yobaín',4,'31');

--Se realiza la segunda forma normal para las columna serie_usv
--Borrando todos los datos de municipios para correr el archivo sql
DELETE FROM development.series;
--Ingresando información de la tabla development.series
INSERT INTO development.series(serie_usv, serie) VALUES
(1,1985),
(2,1993),
(3,2002),
(4,2007),
(5,2011),
(6,2014);

--Borrando todos los datos de municipios para correr el archivo sql
DELETE FROM development.coberturas_c3;
--Se ingresa la información de la tabla coberturas_c3
INSERT INTO development.coberturas_c3(cob_c3_id, cobertura_c3) VALUES 
(1,'Natural'),
(2,'No natural');

--Borrando todos los datos de municipios para correr el archivo sql
DELETE FROM development.coberturas_c4;
--Se ingresa la información de la tabla coberturas_c4
INSERT INTO development.coberturas_c4(cob_c4_id, cobertura_c4, cob_c3_id) VALUES 
(1,'Asentamiento humano', 2),
(2,'Agropecuario', 2),
(3,'Natural',1);

--Borrando todos los datos de municipios para correr el archivo sql
DELETE FROM development.coberturas_c2;
--Se ingresa la información de la tabla coberturas_c2
INSERT INTO development.coberturas_c2(cob_c2_id, cobertura_c2, cob_c4_id) VALUES 
(1,'Agricultura de riego', 2),
(2,'Agricultura de temporal', 2),
(3,'Cuerpo de agua', 3),
(4,'Manglar', 3),
(5,'Pastizal', 2),
(6,'Sin vegetación', 1),
(7,'Asentamiento humano', 1),
(8,'Vegetación de duna costera', 3),
(9,'Vegetación de petén', 3),
(10,'Vegetación secundaria de selva baja', 3),
(11,'Vegetación secundaria de selva mediana', 3),
(12,'Acuícola', 2),
(13,'Bosque cultivado/Palmar inducido', 2),
(14,'Tular', 3),
(15,'Vegetación halófila hidrófila', 3),
(16,'Sábana', 3);