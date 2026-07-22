-- Platform: w3resource
-- Difficulty: medium 
-- Link: https://sqlzoo.net/wiki/More_JOIN_operations

movie(id, title, yr, director, budget, gross)
actor(id, name)
casting(movieid, actoried, ord)

--3. List all of the Star Trek movies, include the id, title and yr (all of these movies start with the words Star Trek in the title). Order results by year.
select id, title, yr
from movie
where title like 'Star Trek%'
order by yr 

--6. 
select name 
from actor 
join casting on id = actorid 
join movie on 
movieid = movie.id
where movie.title= 'Casablanca'

--7. 
SELECT name FROM
	actor JOIN casting ON (id = actorid)
	WHERE movieid = (
		SELECT id FROM movie
			WHERE title = 'Alien'
	)

--8. 
select movie.title 
from actor 
join casting on actor.id = casting.actorid 
join movie on casting.movieid = movie.id
where actor.name='Harrison Ford'

--9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select movie.title 
from actor 
join casting on actor.id = casting.actorid 
join movie on casting.movieid = movie.id
where actor.name='Harrison Ford' and ord > 1

--10. 
select distinct movie.title, actor.name
from movie 
join casting on movie.id = casting.movieid
join actor on actor.id = actorid 
where casting.ord =1 and yr =1962

--11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) 
FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE actor.name ='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
--using nested queries 
select title, name
from movie 
join casting on (movie.id = movieid and ord =1)
join actor on (actor.id = actorid)
where movie.id in 
(select movieid 
from casting 
where actorid in 
(select id 
from actor 
where name = 'Julie Andrews'))
--using multiple joins 
select jam.title, laa.name
from casting jac 
join actor jaa on jac.actorid = jaa.id 
join movie jam on jac.movieid = jam.id 
join casting la on (jac.movied = la.movieid and la.ord =1)
join actor laa on (la.actorid = laa.id)
where jaa.name = 'Julie Andrews'

--13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
select name 
from actor 
join casting on actor.id = actorid and ord =1 
group by name
having count(movieid) >=15 

--14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
select title, count(*) 
from movie 
join casting on movie.id = movieid 
where yr = 1978 
group by title
order by count(*) desc, title

--15. List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT name 
  FROM actor 
  JOIN casting ON actor.id=casting.actorid
  WHERE movieid IN(
                   SELECT movieid
                   FROM casting JOIN actor ON actor.id=casting.actorid 
                   WHERE name= 'Art Garfunkel')
                   AND name!= 'Art Garfunkel'