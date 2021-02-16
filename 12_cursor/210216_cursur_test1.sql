use sqlDB;
go

declare cur_usertbl cursor global
	for select userName, height from usertbl;

open cur_usertbl;

declare @userName nchar(8);
declare @height smallint ;				  -- ȸ�� Ű ��� ����
declare @cnt int = 0;					  -- ȸ����(�д� ���)
declare @totalHeight int = 0;			  -- ȸ�� Ű�� �հ� ����

fetch next from cur_usertbl into @userName, @height; -- Ŀ�� �� �о @height ������ �Ҵ� 

-- �ݺ��� ����
while @@FETCH_STATUS = 0 
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('ȸ�� : ', @userName, 'Ű : ', @height);
	fetch next from cur_usertbl into @userName, @height;
	print concat('��ġ : ', @@FETCH_STATUS);
	if @@FETCH_STATUS = -1
		print '��ġ�Ϸ�';
end 

print @height;
print @totalHeight;
print @cnt;
print concat('ȸ�� Ű ��� => ', @totalHeight / @cnt);

close cur_usertbl;
deallocate cur_usertbl;