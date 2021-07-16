CREATE DATABASE BDESTRUCTURA;

USE BDESTRUCTURA;

CREATE TABLE Hardware(
IdHardware int primary key auto_increment,
DatosRelevaHardware Varchar (100)  null,
IdRamFK int,
IdDDFK int,
IdUnidadCDFK int,
IdTLectorasFK int,
IdPuertosFK int,
IdMonitorFK int,
IdTecladoFK int,
IdMouseFK int,
IdTVideoFK int, 
IdTRedFK int,
IdTsonidoFK int,
IdAlimentacionFK int,
IdCamaraFK int,
IdCableFK int,
IdBoardFK int,
IdProcesadorFK int);

CREATE TABLE MemoriaRam (
IdRam int primary key auto_increment,
TipoRam Varchar (50) not null,
VelocidadRam Varchar (50) not null,
EstadoRam Varchar (50) not null);

CREATE TABLE UnidadCD(
IdUnidadCD int primary key auto_increment,
MarcaUnidadCD varchar (20) not null,
ModeloUnidadCD varchar (20) not null,
TipoUnidadCD varchar (20) not null,
EstadoUnidadCD varchar (20) not null);

CREATE TABLE TarjetaLectora(
IdTLectora int primary key auto_increment,
TipoTLectora varchar (20) not null,
TipoMicro Boolean not null,
Usb Varchar(20) not null,
EstadoTLectora Varchar (20) not null);

CREATE TABLE Puerto(
IdPuerto int primary key auto_increment,
TipoPuerto varchar (20) not null,
UsbPuerto Varchar(20) not null,
EstadoPuerto Varchar (20) not null);

CREATE TABLE Monitor(
IdMonitor int primary key auto_increment,
MarcaMonitor varchar (20) not null,
SeñalMonitor Varchar(20) not null,
TipoMonitor Varchar(20) not null,
EstadoPuerto Varchar (20) not null);

CREATE TABLE Teclado(
IdTeclado int primary key auto_increment,
MarcaTeclado varchar (20) not null,
EstadoTeclado Varchar (20) not null);

CREATE TABLE Mouse(
IdMouse int primary key auto_increment,
MarcaMouse varchar (20) not null,
EstadoMouse Varchar (20) not null);

CREATE TABLE TarjetaVideo (
IdTVideo int primary key auto_increment,
Integrada varchar (20) not null,
TamañoMb int not null,
EstadoMouse Varchar (20) not null);

CREATE TABLE TarjetaRed (
IdTRed int primary key auto_increment,
TipoTRed varchar (20) not null,
MarcaTRed int not null,
DireccionTRed int not null,
DireccionIp int not null,
DireccionMac varchar (20) not null,
VelocidadRed int not null,
EstadoTRed Varchar (20) not null);

CREATE TABLE TarjetaSonido (
IdTsonido int primary key auto_increment,
Integrada varchar (20) not null,
MarcaTsonido  Varchar (20) not null,
EstadoTsonido Varchar (20) not null);

CREATE TABLE Camara (
IdCamara int primary key auto_increment,
Integrada varchar (20) not null,
MarcaCamara  Varchar (20) not null,
EstadoTCamara Varchar (20) not null);

CREATE TABLE Cable (
IdCable int primary key auto_increment,
AlimentacionTorres varchar (20) not null,
AlimentacionPantalla  Varchar (20) not null,
VGA Varchar (20) not null,
EstadoCable Varchar (20) not null);

CREATE TABLE Board (
IdBoard int primary key auto_increment,
MarcaBoard Varchar (20) not null,
ReferenciaBoard Varchar (20) not null,
TipoBus Varchar (20) not null,
AnchoBus Varchar (20) not null,
EstadoBoard  Varchar (20) not null);

CREATE TABLE Procesador (
IdProcesador int primary key auto_increment,
MarcaProcesador Varchar (20) not null,
Nomenclatura  Varchar (20) not null,
NumNucleos int not null,
EstadoBoard  Varchar (20) not null);

