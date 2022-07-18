-- insert_data.sql --
-- 3.1.Da de alta 5 status (en proceso, pendiente, cancelado, finalizado, en pausa).

insert into Status(Id, Name)
values 
	(1, 'Pendiente'),
	(2, 'En proceso'),
	(3, 'Cancelado'),
	(4, 'Finalizado'),
	(5, 'En pausa');
-- Revisar si funciono correctamente
select * from Status order by Id;

-- 3.2.Inserta 3 companias.

insert into Company(Id, Name, Address)
values
	(1, 'IMC', '5151 W 29th St #2201 Greeley, Colorado(CO), 80634 2007 Ardmore Hwy'),
	(2, 'Atoz', 'Ardmore, Tennessee(TN), 38449 4226 Highgate Dr'),
	(3, 'Disnei', 'Horn Lake, Mississippi(MS), 38637');
-- Revisar si funciono correctamente
select * from Company order by Id;

-- 3.3.Inserta 5 proyectos.

insert into Projects(Id, Name, StartDate, Deadline, FinishedOn, StatusId)
values
	(1, 'Dainler Learning', '2/7/1995', '2/22/2050', NULL, 2),
	(2, 'Provident Software', '9/15/2022', '2/28/2023', NULL, 1),
	(3, 'DataAnlysis', '1/31/2023', '10/5/2023', NULL, 1),
	(4, 'SoftCentral Migration', '5/2/2021', '7/25/2022', '1/1/2022', 4),
	(5, 'Atoz Insight', '12/30/2022', '10/1/2024', NULL, 3);
-- Revisar si funciono correctamente
select * from Projects order by Id;

-- 3.4.Inserta 10 empleados.

insert into Employees(Id, FirstName, LastName, Email, Phone, Salary, CompanyId)
values
	(1, 'Juan', 'Perez', 'juan@jmail.com', '9991808182', 9500, 1),
	(2, 'Paco', 'Ochoa', 'paco@jmail.com', '9991808183', 8000, 2),
	(3, 'Pedro', 'Fernandez', 'pedro@jmail.com', '9991808184', 12500, 3),
	(4, 'Sofi', 'Hernandez', 'sofi@jmail.com', '9991808185', 11000, 2),
	(5, 'Isabella', 'Smith', 'isabella@jmail.com', '9991808186', 9000, 1),
	(6, 'Eduardo', 'Jimenez', 'eduardo@jmail.com', '9991808187', 11000, 3),
	(7, 'Jose', 'Pavon', 'jose@jmail.com', '9991808188', 12000, 2),
	(8, 'Pancho', 'Fernanez', 'pancho@jmail.com', '9991808189', 12500, 1),
	(9, 'Francisco', 'Fernandez', 'francisco@jmail.com', '9991808190', 25000, 2),
	(10, 'Diego', 'Olivarez', 'diego@jmail.com', '9991808191', 9000, 3);
-- Revisar si funciono correctamente
select * from Employees order by Id;


-- Asignando empleados a proyectos
insert into EmployeeProject(EmployeeId, ProjectId)
values
	(1, 5),
	(2, 4),
	(3, 3),
	(4, 2),
	(5, 1),
	(6, 4),
	(7, 5),
	(8, 2),
	(9, 5),
	(10, 1),
	(3, 4),
	(8, 2),
	(6, 3);
-- Revisar si funciono correctamente
select * from EmployeeProject