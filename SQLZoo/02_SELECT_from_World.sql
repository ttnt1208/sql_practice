-- Platform: w3resource
-- Difficulty: Easy
-- Link: https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial


--8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
select name, population, area 
from world
where (area > 3000000 or population > 250000000) and not (area > 3000000 and population > 250000000);  


--9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
select name, round(population/1000000, 2) as pop_in_million, round(gdp/1000000000,2) as gdp_in_billion
from world
where continent = 'South America'; 

--10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
select name, round(gdp/population,-3)
from world
where gdp >= 1000000000000;

--11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE length(name) = length(capital); 

--12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
select name, capital 
from world 
where (left(name, 1) = left(capital, 1)) <> (name = capital); 

--13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
--Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%'
and name LIKE  '%e%'
and name LIKE  '%o%'
and name LIKE  '%u%'
  AND name NOT LIKE '% %'; 

