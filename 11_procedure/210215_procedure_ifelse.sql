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
		print 'ÀşÀ½';
	 end 

	 else 
	 begin
		print '´ÄÀ½';
	 end 
go 

exec usp_iselse '¿ìÁØ¼º';