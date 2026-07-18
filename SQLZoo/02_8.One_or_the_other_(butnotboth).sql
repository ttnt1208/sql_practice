-- Platform: w3resource
-- Problem: 8 
-- Difficulty: Easy
-- Link: https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial


---xor 
select name, population, area 
from world
where (area > 3000000 or population > 250000000) and not (area > 3000000 and population > 250000000);  

