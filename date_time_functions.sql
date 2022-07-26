USE SAMPLEDB

--sistemin kulland��� zaman� tarih ve zaman olarak iki farkl� �ekilde d�zenleyebiliriz.
SELECT CAST(SYSDATETIME() AS DATE)
SELECT CAST(SYSDATETIME() AS TIME)

--UTC datetime �ekmek i�in yaz�lan kod
SELECT GETUTCDATE() AS utc_datetime, SYSUTCDATETIME() AS sys_utc_datetime

--�al��anlar�n i�e ba�lad�klar� aylar� y�llar� ve g�nleri veren kod
-- Datepart fonksiyonu tarihi par�alar
--Datename fonksiyonu tarihte aylar�n isimlerini yazar.
SELECT first_name, last_name, hire_date,
DATEPART(month, hire_date) AS mont,
DATENAME(month, hire_date) AS hire_month,
DATENAME(year, hire_date) AS hire_year
FROM hcm.employees;

--�al��an ki�inin i�e ba�lama tarihinin y�l�n� veren kod
SELECT 
	DATEPART(year, hire_date) AS hire_year,
	COUNT(*) AS hire_count
FROM hcm.employees
GROUP BY DATEPART(year, hire_date)

--�al��an ki�inin i�e ba�lama tarihine 5 y�l/ay ekleyen kod
SELECT *,
DATEADD(year, -5, hire_date) AS month_later
FROM hcm.employees;

--DATEDIFF fonksiyonu belli bir tarih ile di�er tarih aras�ndaki fark� g�sterir.
-- �stenilen de�ere g�re sonu�lar� g�sterir. �rne�in; Y�l, Ay, G�n 
SELECT first_name, last_name,
DATEDIFF(day, hire_date, CURRENT_TIMESTAMP) AS current_hire_year
FROM hcm.employees