CREATE TABLE SoftwareEspecifico (
IdSEspecifico int primary key auto_increment,
NombreSofware Varchar (20) not null,
TipoSoftware  Varchar (20) not null,
VersionSoftware Varchar (20) not null,
Licencia Varchar (20) not null,
NumeroLicencia float (20) not null,
FechaActivacion datetime not null,
FechaVencimiento datetime not null,
EstadoSEspecifico Varchar (20) not null);

CREATE TABLE SistemaOperativo (
IdSO int primary key auto_increment,
NombreSO Varchar (20) not null,
LicenciaSO  Varchar (20) not null,
NumNucleos float not null,
EstadoSO Varchar (20) not null);

CREATE TABLE Software (
IdSoftware int primary key auto_increment,
DatosRelevSoft Varchar (100) null,
IdSEspecificoFK int,
IdSOFK int);

CREATE TABLE Usuario (
IdUsuario int primary key auto_increment,
NombreUsuario Varchar (20)  not null,
TipoUsuario Varchar (20) not null,
Contraseña Varchar (20) not null,
EstadoUsuario Varchar (20) not null);

CREATE TABLE TestEntrada (
IdTestEntrada int primary key auto_increment,
FechaRecibido datetime  not null,
EstadoEntrada Varchar (20) not null);

CREATE TABLE TestSalida (
IdTestSalida int primary key auto_increment,
FechaEntregado datetime not null,
EstadoSalida Varchar (20) not null);

CREATE TABLE Equipo (
IdEquipo int primary key auto_increment,
NombreEquipo Varchar (20) not null,
EstadoEquipo Varchar (20) not null,
IdSoftwareFK int,
IdHardwareFK int, 
IdTestEntradaFK int,
IdTestSalidaFK int,
IdIncidenciaFK int,
IdBitacora  int,
IdUsuarioFK int );

CREATE TABLE Incidencia (
IdIncidencia int primary key auto_increment,
Descripcion varchar (100),
Estado Varchar (50) not null);

CREATE TABLE Bitacora (
IdBitacora int primary key auto_increment,
Falla Varchar (50) not null,
Causa Varchar (50) not null,
Diagnostico Varchar (50) not null,
Estado Varchar (50) not null);

ALTER TABLE Equipo
ADD CONSTRAINT FKUsuarioEquipo
FOREIGN KEY (IdUsuarioFK)
REFERENCES Usuario (IdUsuario);

ALTER TABLE Equipo
ADD CONSTRAINT FKTestEntradaEquipo
FOREIGN KEY (IdTestEntradaFK)
REFERENCES TestEntrada (IdTestEntrada);

ALTER TABLE Equipo
ADD CONSTRAINT FKTestSalidaEquipo
FOREIGN KEY (IdTestSalidaFK)
REFERENCES TestSalida (IdTestSalida);

ALTER TABLE Equipo
ADD CONSTRAINT FKIncidenciaEquipo
FOREIGN KEY (IdIncidenciaFK)
REFERENCES Incidencia (IdIncidencia);

ALTER TABLE Equipo
ADD CONSTRAINT FKBitacoraEquipo
FOREIGN KEY (IdBitacora)
REFERENCES Bitacora (IdBitacora);


ALTER TABLE Software
ADD CONSTRAINT FKSistemaOperativoSoftware
FOREIGN KEY (IdSOFK)
REFERENCES SistemaOperativo (IdSO);

ALTER TABLE Software
ADD CONSTRAINT FKSoftwareEspecificoSoftware
FOREIGN KEY (IdSEspecificoFK)
REFERENCES SoftwareEspecifico (IdSEspecifico);

ALTER TABLE Equipo
ADD CONSTRAINT FKSoftwareEquipo
FOREIGN KEY (IdSoftwareFK)
REFERENCES Software (IdSoftware);

