USE SAMPLEDB

--�r�nlerin ilk isimlerini veren kod
SELECT *,
LEFT(product_name, CHARINDEX(' ', product_name)-1)
FROM oes.products;

--�r�nlerin ilk isimleri hari� di�er isimlerini veren kod
SELECT *,
SUBSTRING (product_name, CHARINDEX(' ', product_name)+1, LEN(product_name))
FROM oes.products;
