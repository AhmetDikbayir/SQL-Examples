USE SAMPLEDB
GO
/*
kolondaki verilerin sadece bir defa görünmesini saðlar.
*/
SELECT DISTINCT city
FROM hcm.employees;

/*
	Eðer selecte birden fazla deðer girilirse onun kombinasyonlarýný verir.
*/
SELECT DISTINCT city, state_province
FROM hcm.employees;

-- Locality deki tekil olan durumlarýn çaðrýlmasý:
SELECT DISTINCT locality
FROM bird.antarctic_populations;

--hem locality hem de tür id lerine göre tekil verilerin çaðrýlmasý:
SELECT DISTINCT locality, species_id
FROM bird.antarctic_populations;