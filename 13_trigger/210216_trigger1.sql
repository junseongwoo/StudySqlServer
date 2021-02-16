USE sqlDB;
go

create trigger trg_testTBL
on testTBL
after delete, update 
as
	print '트리거 발생'; 


select * from testTbl

insert into testTbl values ('마마무');
update testTbl set txt = '마마무뉴!';
delete testTbl where id = 2;