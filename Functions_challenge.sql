USE SAMPLEDB

--1. Çalýþanlarýn isim ve soyisimlerini birleþtirin
SELECT 
	employee_id,
	first_name,
	last_name,
	first_name + ' '+ last_name AS employee_name
FROM hcm.employees;

--1. Çalýþanlarýn isim ve soyisimlerini CONCAT fonksiyonu ile birleþtirin
SELECT 
	employee_id,
	first_name, 
	last_name,
	CONCAT(first_name, ' ', last_name) AS employee_name
FROM hcm.employees;

--2. Çalýþanlarýn ilk ikinci ve soyisimlerini birleþtirin
SELECT 
	employee_id,
	first_name,
	middle_name,
	last_name,
	CONCAT(first_name, ' ' + middle_name, ' ', last_name) AS full_name
FROM hcm.employees;

--3. Antartika türlerinden bilimsel adlarýný seçen kod
SELECT 
	scientific_name,
	LEFT(scientific_name, CHARINDEX(' ', scientific_name)-1) AS genus_name
FROM bird.antarctic_species;

--4. Türlerin tür isimlerini veren kodu yazýn
SELECT 
	scientific_name,
	SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name)+1, LEN(scientific_name)) AS species_name
FROM bird.antarctic_species;

--5. Çalýþanlarýn yaþýný veren kodu yazýn
SELECT 
	employee_id, 
	first_name, 
	last_name, 
	birth_date,
	DATEDIFF(year, birth_date, CURRENT_TIMESTAMP) AS employee_age
FROM hcm.employees;

--6. Sipariþlerin 7 gün sonrasýna tahmini teslim günü olan bir kolon oluþturun
SELECT 
	order_id, 
	order_date,
	DATEADD(day, 7, order_date) AS estimeated_shipping_date
FROM oes.orders
WHERE shipped_date IS NULL;

--7. Þirketlerin sipariþleri ortalama gönderme sürelerini gösteren kod

SELECT 
	s.company_name, 
	AVG(DATEDIFF(day,  o.order_date, o.shipped_date)) AS avg_shipping_date
FROM oes.orders o 
INNER JOIN oes.shippers s
ON o.shipper_id = s.shipper_id
GROUP BY s.company_name;