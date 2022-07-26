USE SAMPLEDB

--1. En ucuz olan ürünü seçen kod
SELECT product_id, 
	   product_name, 
	   list_price, 
	   category_id
FROM oes.products
WHERE list_price = (SELECT 
						MIN(list_price)
					FROM oes.products
					);

--2. Her ürün kategorisindeki en ucuz ürünü veren kod
SELECT p.product_id, 
	   p.product_name, 
	   p.list_price, 
	   p.category_id
FROM oes.products p
WHERE list_price = (SELECT 
						MIN(list_price)
					FROM oes.products p2
					WHERE p2.category_id = p.category_id				
					);
--3. Her kategorideki en ucuz ürünü INNER JOIN ile elde eden kod
SELECT p1.product_id, 
	   p1.product_name, 
	   p1.list_price, 
	   p1.category_id
FROM oes.products p1 
INNER JOIN (
			 SELECT 
				category_id,
				MIN(list_price) as min_list_price
			 FROM oes.products
			 GROUP BY category_id
			 ) p2
ON p1.category_id = p2.category_id
AND p1.list_price = p2.min_list_price
--4. Yukarýdaki sonuca COMMON TABLE EXPRESSION ile elde etmeyi deneyin
WITH cheapest_product_by_category AS
(
	SELECT 
		category_id,
	    MIN(list_price) as min_list_price
	FROM oes.products
	GROUP BY category_id
)
SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id
FROM oes.products p
INNER JOIN cheapest_product_by_category p2
ON p.category_id =p2.category_id 
AND p.list_price = p2.min_list_price;

--5. En ucuz ürünlerin kategori isimlerinin de olduðu bir sorgu yazýn

WITH cheapest_product_by_category AS 
(
	SELECT 
		category_id,
		MIN(list_price) AS min_list_price
	FROM oes.products
	GROUP BY category_id
)
SELECT p.category_id, 
	   p.product_id, 
	   p.product_name, 
	   pc.category_name
FROM oes.products p 
INNER JOIN oes.product_categories pc
ON p.category_id = pc.category_id
INNER JOIN cheapest_product_by_category p2
ON p2.category_id = p.category_id
AND p.list_price = p2.min_list_price;
--6. Daha önce hiç sipariþ yapmamýþ olan çalýþanlarý veren kod
SELECT e.employee_id, 
	   e.first_name, 
	   e.last_name
FROM hcm.employees e
WHERE employee_id NOT IN (SELECT employee_id
						  FROM oes.orders o
						  WHERE o.employee_id IS NOT NULL)
-- 7. Daha önce hiç sipariþ yapmamýþ olan çalýþanlarý NOT EXISTS ile veren kod
SELECT e.employee_id, 
	   e.first_name, 
	   e.last_name
FROM hcm.employees e
WHERE NOT EXISTS (SELECT employee_id
				  FROM oes.orders o
				  WHERE e.employee_id=o.employee_id)
--8. PBX Smart Watch 4 ürününü alan müþterilerin müþteri no, isim, soyisim ve e-mail adreslerini getrien kod

SELECT c.customer_id, 
	   c.first_name, 
	   c.last_name, 
	   c.email
FROM oes.customers c
WHERE c.customer_id IN( SELECT o.customer_id
						FROM oes.orders o
						JOIN oes.order_items oi
						ON oi.order_id = o.order_id
						JOIN oes.products p
						ON p.product_id = oi.product_id
						WHERE product_name = 'PBX Smart Watch 4');






