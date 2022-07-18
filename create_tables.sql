-- create_tables.sql --
-- 1.1 Crea una tabla “Company” con las siguientes columnas y restricciones
-- 1.1.1.Id(entero, unico, identificador)
-- 1.1.2.Name (unico, texto de longitud no mayor a 150).
-- 1.1.3.Address (texto, con limite de longitude maxima).

create table Company
(
	Id int primary key,
	Name varchar(150) unique,
	Address varchar(max)
);

-- 1.2.Crea una tabla “Status” con las siguientes columnas y restricciones
-- 1.2.1.Id (entero, identificador unico)
-- 1.2.2.Name (texto unico con longitud no mayor a 50).

create table Status
(
	Id int primary key,
	Name varchar(50) unique
);

-- 1.3.Crea una tabla “Projects” con las siguientes columnas y restricciones
-- 1.3.1.Id(entero, identificador unico).
-- 1.3.2.Name (unico, texto de longitude no mayor a 150).
-- 1.3.3.StartDate (fecha de inicio).
-- 1.3.4.Deadline (fecha limite de entrega). 
-- 1.3.5.FinishedOn (fecha en que se entrega el proyecto)
-- 1.3.6.StatusId (entero, identificador del Status).

create table Projects
(
	Id int primary key,
	Name varchar(150) unique,
	StartDate date,
	Deadline date,
	FinishedOn date,
	StatusId int foreign key references Status(Id)
);

-- 1.4.Crea una tabla “Employees” con las siguientes columnas y restricciones
-- 1.4.1.Id(entero, unico, identificador)
-- 1.4.2.FirstName (texto de longitud no mayor a 50).
-- 1.4.3.LastName (texto de longitud no mayor a 50).
-- 1.4.4.Email (unico, texto de longitud no mayor a 100).
-- 1.4.5.Phone (unico, texto de longitud no mayor a 12).
-- 1.4.6.Salary (decimal).

create table Employees
(
	Id int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(100) unique,
	Phone varchar(12) unique,
	Salary decimal
);