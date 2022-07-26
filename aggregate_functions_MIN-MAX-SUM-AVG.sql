use SAMPLEDB
/*
SELECT * FROM oes.orders ORDER BY freight_cost ASC;

---MIN, MAX, SUM ve AVG fonksiyonlarý ayný þekilde kullanýlýr.
SELECT MIN(freight_cost) FROM oes.orders;

SELECT *
FROM hcm.employees
WHERE department_id=100 AND salary > 184000
ORDER BY salary ASC;

SELECT department_id, SUM(salary) AS 'total_salary'
FROM hcm.employees
GROUP BY department_id

---Meslek ve bölüme göre gruplayýp maaþ ortalamalarýný veren kod
SELECT job_id, department_id, AVG(salary) FROM hcm.employees
GROUP BY job_id, 
department_id;

SELECT department_id, COUNT(*) AS total FROM hcm.employees GROUP BY department_id HAVING COUNT(department_id)>2;

SELECT department_id, count(*) FROM hcm.employees GROUP BY department_id;
*/
