USE SAMPLEDB

--1. �al��anlar�n isim ve soyisimlerini birle�tirin
SELECT 
	employee_id,
	first_name,
	last_name,
	first_name + ' '+ last_name AS employee_name
FROM hcm.employees;

--1. �al��anlar�n isim ve soyisimlerini CONCAT fonksiyonu ile birle�tirin
SELECT 
	employee_id,
	first_name, 
	last_name,
	CONCAT(first_name, ' ', last_name) AS employee_name
FROM hcm.employees;

--2. �al��anlar�n ilk ikinci ve soyisimlerini birle�tirin
SELECT 
	employee_id,
	first_name,
	middle_name,
	last_name,
	CONCAT(first_name, ' ' + middle_name, ' ', last_name) AS full_name
FROM hcm.employees;

--3. Antartika t�rlerinden bilimsel adlar�n� se�en kod
SELECT 
	scientific_name,
	LEFT(scientific_name, CHARINDEX(' ', scientific_name)-1) AS genus_name
FROM bird.antarctic_species;

--4. T�rlerin t�r isimlerini veren kodu yaz�n
SELECT 
	scientific_name,
	SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name)+1, LEN(scientific_name)) AS species_name
FROM bird.antarctic_species;

--5. �al��anlar�n ya��n� veren kodu yaz�n
SELECT 
	employee_id, 
	first_name, 
	last_name, 
	birth_date,
	DATEDIFF(year, birth_date, CURRENT_TIMESTAMP) AS employee_age
FROM hcm.employees;

--6. Sipari�lerin 7 g�n sonras�na tahmini teslim g�n� olan bir kolon olu�turun
SELECT 
	order_id, 
	order_date,
	DATEADD(day, 7, order_date) AS estimeated_shipping_date
FROM oes.orders
WHERE shipped_date IS NULL;

--7. �irketlerin sipari�leri ortalama g�nderme s�relerini g�steren kod

SELECT 
	s.company_name, 
	AVG(DATEDIFF(day,  o.order_date, o.shipped_date)) AS avg_shipping_date
FROM oes.orders o 
INNER JOIN oes.shippers s
ON o.shipper_id = s.shipper_id
GROUP BY s.company_name;