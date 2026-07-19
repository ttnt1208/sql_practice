-- Platform: w3resource
-- Difficulty: easy
-- Link: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

world(name, continent, area, population, gdp)

--2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name 
from world
where continent = 'Europe' and gdp/population >
(select gdp/population
from world
where name = 'United Kingdom')

--3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
select name, continent 
from world
where continent in (
select continent
from world 
where name = 'Argentina' or name = 'Australia') 
order by name 

--4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
select name, population
from world 
where population > 
(select population
from world 
where name = 'United Kingdom') 
and population <
(select population
from world
where name = 'Germany')

--5. 
