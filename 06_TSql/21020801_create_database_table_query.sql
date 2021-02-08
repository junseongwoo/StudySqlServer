use tempdb;
go

create database sqlDB;
go

-- DB ����

use sqlDB;

create table userTbl -- ȸ�� ���̺� 
(
	userID	CHAR(8) NOT NULL PRIMARY KEY, -- ����� ID  
	Name	NVARCHAR(10) NOT NULL, -- �̸� 
	brithYear	INT NOT NULL, -- ����⵵ 
	addr	NCHAR(2) NOT NULL, -- ����
	mobile1		CHAR(3),  -- �޴��� ����
	mobile2		CHAR(8),  -- ������ �޴���ȭ ��ȣ
	height		smallint, -- Ű
	mDate		date -- ȸ�� ������ -- �������� , ���� ���� 
);
go

create table buyTbl
(
	num		int identity not null primary key, --����(pk)
	userID	char(8) not null				   -- �����(FK)
		foreign key references userTbl(userID),
	prodName	nchar(6) not null,			   -- ��ǰ��
	groupName	nchar(4),					   -- �з�
	price	int not null,					   -- �ܰ�
	amount	smallint not null			   -- ���� 
);
go 