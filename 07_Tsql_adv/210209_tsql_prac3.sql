use sqlDB;
GO

SELECT RANK() over(order by height desc) as 'Ű ū ����', 
		userName, addr, height
	from userTbl;

SELECT RANK() over(partition by addr order by height desc) as 'Ű ū ����', 
		userName, addr, height
	from userTbl;

-- PIVOT
/*
create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);


insert into pivotTBL values ('�����', '�ܿ�', 10),
							('������', '����', 15),
							('�����', '����', 25),
							('�����', '��', 3),
							('�����', '��', 37),
							('������', '�ܿ�', 40),
							('�����', '����', 14),
							('�����', '�ܿ�', 22),
							('������', '����', 64);
GO
*/

select * from pivotTBL;

select * from pivotTBL
	pivot (sum(amount)
		for season
		in ([��], [����], [����], [�ܿ�])) as resultPivot; 

-- json 

select userID, userName,addr, height
	from userTbl
 where height > 180
	 for json auto;