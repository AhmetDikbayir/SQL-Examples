USE SAMPLEDB

--1. Ürünlerdeki discontinued kolonuna açýklama ekleyin. Eðer discontinued 1 ise Evet, 0 ise Hayýr ve Boþ ise Unknown yazsýn.
SELECT product_id, product_name, discontinued,
CASE WHEN discontinued = 0 THEN 'No'
	WHEN discontinued = 1 THEN 'Yes'
	ELSE 'Unknown'
	END AS discontinued_description
FROM oes.products;

--2. Ürünlerin fiyatlarýný sýnýflayýn
SELECT product_id, product_name, list_price,
CASE WHEN list_price < 50 THEN 'Low'
	 WHEN list_price BETWEEN 50 AND 249 THEN 'Medium'
	 WHEN list_price >250 THEN 'High'
	 ELSE 'Unknown' 
	 END AS price_grade
FROM oes.products;

--3. Sipariþlerin kargolanma sürelerini kategorilere ayýrýn
SELECT order_id, order_date, shipped_date,
CASE WHEN DATEDIFF(day, order_date, shipped_date)<=7 THEN 'Shipped within one week'
	 WHEN DATEDIFF(day, order_date, shipped_date)>7 THEN 'Shipped over a week later'
	 ELSE 'Not yet shipped' 
	 END AS shipping_status
FROM oes.orders;

--4. Bir önceki soruda ayrýlan sipariþlerin durumlarýnýn toplamýný bulunuz.

SELECT o2.shipping_status, Count(o2.shipping_status)
FROM oes.orders o1
JOIN
(
SELECT order_id, order_date, shipped_date,
CASE WHEN DATEDIFF(day, order_date, shipped_date)<=7 THEN 'Shipped within one week'
	 WHEN DATEDIFF(day, order_date, shipped_date)>7 THEN 'Shipped over a week later'
	 ELSE 'Not yet shipped' 
	 END AS shipping_status
FROM oes.orders) o2
ON o1.order_id = o2.order_id
GROUP BY o2.shipping_status;