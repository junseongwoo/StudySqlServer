use tempdb;
go

create database sqlDB;
go

-- DB 생성

use sqlDB;

create table userTbl -- 회원 테이블 
(
	userID	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 ID  
	Name	NVARCHAR(10) NOT NULL, -- 이름 
	brithYear	INT NOT NULL, -- 출생년도 
	addr	NCHAR(2) NOT NULL, -- 지역
	mobile1		CHAR(3),  -- 휴대폰 국번
	mobile2		CHAR(8),  -- 나머지 휴대전화 번호
	height		smallint, -- 키
	mDate		date -- 회원 가입일 -- 마지막엔 , 하지 않음 
);
go

create table buyTbl
(
	num		int identity not null primary key, --순번(pk)
	userID	char(8) not null				   -- 사용자(FK)
		foreign key references userTbl(userID),
	prodName	nchar(6) not null,			   -- 물품명
	groupName	nchar(4),					   -- 분류
	price	int not null,					   -- 단가
	amount	smallint not null			   -- 수량 
);
go 