-- triggers.sql --
-- 5.1.Generar un error para prevenir “inserts” de proyectos cuyo Deadline sea antes que la fecha de inicio.
-- 5.2.Al insertar proyectos, actalizar sus estatus a “pendientes”, o “en proceso” en caso que la fecha actual sea posterior a StartDate y antes del deadline.

-- No me gusta que ambos triggers estan combinados en uno, pero pase mucho tiempo y no encontre otra forma de hacerlo funcionar :(

create trigger TR_Update_Status_When_Today_after_StartDate_andBefore_Dedline_and_TR_Error_Insert_Deadline_before_StartDate
on Projects
after insert
as begin
	declare
		@Id int,
		@Name varchar(150),
		@StartDate date,
		@Deadline date,
		@FinishedOn date,
		@StatusId int
	select
		@Id = inserted.Id,
		@Name = inserted.Name,
		@StartDate = inserted.StartDate,
		@Deadline = inserted.Deadline,
		@FinishedOn = inserted.FinishedOn,
		@StatusId = inserted.StatusId
	from inserted
	if ((getdate() > @StartDate) and (GETDATE() < @Deadline))
		begin
		print('Actualizando status a "En progreso" por la fecha actual')
		update Projects
		set StatusId = 2
		where Id = @Id
		end
	if (@Deadline < @StartDate)
		begin
		print('Deadline cannot be a date before the start date')
		raiserror(15600,-1,-1, 'Deadline cannot be a date before the start date')
		rollback transaction
		end
end

------------------Trigger 1
-- Test if it works
insert into Projects(Id, Name, StartDate, Deadline, FinishedOn, StatusId)
values(9, 'Trigger this', '6/9/2021', '1/11/2009', NULL, 2)
-- Test if normal transaction still works
insert into Projects(Id, Name, StartDate, Deadline, FinishedOn, StatusId)
values(8, 'Wow!', '1/1/2019', '2/7/2021', NULL, 4)
------------------Trigger 2
-- Test if it works
insert into Projects(Id, Name, StartDate, Deadline, FinishedOn, StatusId)
values(10, 'Now trigger this', '1/1/2022', '2/7/2025', NULL, 4)
-- Test if normal transaction still works
insert into Projects(Id, Name, StartDate, Deadline, FinishedOn, StatusId)
values(12, 'Dont do this', '1/1/2019', '2/7/2021', NULL, 4)

delete from projects where Id = 12
Select * from projects;