/*select * from stdTbl;
select * from clubTbl;
select * from clubRegTBL;*/

-- standard SQL
SELECT s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s 
 inner join clubRegTbl as r
	on s.id = r.std_id
 inner join clubTbl as c 
	on r.club_id = c.id;

-- inner join 약식 (SQL Server T-SQL)
SELECT s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s, clubRegTbl as r, clubTbl as c 
 where s.id = r.std_id
   and r.club_id = c.id;

-- OUTER join 외부조인 
SELECT s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s 
 left outer join clubRegTbl as r
	on s.id = r.std_id
 left outer join clubTbl as c 
	on r.club_id = c.id;

-- userTBL / buyTBL
SELECT u.userName, u.addr, b.prodName, b.price
   FROM userTbl as u 
  inner join buyTbl as b 
     on u.userID = b.userID;

SELECT u.userName, u.addr, b.prodName, b.price
   FROM userTbl as u 
   right outer join buyTbl as b 
     on u.userID = b.userID;

SELECT * FROM buyTbl