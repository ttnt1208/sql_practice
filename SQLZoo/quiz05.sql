-- Platform: w3resource
-- Difficulty: easy
-- Link: https://sqlzoo.net/wiki/SUM_and_COUNT_Quiz
bbc(name, region, area, population, gdp)

--1.Select the statement that shows the sum of population of all countries in 'Europe'
select sum(population)
from bbc
where region = 'Europe'

--2. Select the statement that shows the number of countries with population smaller than 150000
select count(name)
from bbc 
where population < 150000 