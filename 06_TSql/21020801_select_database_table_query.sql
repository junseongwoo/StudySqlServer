use sqlDB
go

select * from userTbl
 where addr = '김경호';

 -- 1970년 이후 출생, 키 182 이상인 사람 중에 ID와 이름만 조회 

select userID, userName, height from userTbl
	where birthYear >= 1970 
		and height >= 182;

-- 1970년 이후 출생이거나 키가 182이상 인 사람들 모두 

select userID, userName, height from userTbl
	where birthYear >= 1970 
		or height >= 182;


-- 키가 180~183 사이인 사람만 조회 
select userID, userName, height from userTbl
	where height >= 180 
		and height <= 183;
-- between ~ and 
select userID, userName, height from userTbl
	where height between 180 and 183; 


-- 지역이 경남, 전남, 경북 
select userID, userName, addr from userTbl
	where addr = '경남' 
		or addr = '전남'
		or addr = '경북';

select userID, userName, addr from userTbl
	where addr in ('경남', '전남', '경북');

-- like문 
select userID, userName, addr from userTbl
	where userName like '김%';

-- subquery 
select userName, height from userTbl
	where height > 
	( select height from userTbl where userName = '김경호' );

select userName, height from userTbl
	where height > all
	( select height from userTbl where addr = '경남' );

select userName, height from userTbl
	where height in
	( select height from userTbl where addr = '경남' );

-- order by 정렬
select userName, mDate 
	from userTbl
 order by mDate desc; --asc( 오름차순 ) desc ( 내림차순 )

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

--offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
	from userTbl
 order by birthYear
offset 4 rows;

-- 복사
select * into buyTbl2 from buyTbl;
select userID, prodname into buyTbl3 from buyTbl

--- GROUP BY
select userID, amount 
	from buyTbl
 order  by userID;

select userID, sum(prodName) as '합계'
	from buyTbl
 group by userID;

-- min,max
select min(height) as '최소키'
	from userTbl;

select max(height) as '큰키'
	from userTbl

select userName as '이름', userID as '아이디', min(height) as '작은키', max(height) as '큰키' 
	from userTbl
 group by userName,userID;

select userID, userName 
	from userTbl
 where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl)

-- 총 데이터 개수
select count(*) as '회원수' from userTbl;
select count(*) as '구매내역수' from buyTbl;