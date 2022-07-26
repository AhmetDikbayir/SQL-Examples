use SAMPLEDB

select *
from bird.california_sightings

select *
from bird.arizona_sightings

--Birleþtirme yaparken FROM dan sonra kýsaltma yapabiliriz.
SELECT bc.common_name, ba.common_name
FROM bird.california_sightings bc LEFT JOIN bird.arizona_sightings ba
ON bc.common_name = ba.common_name;