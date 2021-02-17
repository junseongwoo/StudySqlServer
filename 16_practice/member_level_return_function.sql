USE [BookRentalShopDB]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getLevel]    Script Date: 2021-02-17 오후 5:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 사용자 레벨 리턴 함수
ALTER   FUNCTION [dbo].[ufn_getLevel]
(@levels char(1))
returns nvarchar(5)
as
begin
	DECLARE @result nvarchar(5) -- 값을 받아 회원등급 변수 

	set @result = case @levels
					when 'A' then '골드회원'
					when 'B' then '실버회원'
					when 'C' then '브론즈회원'
					when 'D' then '철회원'
					when 'S' then '관리자'
					else '비회원'
				  end
	return @result; 
end