ALTER TABLE Hardware 
ADD CONSTRAINT FKMemoriaRamHardware
FOREIGN KEY (IdRamFK)
REFERENCES MemoriaRam (IdRam); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKUnidadCDHardware
FOREIGN KEY (IdUnidadCDFK)
REFERENCES UnidadCD (IdUnidadCD); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKTarjetaLectoraHardware
FOREIGN KEY (IdTLectorasFK)
REFERENCES Tarjetalectora(IdTLectora); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKPuertoHardware
FOREIGN KEY (IdPuertosFK)
REFERENCES Puerto (IdPuerto); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKMonitorHardware
FOREIGN KEY (IdMonitorFK)
REFERENCES Monitor(IdMonitor); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKTecladoHardware
FOREIGN KEY (IdTecladoFK)
REFERENCES Teclado (IdTeclado); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKTarjetaVideoHardware
FOREIGN KEY (IdTVideoFK)
REFERENCES TarjetaVideo (IdTVideo); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKTarjetaVideoHardware
FOREIGN KEY (IdTVideoFK)
REFERENCES TarjetaVideo (IdTVideo); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKTarjetaRedHardware
FOREIGN KEY (IdTRedFK)
REFERENCES TarjetaRed (IdTRed); 

ALTER TABLE Hardware 
ADD CONSTRAINT FKTarjetaSonidoHardware
FOREIGN KEY (IdTsonidoFK)
REFERENCES TarjetaSonido (IdTsonido);

ALTER TABLE Hardware 
ADD CONSTRAINT FKCamaraHardware
FOREIGN KEY (IdCamaraFK)
REFERENCES Camara (IdCamara);

ALTER TABLE Hardware 
ADD CONSTRAINT FKCableHardware
FOREIGN KEY (IdCableFK)
REFERENCES Cable (IdCable);

ALTER TABLE Hardware 
ADD CONSTRAINT FKBoardHardware
FOREIGN KEY (IdBoardFK)
REFERENCES Board (IdBoard);

ALTER TABLE Hardware 
ADD CONSTRAINT FKBoardHardware
FOREIGN KEY (IdBoardFK)
REFERENCES Board (IdBoard);

ALTER TABLE Hardware 
ADD CONSTRAINT FKProcesadorHardware
FOREIGN KEY (IdProcesadorFK)
REFERENCES Procesador (IdProcesador);

ALTER TABLE Equipo
ADD CONSTRAINT FKHardwareEquipo
FOREIGN KEY (IdHardwareFK)
REFERENCES Hardware (IdHardware);

INSERT INTO MemoriaRam
VALUES ('','DDR3','1333','ESTABLE'),
('','DDR3','800','ESTABLE');

INSERT INTO UnidadCD
VALUES ('','Blu ray','DH-401S','SATA','INESTABLE'),
('','CD-ROM','DH-6015','SATA','ESTABLE');

INSERT INTO TarjetaLectora
VALUES ('','Unica','SD','Si','INESTABLE'),
('','Multi','SD','Si','ESTABLE');

INSERT INTO Puerto
VALUES ('','USB','Si','ESTABLE'),
('','PCI','Si','ESTABLE');

INSERT INTO Monitor
VALUES ('','Acer','Media','CRT','ESTABLE'),
('','HP','Buena','LCD','ESTABLE');



INSERT INTO Teclado
VALUES ('','Acer','ESTABLE'),
('','HP','ESTABLE');

INSERT INTO Mouse
VALUES ('','Acer','ESTABLE'),
('','HP','ESTABLE');

INSERT INTO TarjetaVideo
VALUES ('','Integrada',128,'ESTABLE'),
('','No integrada',256,'ESTABLE');

INSERT INTO TarjetaRed
VALUES ('','100baseTX','ASUS PCE-A56',1,'','00:1E:C2:9E:28:6B',100,'ESTABLE'),
('','100baseFX',128,'TPLINK TG 3468',2,'04:1E:A2:TE:29:3R',100,'ESTABLE');

INSERT INTO TarjetaSonido
VALUES ('','Integrada','ASUS Xonar DG','ESTABLE'),
('','integrada','Sound Blaster AE-9','ESTABLE');

