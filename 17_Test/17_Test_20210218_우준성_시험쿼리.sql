-- 1-1번

SELECT LOWER(email) AS 'email' , mobile, names, addr
  FROM membertbl
 ORDER BY names desc;

-- 1-2번 

SELECT names, author, releaseDate, price
  FROM bookstbl;

-- 2-1번

SELECT TOP(10)
	   CONCAT(right(Names, 2), ', ',left(names, 1)) AS '변경이름',
	   levels,
	   left(addr, 2) AS '도시',
	   LOWER(email) AS '이메일'
  FROM membertbl;

-- 2-2번

SELECT Idx, 
	   CONCAT('제목 : ', Names) AS 'Names',
	   CONCAT('저자 > ', Names) AS 'Author',
	   ReleaseDate AS '출판일',
	   ISBN, 
	   FORMAT(price, '#,#원') AS '가격' 
  FROM bookstbl
 ORDER BY idx desc;

-- 3-1번

SELECT b.idx AS '번호',
	   b.division AS '장르번호',
	   d.names AS '장르',
	   b.Names AS '책제목',
	   b.Author AS '저자'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE d.Division = 'B002'

-- 3-2번

SELECT m.Names,
	   m.Levels,
	   m.Addr,
	   r.rentalDate
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.idx = r.memberIdx
 WHERE r.rentalDate is null

-- 4-1번
BEGIN TRAN;

SELECT * FROM divtbl;

insert into divtbl values ('I002', '자기개발서');

ROLLBACK;
COMMIT;

-- 4-2번 
BEGIN TRAN; 

SELECT addr,mobile FROM membertbl WHERE idx = 26;

UPDATE membertbl
   SET addr = '부산시 해운대구', 
       mobile = '010-6683-7732' 
 WHERE idx = 26

rollback;
commit;

-- 5번 

SELECT d.names,
       SUM(b.Price) AS '총합계금액'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d 
    ON b.Division = d.Division
 GROUP BY d.Names WITH ROLLUP