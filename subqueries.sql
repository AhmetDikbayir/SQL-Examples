USE SAMPLEDB

--Müþterilerin en fazla alýþveriþ tutarlarýný getiren kod
/*SELECT order_id, order_date, customer_id, freight_cost
FROM oes.orders o1
WHERE freight_cost =  (
						SELECT MAX(freight_cost)
						FROM OES.orders o2
						WHERE o1.customer_id = o2.customer_id
						) 
ORDER BY o1.customer_id

--Envanterde olan sipariþ edilen ürünleri kod
SELECT order_id, product_id, quantity
FROM oes.order_items oi
WHERE EXISTS (
				SELECT *
				FROM oes.inventories i
				WHERE oi.product_id=i.product_id
				)
ORDER BY oi.product_id;

--Yukarýdaki kod ile ayný sonucu veriyor.
SELECT order_id, product_id, quantity
FROM oes.order_items
WHERE product_id IN (
				SELECT product_id
				FROM oes.inventories				
				)
ORDER BY product_id;

--Arizona'da bulunan ve ayný zamanda California da da bulunan kuþ türlerini veren kod
SELECT sighting_id, common_name,sighting_date
FROM bird.arizona_sightings a
WHERE a.common_name IN(
				SELECT c.common_name
				FROM bird.california_sightings c				
				);

SELECT e1.department_id, e1.first_name, e1.last_name, e1.salary
FROM hcm.employees e1
WHERE e1.salary = (
				SELECT MIN(salary)
				FROM hcm.employees e2
				WHERE e1.department_id=e2.department_id
				);

SELECT count(*)
FROM oes.customers
WHERE city = (SELECT city 
			  FROM oes.customers
			  GROUP BY city)

SELECT *
FROM oes.products p
WHERE EXISTS (SELECT*
			  FROM oes.product_categories pc
			  WHERE p.category_id = pc.category_id AND pc.category_id>5);*/

SELECT e.employee_id, e.first_name, e.last_name, e.salary, job_id
FROM hcm.employees e
WHERE salary > 40000 AND first_name LIKE 'S%' AND EXISTS (SELECT job_id
									FROM hcm.jobs
									WHERE job_id >5 )
ORDER BY salary;

SELECT * 
FROM hcm.locations


