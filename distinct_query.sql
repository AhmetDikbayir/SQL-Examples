USE SAMPLEDB
GO
/*
kolondaki verilerin sadece bir defa g�r�nmesini sa�lar.
*/
SELECT DISTINCT city
FROM hcm.employees;

/*
	E�er selecte birden fazla de�er girilirse onun kombinasyonlar�n� verir.
*/
SELECT DISTINCT city, state_province
FROM hcm.employees;

-- Locality deki tekil olan durumlar�n �a�r�lmas�:
SELECT DISTINCT locality
FROM bird.antarctic_populations;

--hem locality hem de t�r id lerine g�re tekil verilerin �a�r�lmas�:
SELECT DISTINCT locality, species_id
FROM bird.antarctic_populations;