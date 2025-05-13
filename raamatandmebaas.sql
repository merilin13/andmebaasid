CREATE DATABASE TITpe23_baas;
--kasutame andmebaasi
USE TITpe23_baas;
--tabeli loomine
CREATE TABLE raamat(
raamatudID int not null PRIMARY Key identity(1,1),
raamatNimetus varchar(100) not null,
zanrID int,
autorID int,
hind decimal(5,2),
v_aasta int);
SELECT * FROM raamat;

--andmete lisamine tabelisse
INSERT INTO raamat(
raamatNimetus, zanrID, autorID, hind, v_aasta)
VALUES(
'Alice Imedemaal', 2, 2, 20.50, 2015)
CREATE TABLE zanr(
zanrID int not null PRIMARY Key identity(1,1),
zanrNimetus varchar(25) UNIQUE)
SELECT * FROM zanr;
INSERT INTO zanr(zanrNimetus)
VALUES ('komöödia'),('dektetiiv');

--Foreign key lisamine zanrID tabelis raamat

ALTER TABLE raamat ADD foreign key (zanrID)
REFERENCES zanr(zanrID)

drop table autor;
CREATE TABLE autor(autorID int not null PRIMARY Key identity(1,1),
autorEesnimi varchar(25),
autorPerenimi varchar(30),
synniaeg date,
synnikoht char(10));

SELECT * FROM autor;
INSERT INTO autor(
autorEesnimi, autorPerenimi, synniaeg, synnikoht)
VALUES (
'Lewis', 'Carrol', '1900-11-30', 'UK')

ALTER TABLE raamat ADD foreign key (autorID)
REFERENCES autor(autorID)
--fk kontrollimiseks lisame autorID mis ei ole kasutuses
INSERT INTO raamat(
raamatNimetus, zanrID, autorID, hind, v_aasta)
VALUES(
'Alice Imedemaal++++', 2, 2, 20.50, 2015);
SELECT * FROM raamat;
--raamatu kustutamine
DELETE FROM raamat WHERE raamatudID=2