SELECT * FROM userTbl;
select * from buyTbl;

select * from usertbl where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

SELECT * FROM buyTbl where userID = 'BBK';


-- INNER JOIN
select * from buyTbl
	from buyTBL
		inner join userTBL
			ON buyTBL.userID = userTBL.userID



select u.userName, u.addr, 
	   concat(u.mobile1,'-', left(u.mobile2,4), '-', right(u.mobile2,4)) as mobile,
	   b.prodName, b.price, b.amount
	from buyTbl as b
		inner joIn userTBL as u
			ON b.userID = u.userID
	where b.userID = 'JYP';