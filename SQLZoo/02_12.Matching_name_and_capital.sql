-- Platform: w3resource
-- Problem: 12 
-- Difficulty: Easy
-- Link: https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

select name, capital 
from world 
where (left(name, 1) = left(capital, 1)) <> (name = capital); 
