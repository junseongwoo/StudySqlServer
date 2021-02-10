declare @curDate Date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);
declare @sql varchar(100);

set @curDate = getDate();
set @curYear = year(@curDate);
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
print replicate('0', 2 - len(@curMonth)) + @curMonth;
print right(('00' + @curMonth), 2);
print @curDay;

print format(@curDate, 'yyyy-MM-dd');  -- 力老 浆款 规过


set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bNum nvarchar(100) not null); ';

exec(@sql);
