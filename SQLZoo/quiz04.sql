-- Platform: w3resource
-- Difficulty: medium 
-- Link: https://sqlzoo.net/wiki/Nested_SELECT_Quiz

bbc(name, region, area, population, gdp)

--1. Select the code that shows the name, region and population of the smallest country in each region
select name, region, population 
from bbc x
where population <= all  
(select population
from bbc y 
where x.region = y.region and population >0) 

--2. Select the code that shows the countries belonging to regions with all populations over 50000
select name, region, population 
from bbc x
where 50000 < all 
(select population 
from bbc y 
where x.region = y.region and y.population >0)

--3.  Select the code that shows the countries with a less than a third of the population of the countries around it
select name, region 
from bbc x 
where population < all 
(select population/3 
from bbc y 
where x.region = y.region and x.name <> y.name)

--4. Select the result that would be obtained from the following code:

--5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
select name 
from bbc 
where gdp > all 
(select max(gdp) 
from bbc
where region ='Africa')

--6.Select the code that shows the countries with population smaller than Russia but bigger than Denmark
select name
from bbc
where population < (select population from bbc where name = 'Russia') and
population > (select population from bbc where name 'Denmark')  
