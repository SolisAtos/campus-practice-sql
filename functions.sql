-- functions.sql --
-- 6.1.Crea una funcion “GetLastProjetIdByEmployeeName()” que reciba el nombre de un empleado y retorne el Id del proyecto mas reciente del empleado ingresando.

create function GetLastProjectIdByEmployeeName(@EmpFirstName varchar(50))
returns int
as
begin 
	declare @ProjIdMostRecent as int
	select top 1 @ProjIdMostRecent = Projects.Id
	from Projects
	inner join EmployeeProject on Projects.Id = EmployeeProject.ProjectId
	inner join Employees on Employees.Id = EmployeeProject.EmployeeId
	where @EmpFirstName = FirstName
	order by StartDate asc
return @ProjIdMostRecent
end

--Test the function
declare @results int
select @results = dbo.GetLastProjectIdByEmployeeName('Pedro')
print @results

-- 6.2.Crea una funcion “HasAnyProject()” que reciba el nombre de un empleado y retorne un bit, indicando 1 en caso de que el empleado pertenezca a mas de 1 proyecto o 0 en caso contrario. 

create function HasAnyProject(@EmpFirstName varchar(50))
returns bit
as
begin 
	declare
		@HasProjectBit as bit,
		@NumOfProjects as int
	select @NumOfProjects = count(ProjectId)
	from Projects
	inner join EmployeeProject on Projects.Id = EmployeeProject.ProjectId
	inner join Employees on Employees.Id = EmployeeProject.EmployeeId
	where @EmpFirstName = FirstName
	group by FirstName

	if (@NumOfProjects>1)
		begin
		set @HasProjectBit = 1
		end
	else
		begin
		set @HasProjectBit = 0
		end
return @HasProjectBit
end

--Test the function
declare @results1 int
select @results1 = dbo.HasAnyProject('Isabela')
print @results1