use sqlDB;
go


-- 프로시저 생성
create procedure usp_users
as
	select userID, userName, birthYear from userTBL;
go

-- 프로시저 수정 
alter procedure usp_users
as
	select userID, userName, birthYear from userTBL;
go

-- 프로시저 생성 및 수정 동시에 -- 가장 많이 씀 (한번에 되기 때문에)
create or alter procedure usp_users
as
	select userID, userName, birthYear from userTBL;
go