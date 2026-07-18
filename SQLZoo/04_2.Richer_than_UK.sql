-- Platform: w3resource
-- Problem: 2 
-- Difficulty: easy
-- Link: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

select name 
from world
where continent = 'Europe' and gdp/population >
(select gdp/population
from world
where name = 'United Kingdom')

