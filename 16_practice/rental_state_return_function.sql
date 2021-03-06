USE [BookRentalShopDB]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getState]    Script Date: 2021-02-18 오전 10:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   FUNCTION [dbo].[ufn_getState](@rentalState char(1))
RETURNS nvarchar(5)
as
begin
	declare @result nvarchar(5); -- 대출, 반납, 연체, 분실
	set @result = case @rentalState
					when '1' then '대출'
					when '2' then '반납'
					when '3' then '연체'
					when '4' then '분실'
					else '미대출'
				  end;
	return @result;    
end
