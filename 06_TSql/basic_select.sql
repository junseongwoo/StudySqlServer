/*SELECT memberID, memberName, memberaddress 
	from memberTbl
  WHERE memberID like 'W%' */

USE BikeStores;

SELECT * from sales.customers;

SELECT * from production.products;

--DB ��ȸ
EXEC sp_helpdb;

-- ���̺� ��ȸ
EXEC sp_tables @table_type = "'TABLE'";

-- ���̸� ��ȸ
EXEC sp_columns @table_name = 'stocks',
                @table_owner = 'production';
