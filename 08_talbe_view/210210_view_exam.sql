create view uv_buytbl
as
	select num, prodName, groupName from buyTbl where groupName = '����';
go

select * from uv_buyTbl;

begin tran;  -- Ʈ������

delete from uv_buyTbl;


rollback;	-- ������ ����