INSERT INTO Camara
VALUES ('','Integrada','Logitec HD webcaM C270','ESTABLE'),
('','integrada','Creative Live Cam Sync HD','ESTABLE');

INSERT INTO Board
VALUES ('','msi','LPX','AS-C951-062','Serial','INESTABLE'),
('','ASRock','ATX','AS-C8591-072','Paralelo','ESTABLE');

INSERT INTO Cable
VALUES ('','1000amp','200amp','SicuentaconVGA','INESTABLE'),
('','1200amp','600amp','SicuentaconVGA','ESTABLE');

INSERT INTO Procesador
VALUES ('','intel i3 g11','i3 g11',2,'ESTABLE'),
('','AMD RYZEN','A20-CE50',4,'ESTABLE');

INSERT INTO Hardware
VALUES ('','null',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
('','null',2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2);
Select*from Software;

INSERT INTO SoftwareEspecifico
VALUES ('','Microsoft Office','Ofimatica','10.5.2.8','Licenciado','20','2010-05-10-3:10','2022-05-08-3:10','Activo'),
('','MC-Afee','Antivirus','5.2.8','Licenciado','20','2020-05-10-4:10','2025-05-08-2:10','Activo');

INSERT INTO SistemaOperativo
VALUES ('','Windows 10 home','Licenciado',400,'Activo'),
('','Windows 7','Licenciado',200,'Activo');
select * from Software;

INSERT INTO Software
VALUES ('','null',1,1),
('','null',2,2);

INSERT INTO Usuario
VALUES ('','Isabella Torres ','Tecnologo','123456','Activo'),
('','Jorge Mendez','Tecnico','78910','Activo');

INSERT INTO TestEntrada
VALUES ('','2021-05-05-3:30','Descompuesto'),
('','2021-08-05-4:30','Descompuesto');

INSERT INTO TestSalida
VALUES ('','2021-06-05-2:30','Compuesto'),
('','2021-09-05-6:30','Compuesto');

INSERT INTO Incidencia
VALUES ('','El equipo se empezo apagar en repetidas ocaciones de manera automatica','Descompuesto'),
('','Alunas teclas del periferico no concuerdan con lo que aparece en el monitor ','Descompuesto');

INSERT INTO Bitacora
VALUES ('','El equipo se empezo apagar en repetidas ocaciones de manera automatica','La RAM esta mal ubicada dentro de la motherboard','El equipo se revisara, se desamblara y probara','Descompuesto'),
('','Alunas teclas del periferico no concuerdan con lo que aparece en el monitor ','Las teclas del periferico estan desorganizadas, o el equipo tiene la configuracion de perifericos mal','el periferico se desamblara y continuo a esto re configurara dentro del sistema','Descompuesto');

INSERT INTO Equipo
VALUES ('','DESKTOP-ABCDE','Descompuesto',5,1,1,1,1,1,1),
('','DESKTOP-4ERT6','Descompuesto',6,2,2,2,2,2,2);
select * from Incidencia;

Select * from Equipo;
Select * from Equipo WHERE IdEquipo= 5;
Select * from Equipo WHERE EstadoEquipo= 'Descompuesto' or IdTestSalidaFK= 2;
Select * from Equipo WHERE IdSoftwareFK= 1 and IdHardwareFK= 6;
Select * from Equipo ORDER BY IdEquipo ASC;
Select * from Equipo Group By IdSoftwareFK;
Select * from TestEntrada WHERE FechaRecibido BETWEEN '2019-06-05-1:00' AND '2021-10-06-8:30' ;

UPDATE Equipo
SET DNI= '100113'
WHERE idEquipo= 1;

UPDATE TestSalida
SET Marca= 'Mazda'
WHERE IdTestSalida= 4;

UPDATE TestEntrada
SET Estado= 'Activo'
WHERE IdTestEntrada= 1;

UPDATE Softwareespecifico
SET NombreSEspecifico= 'Word'
WHERE IdSoftwareespecifico= 4;

drop database  bdestructura;
