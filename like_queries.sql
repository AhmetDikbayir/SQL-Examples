use SAMPLEDB

-- ��inde as bo�luk an dizimi ge�en �r�nleri getiren kod
SELECT * FROM oes.product_categories where category_name LIKE '%as_an%'

-- T�RLER�N B�L�MSEL �S�MLER�N�N ���NDE 'R' HARF� GE�ENLER� L�STELEYEN KOD
select * from bird.antarctic_species where scientific_name LIKE '%R%'

SELECT * FROM hcm.countries WHERE country_name LIKE 'N%';

SELECT first_name, last_name, email FROM oes.customers WHERE email LIKE '%gmail%';

SELECT product_name FROM oes.products WHERE product_name LIKE '%mouse%';

SELECT * FROM oes.products WHERE product_name LIKE '%[0-9]';