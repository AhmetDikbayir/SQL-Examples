use SAMPLEDB

-- total number of each deaprtment
SELECT department_id, COUNT(department_id)
FROM hcm.employees 
GROUP BY department_id;

---Her b�l�mdeki �al��anlar�n maa� ortalamas�n� b�y�kten k����e do�ru s�ralamak
SELECT department_id, AVG(salary) AS avg_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY avg_salary DESC;

---Warehouse id lerine g�re elinde bulundurduklar� �r�nleri toplam�n� veren ve elinde 5000 den fazla �r�n bulunan warehouselar� veren kod
SELECT warehouse_id, SUM(quantity_on_hand) AS total_product 
FROM oes.inventories
GROUP BY warehouse_id 
HAVING sum(quantity_on_hand)>5000;

--B�lgelere g�re en son say�m�n yap�ld��� tarihi veren kod
SELECT locality, MAX(date_of_count) as Last_call
FROM bird.antarctic_populations
GROUP BY locality

---
SELECT species_id, locality, MAX(date_of_count) AS date_of_rec_pop_count
FROM bird.antarctic_populations
GROUP BY species_id, locality;
