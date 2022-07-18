-- relate_tables.sql --
-- 2.1.Relaciona la tabla “Company” con “Employees”, de tal forma que un empleado pertenezca a una compania obligtoriamente.

-- Modificamos la tabla Employees para añadir FK de Company (one-to-many) y usamos not null para hacerlo obligatorio
alter table Employees add CompanyId int foreign key references Company(Id) not null;

-- 2.2.Relaciona la table “Projects“ con “Employees” de tal forma que un empleado pueda pertenecer a varios proyectos, y varios empleados puedan pertenecer a un mismo proyecto.

create table EmployeeProject
(
	EmployeeId int foreign key references Employees(Id),
	ProjectId int foreign key references Projects(Id)
);