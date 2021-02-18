insert into booksTBL
(
	cateIdx,
	bookName,
	author,
	company,
	releseDate,
	ISBN,
	price
)
VALUES
(
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
);

-- 위 INSERT 중 설명, 등록일자 수정
begin tran;

SELECT *
  FROM booksTBL;

UPDATE booksTBL
   SET descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
     , regDate = '2021-02-18' 
 WHERE bookIdx = 17

rollback;
commit;


BEGIN TRAN;
-- 카테고리 입력
insert into cateTBL values ('I0001', '대화/협상'),
						   ('I0002', '성공/처세'),
						   ('I0003', '시간관리');

ROLLBACK;
COMMIT;

SELECT *
  FROM cateTBL

-- 카테고리 삭제

BEGIN TRAN;

delete from cateTbl where cateIdx = 'I0003';

ROLLBACK;
COMMIT;