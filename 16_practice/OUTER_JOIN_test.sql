-- outer join 쿼리 

/*SELECT r.rentalIdx
     --, r.memberIdx
	 , m.memberName as '회원 이름'
	 , dbo.ufn_getLevel(m.levels) as '회원 등급'
	 , b.bookName as '책 이름'
     , format(r.rentalDt, 'yyyy-MM-dd') as '대출일'
     , isnull(format(r.returnDt, 'yyyy-MM-dd'), '대출중') as '반납일'
	 , dbo.ufn_getState(r.rentalState) as '대출상태'
  FROM rentalTBL as r
 INNER JOIN MemberTBL as m
    ON r.memberIdx = m.memberIdx
 INNER JOIN booksTBL as b
    ON r.bookIdx = b.bookIdx; */

SELECT r.rentalIdx
     --, r.memberIdx
	 , m.memberName as '회원 이름'
	 , dbo.ufn_getLevel(m.levels) as '회원 등급'
	 , c.cateName as '카테고리'
	 , b.bookName as '책 이름'
     , format(r.rentalDt, 'yyyy-MM-dd') as '대출일'
     , isnull(format(r.returnDt, 'yyyy-MM-dd'), '대출중') as '반납일'
	 , dbo.ufn_getState(r.rentalState) as '대출상태'
  FROM rentalTBL as r
 RIGHT OUTER JOIN MemberTBL as m
    ON r.memberIdx = m.memberIdx
  LEFT OUTER JOIN booksTBL as b
    ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN cateTbl as c 
    ON c.cateIdx = b.cateIdx
 WHERE r.rentalIdx is not null;