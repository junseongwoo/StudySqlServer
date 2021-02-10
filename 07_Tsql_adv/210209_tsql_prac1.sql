use sqlDB;
go

declare @myVar1 INT;
declare @myVar2 SMALLINT, @myvar3 DECIMAL(10,5);
declare @myVar4 NCHAR(20);

SET @myVar1 = 5; 
SET @myVar2 = 3; 
SET @myvar3 = 3.14
SET @myVar4 = '가수 이름 ==> ';

select @myVar1; 

SELECT '값은' + CAST(@MYVAR3 AS VARCHAR);
select @myVar2;
select @myVar3;
select @myVar4, userName from userTbl;

declare @myVar5 tinyint;
set @myvar5 = 3;

select @@VERSION;
select top(@myvar5) userName, height from userTbl order by height desc;



-- 형 변환 함수 
select convert(float, amount) from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl;
select avg(convert(float, amount)) as '평균구매개수' from buyTbl;
select price, amount, price/amount as [단가/수량] from buyTbl; 


-- YYYY년 M월 D일 : 제대로 적어야 PARSE AS DATE로 바뀜 
SELECT PARSE('2021년 2월 9일' as date);

-- TRY는 값이 정확하지 않아도 NULL 값을 받음. 
SELECT TRY_PARSE('2021년 20월 93일' as date); 
SELECT PARSE('123.45' AS INT); -- 에러 int형으로 받았기 때문 
SELECT PARSE('123.45' AS decimal(5,2));
SELECT TRY_PARSE('123.45' AS INT);


--- 스칼라함수 (단일 리턴 함수)

SELECT GETDATE() as '현재날짜'; 

SELECT YEAR(getdate()) as '금년';
SELECT month(getdate()) as '이번달';
SELECT day(getdate()) as '오늘일';

select aBS(-100);
SELECT round(3.1415, 3);
select round(1234.5678, -2);

select rand() * 100;
select cast((rand() * 100) as int);

select iif(20>10, '참', '거짓');
select iif(20<10, '참', '거짓');

---- 문자열 함수
-- 사용도가 낮음
select ascii('a'), ascii('A');
select CHAR(98), CHAR(66);
SELECT UNICODE('다');
select nchar(45768);

-- 진짜 많이 쓰이는것 
-- 문자열 결합
select CONCAT('SQL ', 'SERVER ', 2019);

--문자열 시작 위치 리턴
SELECT CHARINDEX('Server', 'SQL SERVER 2019');

-- left, right
select left('SQL Server 2019', 3), right('SQL Server 2019', 15);

-- substring 
select substring('Hello world!', 7,5);
select SUBSTRING('안녕하세요, SQL서버입니다!', 11, 2);

-- LEN
select len('안녕하세요'), len('hello world!');

--lower, upper
select lower('asdgQWE'), upper('asdqweASDZXC')

-- ltrim, rtrim 
select len(ltrim('   Hello World!   ')), 
	   len(rtrim('   Hello World!   ')), 
	    len(trim('   Hello World!   '));

select replace('(2016년 발표) SQL Server 2016', '2016', '2019');


--- 정말정말 많이 쓰는 함수 
select format(getdate(), '');
select format(getdate(), 'dd//MM//yyyy');
select format(getdate(), 'yyyy-MM--dd hh:mm:ss:ms');
select format(getdate(), 'yyyy-MM--dd hh:mm:ss:ms');
select format(getdate(), 'hh:mm:ss');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');

declare @myPrac1 nvarchar(20);
set @myPrac1 = CONCAT('Hi', ',' ,' i am', ' junseong');
select @myPrac1;
select upper(@myPrac1), replace(@myPrac1, 'HI', 'Hello');
select LEFT(@myPrac1, 4), RIGHT(@myPrac1, 8)