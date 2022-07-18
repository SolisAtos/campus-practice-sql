-- queries.sql --
-- Realiza las siguientes consultas(sin retornar las llaves foraneas):
-- 4.1.Devuelve todas las companias.

select * 
from Company;

-- 4.2.Devuelve todos los empleados.

select Id, FirstName, LastName, Email, Phone, Salary 
from Employees;

-- 4.3.Devuelve los proyectos que hayan sido finalizados antes del deadline.

select Id, Name, StartDate, Deadline, FinishedOn 
from Projects 
where FinishedOn < Deadline;

-- 4.4.Devuelve los proyectos que no hayan empezado a partir de la fecha actual (en que se aplica esta practica).

select Id, Name, StartDate, Deadline, FinishedOn 
from Projects 
where StartDate > GETDATE();

-- 4.5.Devuelve los empleados con salario mayor a 10,000.

select Id, FirstName, LastName, Email, Phone, Salary 
from Employees 
where Salary > 10000;

-- 4.6.Devuelve los empleados de Atoz.

select Id, FirstName, LastName, Email, Phone, Salary 
from Employees 
where CompanyId = 2

-- 4.7.Devuelve los empleados que no son de Disnei.

select Id, FirstName, LastName, Email, Phone, Salary 
from Employees 
where CompanyId != 3

-- 4.8.Devuelve los empleados con sus respectivas companies, ordenados primeramente por el nombre de sus companies y Luego por sus apellidos.

select Employees.Id, FirstName, LastName, Email, Phone, Salary, Company.Name as 'Company Name' 
from Employees 
inner join Company on Employees.CompanyId = Company.Id 
order by Company.Name, LastName;

-- 4.9.Devuelve los empleados que pertenezcan a proyectos que esten en proceso.

select Employees.Id, FirstName, LastName, Email, Phone, Salary, Projects.Name as 'Project Name' 
from Employees 
inner join EmployeeProject on Employees.Id = EmployeeProject.EmployeeId
inner join Projects on Projects.Id = EmployeeProject.ProjectId
where Projects.StatusId = 2

-- 4.10.Devuelve los empleados sin proyectos pendientes o en proceso.

select Employees.Id, FirstName, LastName, Email, Phone, Salary, Projects.Name as 'Project Name' 
from Employees 
inner join EmployeeProject on Employees.Id = EmployeeProject.EmployeeId
inner join Projects on Projects.Id = EmployeeProject.ProjectId
where Projects.StatusId != 2 and Projects.StatusId != 1
