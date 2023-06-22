--Creando la base de datos 
USE master;
go
CREATE DATABASE bd_Eduardo_Samaniego;
go
USE bd_Eduardo_Samaniego;
go

-- Creando las tablas
CREATE TABLE Colaboradores
(
IdColaborador int NOT NULL, 
Nombre1 varchar(50),
Nombre2 varchar(50) NULL,
Apellido1 varchar(50),
Apellido2 varchar(50) NULL,
ApellidoCasada varchar(50) NULL
);
go

CREATE TABLE Departamentos
(
IdDepartamento int NOT NULL, 
NombreDepartamento varchar(200),
Nombre2 varchar(50),
IdJefe int NULL,
IdDepartamentoOrigen int
);
go

CREATE TABLE ColaboradorCargo
(
IdColaborador int NOT NULL, 
IdCargo int NOT NULL, 
SalarioEfectivo decimal(7,2) NULL
);
go

CREATE TABLE Cargos
(
IdCargo int NOT NULL, 
NombreCargoBase varchar(200),
NombreCargoEfectivo varchar(200),
SalarioEfectivo decimal(7,2)
);
go

CREATE TABLE PlanillaQuincenal
(
IdPlanilla int NOT NULL, 
IdColaborador int, 
NumeroPlanilla varchar(20),
Fechapago datetime,
Quincena char(1),
SalarioNeto decimal(7,2) NULL,
ISR decimal(7,2) NULL,
SS decimal(7,2) NULL,
SE decimal(7,2) NULL,
);
go

--Creacion de las llaves primarias
ALTER TABLE Departamentos
ADD CONSTRAINT PK_Departamentos PRIMARY KEY CLUSTERED
(IdDepartamento);
go

ALTER TABLE Colaboradores
ADD CONSTRAINT PK_Colaboradores PRIMARY KEY CLUSTERED
(IdColaborador);
go

ALTER TABLE ColaboradorCargo
ADD CONSTRAINT PK_ColaboradorCargo PRIMARY KEY CLUSTERED
(IdColaborador,IdCargo);
go

ALTER TABLE Cargos
ADD CONSTRAINT PK_Cargos PRIMARY KEY CLUSTERED
(IdCargo);
go

ALTER TABLE PlanillaQuincenal
ADD CONSTRAINT PK_PlanillaQuincenal PRIMARY KEY CLUSTERED
(IdPlanilla);
go

--Creando las llaves foraneas
ALTER TABLE Departamentos
ADD CONSTRAINT FK_Departamentos_Departamentos FOREIGN KEY (IdDepartamentoOrigen)
REFERENCES Departamentos (IdDepartamento);
ALTER TABLE Departamentos
ADD CONSTRAINT FK_Departamentos_Colaboradores FOREIGN KEY (IdJefe)
REFERENCES Colaboradores (IdColaborador);
ALTER TABLE ColaboradorCargo
ADD CONSTRAINT FK_ColaboradorCargo_Colaboradores FOREIGN KEY (IdColaborador)
REFERENCES Colaboradores (IdColaborador);

ALTER TABLE ColaboradorCargo
ADD CONSTRAINT FK_ColaboradorCargo_Cargos FOREIGN KEY (IdCargo)
REFERENCES Cargos(IdCargo);

ALTER TABLE PlanillaQuincenal
ADD CONSTRAINT FK_PlanillaQuincenal_Colaboradores FOREIGN KEY (IdColaborador)
REFERENCES Colaboradores(IdColaborador);



--Creacion de los logins 
use bd_Eduardo_Samaniego
-- Creación de Login 1
CREATE LOGIN [usr_01] 
WITH PASSWORD=N'123456', 
DEFAULT_DATABASE=[bd_Eduardo_Samaniego]
GO
-- Creación de Login 2
CREATE LOGIN [usr_02] 
WITH PASSWORD=N'123456'
DEFAULT_DATABASE=[bd_Eduardo_Samaniego]
GO
-- Creación de Login 3
CREATE LOGIN [usr_03] 
WITH PASSWORD=N'123456'
DEFAULT_DATABASE=[bd_Eduardo_Samaniego]
GO
-- Creación de Login 4
CREATE LOGIN [usr_04] 
WITH PASSWORD=N'123456'
GO

-- Creación de Login 5
CREATE LOGIN [usr_05] 
WITH PASSWORD=N'123456'
GO
-- ---------------------------------
-- Creacion de los Usuarios
-- ---------------------------------
CREATE USER [usr_01] FOR LOGIN [usr_01]

GO

CREATE USER [usr_02] FOR LOGIN [usr_02]
GO 

CREATE USER [usr_03] FOR LOGIN [usr_03]
GO 

CREATE USER [usr_04] FOR LOGIN [usr_04]
GO 

CREATE USER [usr_05] FOR LOGIN [usr_05]
GO 

--Asignando privilegios 

GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::bd_Eduardo_Samaniego TO usr_01;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::bd_Eduardo_Samaniego TO usr_02;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::bd_Eduardo_Samaniego TO usr_03;
GO


--creacion de roles
Go
CREATE ROLE [rol_01]CREATE ROLE [rol_02]CREATE ROLE [rol_03]CREATE ROLE [rol_04]CREATE ROLE [rol_05]--Asignando rolesuse bd_Eduardo_SamaniegoALTER ROLE [rol_01] ADD MEMBER 
[usr_01]ALTER ROLE [rol_02] ADD MEMBER 
[usr_02]
ALTER ROLE [rol_03] ADD MEMBER 
[usr_03]
ALTER ROLE [rol_04] ADD MEMBER 
[usr_04]
ALTER ROLE [rol_05] ADD MEMBER 
[usr_05]

--Asignando permisos a los roles
GRANT SELECT, INSERT, UPDATE, DELETE ON Colaboradores TO rol_01;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON Departamentos TO rol_01;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON ColaboradorCargo TO rol_01;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON Cargos TO rol_02;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON PlanillaQuincenal TO rol_02;
GO

