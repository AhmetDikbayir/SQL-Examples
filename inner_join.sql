use SAMPLEDB

select *
from bird.california_sightings

select *
from bird.arizona_sightings

--Birleştirme yaparken FROM dan sonra kısaltma yapabiliriz.
SELECT bc.common_name, ba.common_name
FROM bird.california_sightings bc LEFT JOIN bird.arizona_sightings ba
ON bc.common_name = ba.common_name;