USE SAMPLEDB
GO

-- Soyisme göre alfabetik sýrada gelir.
SELECT last_name, 
		first_name
FROM hcm.employees
ORDER BY last_name;

--Soyisme göre alfabetik sýranýýn tersinde gelir.
SELECT last_name, 
		first_name
FROM hcm.employees
ORDER BY last_name DESC;
--Ödevlerdeki challenge lar
SELECT *
FROM hcm.employees
ORDER BY salary DESC;

SELECT * 
FROM hcm.employees
ORDER BY hire_date DESC;


SELECT *
FROM hcm.employees
ORDER BY department_id, salary DESC;

SELECT TOP(10) salary, employee_id, first_name, last_name
FROM hcm.employees
ORDER BY salary DESC;

SELECT TOP(1) WITH TIES employee_id, first_name, last_name, salary
FROM hcm.employees
ORDER BY salary ASC;