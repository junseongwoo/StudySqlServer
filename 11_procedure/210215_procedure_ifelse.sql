use sqlDB;
go

create or alter procedure usp_iselse
	@userName nvarchar(10)

as 
	declare @birthYear int;
	select @birthYear = birthYear 
	  from userTbl
     where userName = @userName;

	 if (@birthYear >= 1980)
	 begin
		print '����';
	 end 

	 else 
	 begin
		print '����';
	 end 
go 

exec usp_iselse '���ؼ�';