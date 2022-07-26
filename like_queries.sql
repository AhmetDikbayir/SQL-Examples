use SAMPLEDB

-- Ýçinde as boþluk an dizimi geçen ürünleri getiren kod
SELECT * FROM oes.product_categories where category_name LIKE '%as_an%'

-- TÜRLERÝN BÝLÝMSEL ÝSÝMLERÝNÝN ÝÇÝNDE 'R' HARFÝ GEÇENLERÝ LÝSTELEYEN KOD
select * from bird.antarctic_species where scientific_name LIKE '%R%'

SELECT * FROM hcm.countries WHERE country_name LIKE 'N%';

SELECT first_name, last_name, email FROM oes.customers WHERE email LIKE '%gmail%';

SELECT product_name FROM oes.products WHERE product_name LIKE '%mouse%';

SELECT * FROM oes.products WHERE product_name LIKE '%[0-9]';