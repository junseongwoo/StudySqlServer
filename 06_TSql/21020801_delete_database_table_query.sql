-- testTBL insert

use sqlDB;
GO


--DML �� SELECT 
select * from testTBL1;

-- DML �� INSERT
insert into testTBL1 values (1, 'ȫ�浿', 25);
insert into testTBL1 (id, userName) values (2, '���ؼ�');
insert into testTBL1 (age, id) values (3, 3);


insert into testTBL1 (userName, age) values ('����' ,23); -- ����



exec sp_help 'testTBL1';

select * from BikeStores.sales.order_items;
select * from ShopDB.dbo.memberTbl;

-- sales.order_item ���� 
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);

insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items;

-- Update 
select * from testTBL1;

update testTBL1 
	SET userName = '���ؼ�',
		age = 29
 where id = 18;

 DELETE from testTBL1

select * from BikeStores.sales.customers
	where phone is not null and last_name like 'S%' and state = 'NY'
 order by first_name 
	