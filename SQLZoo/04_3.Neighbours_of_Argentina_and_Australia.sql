-- Platform: w3resource
-- Problem: 3 
-- Difficulty: easy
-- Link: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

select name, continent 
from world
where continent in (
select continent
from world 
where name = 'Argentina' or name = 'Australia') 
order by name; 
