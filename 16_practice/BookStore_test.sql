USE BookRentalShopDB
GO

/*-- 실제 회원정보 불러오기 이름순
SELECT memberID, memberName, levels, mobile, email
  FROM MemberTBL
 WHERE levels <> 'S'
 ORDER BY levels asc, memberName asc;
 
 -- 책정보
SELECT cateIdx,bookName, author, 
       interpreter, company, price
  FROM booksTBL
 ORDER BY price desc;

SELECT *
  FROM cateTBL; */

-- 시스템 함수사용 쿼리
/*SELECT memberID, 
	   concat(right(memberName, 2), ' ', left(memberName, 1)) as '회원이름', 
	   dbo.ufn_getLevel(levels) as '회원레벨',
	   mobile, 
	   upper(email) as '이메일'
  FROM MemberTBL
 WHERE levels <> 'S'
 ORDER BY levels, memberName; 

-- 책 정보, 시스템 함수, 포멧 함수 쿼리
SELECT bookIdx
     , cateIdx
     , concat(N'책제목 > ',bookName) as bookName
     , author
     , isnull(interpreter, '(역자없음)') as 번역가
     , company
     , format(releseDate, 'yyyy년 MM월 dd일') as '출판일'
     , format(price, '#,#원') as 가격
  FROM booksTBL*/

---- 책정보 조인
/*SELECT b.bookIdx
     , b.cateIdx
	 , c.cateName-     
	 , b.bookName
     , b.author
     , b.interpreter
     , b.company
  FROM booksTBL as b
 INNER JOIN cateTBL as c
    ON c.cateIdx = b.cateIdx;*/
 
-- 대여된 책의 정보 쿼리 조인
SELECT r.rentalIdx
     , m.memberName
     --, r.bookIdx
	 , b.bookName
     , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
     , isnull(format(r.returnDt, 'yyyy-MM-dd'), '미반납') as '반납일'
     , dbo.ufn_getState(r.rentalState) as '상태'
  FROM rentalTBL as r 
 INNER JOIN booksTBL as b
    ON r.bookIdx = b.bookIdx
 INNER JOIN MemberTBL as m
    ON m.memberIdx = r.memberIdx 
 --WHERE r.returnDt is null


-- 책을 안빌린 회원 조회
/*SELECT r.rentalIdx
     , m.memberName
	 , b.bookName
     , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
     , dbo.ufn_getState(r.rentalState) as '상태'
  FROM rentalTBL as r 
 RIGHT OUTER JOIN booksTBL as b
    ON r.bookIdx = b.bookIdx
 RIGHT OUTER JOIN MemberTBL as m
    ON m.memberIdx = r.memberIdx 
 WHERE r.memberIdx is null

-- 우리 책 대여점에 없는 장르
SELECT c.cateIdx, c.cateName, b.bookName
  FROM cateTBL as c
  left OUTER JOIN booksTBL as b
    ON c.cateIdx = b.cateIdx

SELECT c.cateIdx, c.cateName, b.bookName
  FROM cateTBL as c
 INNER JOIN booksTBL as b
    ON c.cateIdx = b.cateIdx */