USE SAMPLEDB
GO

-- Fiyat� 100 den b�y�k olanlar� se�en
SELECT *
FROM oes.products
WHERE list_price >100;

--g�nderilmemi� olan siperi�leri g�steren kod
SELECT *
FROM oes.orders
WHERE shipped_date IS NULL;

--sipari� tarihi 26/02/2020 olan sipari�ler
SELECT *
FROM oes.orders
WHERE order_date = '20200226';


-- 01/01/2020 den sonra sipari� verilenleri g�steren kod
SELECT *
FROM oes.orders
WHERE order_date>'20200101';



