USE SAMPLEDB

--sistemin kullandýðý zamaný tarih ve zaman olarak iki farklý þekilde düzenleyebiliriz.
SELECT CAST(SYSDATETIME() AS DATE)
SELECT CAST(SYSDATETIME() AS TIME)

--UTC datetime çekmek için yazýlan kod
SELECT GETUTCDATE() AS utc_datetime, SYSUTCDATETIME() AS sys_utc_datetime

--Çalýþanlarýn iþe baþladýklarý aylarý yýllarý ve günleri veren kod
-- Datepart fonksiyonu tarihi parçalar
--Datename fonksiyonu tarihte aylarýn isimlerini yazar.
SELECT first_name, last_name, hire_date,
DATEPART(month, hire_date) AS mont,
DATENAME(month, hire_date) AS hire_month,
DATENAME(year, hire_date) AS hire_year
FROM hcm.employees;

--Çalýþan kiþinin iþe baþlama tarihinin yýlýný veren kod
SELECT 
	DATEPART(year, hire_date) AS hire_year,
	COUNT(*) AS hire_count
FROM hcm.employees
GROUP BY DATEPART(year, hire_date)

--Çalýþan kiþinin iþe baþlama tarihine 5 yýl/ay ekleyen kod
SELECT *,
DATEADD(year, -5, hire_date) AS month_later
FROM hcm.employees;

--DATEDIFF fonksiyonu belli bir tarih ile diðer tarih arasýndaki farký gösterir.
-- Ýstenilen deðere göre sonuçlarý gösterir. Örneðin; Yýl, Ay, Gün 
SELECT first_name, last_name,
DATEDIFF(day, hire_date, CURRENT_TIMESTAMP) AS current_hire_year
FROM hcm.employees