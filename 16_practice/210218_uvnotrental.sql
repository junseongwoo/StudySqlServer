CREATE VIEW uv_notrentalMember

as
SELECT r.rentalIdx
	--, r.memberIdx
	 , m.memberName as 'ȸ�� �̸�'
	 , dbo.ufn_getLevel(m.levels) as 'ȸ�� ���'
	 , c.cateName as 'ī�װ�'
	 , b.bookName as 'å �̸�'
	 , format(r.rentalDt, 'yyyy-MM-dd') as '������'
     , format(r.returnDt, 'yyyy-MM-dd') as '�ݳ���'
	 , dbo.ufn_getState(r.rentalState) as '�������'
  FROM rentalTBL as r
 RIGHT OUTER JOIN MemberTBL as m
    ON r.memberIdx = m.memberIdx
  LEFT OUTER JOIN booksTBL as b
    ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN cateTbl as c 
    ON c.cateIdx = b.cateIdx
 WHERE r.rentalIdx is null;
go