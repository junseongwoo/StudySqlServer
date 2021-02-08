use sqlDB
go

select * from userTbl
 where addr = '���ȣ';

 -- 1970�� ���� ���, Ű 182 �̻��� ��� �߿� ID�� �̸��� ��ȸ 

select userID, userName, height from userTbl
	where birthYear >= 1970 
		and height >= 182;

-- 1970�� ���� ����̰ų� Ű�� 182�̻� �� ����� ��� 

select userID, userName, height from userTbl
	where birthYear >= 1970 
		or height >= 182;


-- Ű�� 180~183 ������ ����� ��ȸ 
select userID, userName, height from userTbl
	where height >= 180 
		and height <= 183;
-- between ~ and 
select userID, userName, height from userTbl
	where height between 180 and 183; 


-- ������ �泲, ����, ��� 
select userID, userName, addr from userTbl
	where addr = '�泲' 
		or addr = '����'
		or addr = '���';

select userID, userName, addr from userTbl
	where addr in ('�泲', '����', '���');

-- like�� 
select userID, userName, addr from userTbl
	where userName like '��%';

-- subquery 
select userName, height from userTbl
	where height > 
	( select height from userTbl where userName = '���ȣ' );

select userName, height from userTbl
	where height > all
	( select height from userTbl where addr = '�泲' );

select userName, height from userTbl
	where height in
	( select height from userTbl where addr = '�泲' );

-- order by ����
select userName, mDate 
	from userTbl
 order by mDate desc; --asc( �������� ) desc ( �������� )

select * 
	from userTbl
  order by userID desc;

-- distinct 
select addr
	from userTbl;

select distinct addr 
	from userTbl;

select top(3) *
	from userTbl
 order by mDate desc;

--offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
	from userTbl
 order by birthYear
offset 4 rows;

-- ����
select * into buyTbl2 from buyTbl;
select userID, prodname into buyTbl3 from buyTbl

--- GROUP BY
select userID, amount 
	from buyTbl
 order  by userID;

select userID, sum(prodName) as '�հ�'
	from buyTbl
 group by userID;

-- min,max
select min(height) as '�ּ�Ű'
	from userTbl;

select max(height) as 'ūŰ'
	from userTbl

select userName as '�̸�', userID as '���̵�', min(height) as '����Ű', max(height) as 'ūŰ' 
	from userTbl
 group by userName,userID;

select userID, userName 
	from userTbl
 where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl)

-- �� ������ ����
select count(*) as 'ȸ����' from userTbl;
select count(*) as '���ų�����' from buyTbl;