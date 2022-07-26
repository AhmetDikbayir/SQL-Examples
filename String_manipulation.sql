USE SAMPLEDB

--Ürünlerin ilk isimlerini veren kod
SELECT *,
LEFT(product_name, CHARINDEX(' ', product_name)-1)
FROM oes.products;

--Ürünlerin ilk isimleri hariç diðer isimlerini veren kod
SELECT *,
SUBSTRING (product_name, CHARINDEX(' ', product_name)+1, LEN(product_name))
FROM oes.products;
