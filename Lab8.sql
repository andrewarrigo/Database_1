--Andrew Arrigo
--3/26/17

DROP TABLE IF EXISTS People;
--People--
CREATE TABLE People(
 PID char(4) NOT NULL,
 name text NOT NULL,
 address text,
 spouse_name text,
 PRIMARY KEY (PID)
)
;

DROP TABLE IF EXISTS Casts;
--Casts--
CREATE TABLE Casts(
 PID char(4) NOT NULL,
 MPAANum int NOT NULL,
 Role text,
 PRIMARY KEY (PID, MPAANum, Role)
)
;

DROP TABLE IF EXISTS Actor_Data;
--Actor_Data--
CREATE TABLE Actor_Data(
 PID char(4) NOT NULL references People(PID),
 birth_date date,
 hair_color text,
 eye_color text,
 height_in int,
 weight int,
 fav_color text,
 sag_annivDate date,
 PRIMARY KEY (PID)
)
;

DROP TABLE IF EXISTS Director_Data;
--Director_Data--
CREATE TABLE Director_Data(
 PID char(4) NOT NULL references People (PID),
 filmSchool_attended text,
 dg_annivDate text,
 fav_LensMakers text,
 PRIMARY KEY (PID)
)
;

DROP TABLE IF EXISTS Movie_Data;
--Movie_Data--
CREATE TABLE Movie_Data(
 MPAANum int NOT NULL,
 name text NOT NULL,
 release_year int,
 domestic_sales text,
 boxOffice_sales text,
 DVD_Bluray_sales text, 
 PRIMARY KEY (MPAANum)
)
;




