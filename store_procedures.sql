-- store_procedures.sql --
-- 7.1. Crea un store procedure que reciba el nombre de una compañia y el nombre de un proyecto, el store procedure debera realizar la siguientes operaciones 
-- por cada empleado perteneciente a la compañia:-Debera utilizar la funcion HasAnyProject() para verificar que el empleado pertenezca a algun proyecto, 
-- en caso que asi sea entones se deberá eliminar al empleado de cada unos de sus proyectos.-Posteriormente, el empleado sera asignado al proyecto segun el 
-- nombre ingresado.

create procedure AssignAllEmployeesFromACompanyToAProject
	@CompanyName varchar(150),
	@ProjectName varchar(150)
as
	declare 
		@EmpName varchar(50),
		@EmpId int,
		@ProjId int,
		@CompId int

	select @ProjId = Projects.Id from Projects where Projects.name = @ProjectName

	select @CompId = Company.Id from Company where Company.name = @CompanyName

	declare Employee_Cursor cursor
		for select distinct Employees.Id, Employees.FirstName from Employees where Employees.CompanyId = @CompId

	open Employee_Cursor
	fetch next from Employee_Cursor into @EmpId, @EmpName

	while @@FETCH_STATUS = 2
	begin
		if(dbo.HasAnyProject(@EmpName) = 1)
			begin 
			delete from EmployeeProject where EmployeeId = @EmpId
			end
		insert into EmployeeProject values (@EmpId, @ProjId)

		fetch next from Employee_Cursor into @EmpId, @EmpName
	end

	close Employee_Cursor
	deallocate Employee_Cursor
	

-- Test the procedure
select *
from Employees
inner join Company on Employees.CompanyId = Company.Id
inner join EmployeeProject on Employees.Id = EmployeeProject.EmployeeId
inner join Projects on Projects.Id = EmployeeProject.ProjectId
order by Employees.Id

exec AssignAllEmployeesFromACompanyToAProject 'Disnei', 'Atoz Insight'
