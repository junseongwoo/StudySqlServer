use sqlDB;
go


-- ���ν��� ����
create procedure usp_users
as
	select userID, userName, birthYear from userTBL;
go

-- ���ν��� ���� 
alter procedure usp_users
as
	select userID, userName, birthYear from userTBL;
go

-- ���ν��� ���� �� ���� ���ÿ� -- ���� ���� �� (�ѹ��� �Ǳ� ������)
create or alter procedure usp_users
as
	select userID, userName, birthYear from userTBL;
go