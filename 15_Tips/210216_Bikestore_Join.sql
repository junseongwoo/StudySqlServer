USE BikeStores;
go
/*
-- 자전거 리스트 확인
SELECT p.product_id, p.product_name, /*p.brand_id*/
       b.brand_name, 
	   ct.category_name, /*p.category_id,*/
	   format(p.list_price * 1102.5, '#,#.# 원') as list_price, p.model_year
  FROM production.products as p
 INNER JOIN production.categories as ct
    ON p.category_id = ct.category_id
 INNER JOIN production.brands as b
    ON p.brand_id = b.brand_id;

-- 
*/

SELECT od.order_id, od.customer_id, concat(ct.first_name, ' ', ct.last_name) as full_name,
	   case od.order_status
		when 1 then '주문완료'
		when 2 then '결제완료'
		when 3 then '배송전'
		when 4 then '배송완료'
		else ' 이상상태'
	   end as '주문단계',
	   od.order_date, od.required_date, 
	   od.shipped_date, 
	   od.store_id, sr.store_name,
	   od.staff_id, concat(st.first_name, ' ', st.last_name) as staff_name
  FROM sales.orders as od
 INNER JOIN sales.customers as ct
	ON od.customer_id = ct.customer_id
 INNER JOIN sales.staffs as st
    ON od.staff_id = st.staff_id
 INNER JOIN sales.stores as sr
    ON od.store_id = sr.store_id