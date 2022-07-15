CREATE EXTENSION postgis;
--Created Table
CREATE TABLE MAPS (name varchar, geom geometry);
INSERT INTO MAPS VALUES
	('MyHome','POINT(-118.28873545702392 34.02704111526119)'),
	('CinematicArtsF', 'POINT(-118.28643705569854 34.02341400213798)'),
	('EileenNorrisF', 'POINT(-118.28563686179062 34.0222446561058)'),
	('LeaveyF', 'POINT(-118.28287364563872 34.021450274116745)'),
	('CarolynCraigF', 'POINT(-118.28343419693724 34.020489258295896)'),
	('DohenyF', 'POINT(-118.28456761692429 34.02053795643786)'),
	('PatsyForrestF', 'POINT(-118.28520808751408 34.020196185486576)'),
	('WilsonDentalLib', 'POINT(-118.28597895140501 34.02370892953405)'),
	('LeaveyLib', 'POINT(-118.28293593867708 34.02179057701038)'),
	('DohenyLib', 'POINT(-118.28371035911809 34.020184253601485)'),
	('HooseLib', 'POINT(-118.2866052695459 34.01871004909205)'),
	('HelenLib', 'POINT(-118.28801069467708 34.01921811736642)'),
	('ScienceEngLib', 'POINT(-118.28879810874089 34.01962900542824)');


SELECT name, ST_AsText(geom) FROM MAPS;

--Query for Convex Hull coordinates
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM MAPS;

-- Answer:

-- POLYGON((-118.2866052695459 34.01871004909205,-118.28801069467708 34.01921811736642,-118.28879810874089 34.01962900542824,-118.28873545702392 34.02704111526119,-118.28293593867708 34.02179057701038,-118.28287364563872 34.021450274116745,-118.28343419693724 34.020489258295896,-118.28371035911809 34.020184253601485,-118.2866052695459 34.01871004909205))


--Query for Nearest Neighbor of MyHome
SELECT name, ST_Astext(geom) as location, ST_Distance(geom,'POINT(-118.28873545702392 34.02704111526119)') as distance 
FROM Maps
WHERE name<>'MyHome' 
ORDER BY ST_Distance(geom,'POINT(-118.28873545702392 34.02704111526119)') 
limit 3;

-- Answer:

--       name       |                   location                   |       distance
-- -----------------+----------------------------------------------+----------------------
--  CinematicArtsF  | POINT(-118.28643705569854 34.02341400213798) | 0.004294018893885026
--  WilsonDentalLib | POINT(-118.28597895140501 34.02370892953405) | 0.004324556040474151
--  EileenNorrisF   | POINT(-118.28563686179062 34.0222446561058)  | 0.005710281328373285