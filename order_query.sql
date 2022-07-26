USE SAMPLEDB
GO

-- Soyisme g�re alfabetik s�rada gelir.
SELECT last_name, 
		first_name
FROM hcm.employees
ORDER BY last_name;

--Soyisme g�re alfabetik s�ran��n tersinde gelir.
SELECT last_name, 
		first_name
FROM hcm.employees
ORDER BY last_name DESC;
--�devlerdeki challenge lar
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