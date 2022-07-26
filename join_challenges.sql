USE SAMPLEDB
SELECT *
FROM hcm.employees
WHERE department_id IS NULL;

SELECT *
FROM hcm.departments

-- Çalýþanlarýn id leri, ismi soyismi maaþý ve bölümünü gösteren kod
SELECT e.employee_id, 
e.first_name, 
e.last_name, 
e.salary, 
d.department_name
FROM hcm.employees e INNER JOIN hcm.departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id;

-- Herhangi bir bölümü olmayan kiþilerin id leri isim soyisim ve maaþlarýný gösteren kod
SELECT e.employee_id, 
e.first_name, 
e.last_name, 
e.salary, 
d.department_name
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON e.department_id = d.department_id;

-- Bölümlerde çalýþan personellerin toplam sayýlarýný gösteren kod(Ayný zamanda herhangi bir bölümü olmayanlarý da gösterecek)
SELECT d.department_name, COUNT(*) AS total_calisan
FROM hcm.employees e LEFT JOIN hcm.departments d
ON d.department_id = e.department_id
GROUP BY d.department_name;






