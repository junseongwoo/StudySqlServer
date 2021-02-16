select u.userID, u.userName, u.birthYear, u.addr, u.height, b.prodName, b.price
  from userTbl as u
 inner join buyTbl as b 
    on u.userID = b.userID
 where u.height > 160
   for json auto;
 -- where height > any (select height from userTbl where addr = '부산')