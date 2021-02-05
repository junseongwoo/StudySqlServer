/*SELECT memberID, memberName, memberaddress 
	from memberTbl
  WHERE memberID like 'W%' */

USE BikeStores;

SELECT * from sales.customers;

SELECT * from production.products;

--DB 조회
EXEC sp_helpdb;

-- 테이블 조회
EXEC sp_tables @table_type = "'TABLE'";

-- 열이름 조회
EXEC sp_columns @table_name = 'stocks',
                @table_owner = 'production';
