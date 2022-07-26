USE SAMPLEDB
GO

-- Fiyatý 100 den büyük olanlarý seçen
SELECT *
FROM oes.products
WHERE list_price >100;

--gönderilmemiþ olan siperiþleri gösteren kod
SELECT *
FROM oes.orders
WHERE shipped_date IS NULL;

--sipariþ tarihi 26/02/2020 olan sipariþler
SELECT *
FROM oes.orders
WHERE order_date = '20200226';


-- 01/01/2020 den sonra sipariþ verilenleri gösteren kod
SELECT *
FROM oes.orders
WHERE order_date>'20200101';



