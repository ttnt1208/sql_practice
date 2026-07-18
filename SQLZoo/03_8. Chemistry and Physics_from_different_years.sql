-- Platform: w3resource
-- Problem: 8 
-- Difficulty: Easy
-- Link: https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial

select * 
from nobel 
where (subject = 'Physics' and yr =1980) or (subject = 'Chemistry' and yr = 1984); 

