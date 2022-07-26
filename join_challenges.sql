USE SAMPLEDB
SELECT *
FROM hcm.employees
WHERE department_id IS NULL;

SELECT *
FROM hcm.departments

-- �al��anlar�n id leri, ismi soyismi maa�� ve b�l�m�n� g�steren kod
SELECT e.employee_id, 
e.first_name, 
e.last_name, 
e.salary, 
d.department_name
FROM hcm.employees e INNER JOIN hcm.departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id;

-- Herhangi bir b�l�m� olmayan ki�ilerin id leri isim soyisim ve maa�lar�n� g�steren kod
SELECT e.employee_id, 
e.first_name, 
e.last_name, 
e.salary, 
d.department_name
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON e.department_id = d.department_id;

-- B�l�mlerde �al��an personellerin toplam say�lar�n� g�steren kod(Ayn� zamanda herhangi bir b�l�m� olmayanlar� da g�sterecek)
SELECT d.department_name, COUNT(*) AS total_calisan
FROM hcm.employees e LEFT JOIN hcm.departments d
ON d.department_id = e.department_id
GROUP BY d.department_name;






