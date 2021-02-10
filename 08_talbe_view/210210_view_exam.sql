create view uv_buytbl
as
	select num, prodName, groupName from buyTbl where groupName = '전자';
go

select * from uv_buyTbl;

begin tran;  -- 트랜젝션

delete from uv_buyTbl;


rollback;	-- 원상태 복귀