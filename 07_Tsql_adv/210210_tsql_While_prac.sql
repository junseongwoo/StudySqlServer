declare @i int = 0, @hap bigint = 0;

while (@i <= 100)
begin 
	IF (@i % 7 = 0)
		BEGIN
			PRINT N'7�� ���: ' + CAST (@i as nchar(3));
			set @i += 1;
			continue
		END
	SET @hap += @i
	if (@hap > 1000) break
	set @i += 1
end

print N'�հ�= ' + CAST(@hap AS NCHAR(10))