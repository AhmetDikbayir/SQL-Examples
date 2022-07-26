use SAMPLEDB

-- total number of each deaprtment
SELECT department_id, COUNT(department_id)
FROM hcm.employees 
GROUP BY department_id;

---Her bölümdeki çalýþanlarýn maaþ ortalamasýný büyükten küçüðe doðru sýralamak
SELECT department_id, AVG(salary) AS avg_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY avg_salary DESC;

---Warehouse id lerine göre elinde bulundurduklarý ürünleri toplamýný veren ve elinde 5000 den fazla ürün bulunan warehouselarý veren kod
SELECT warehouse_id, SUM(quantity_on_hand) AS total_product 
FROM oes.inventories
GROUP BY warehouse_id 
HAVING sum(quantity_on_hand)>5000;

--Bölgelere göre en son sayýmýn yapýldýðý tarihi veren kod
SELECT locality, MAX(date_of_count) as Last_call
FROM bird.antarctic_populations
GROUP BY locality

---
SELECT species_id, locality, MAX(date_of_count) AS date_of_rec_pop_count
FROM bird.antarctic_populations
GROUP BY species_id, locality;
