-- Platform: w3resource
-- Difficulty: easy 
-- Link: https://sqlzoo.net/wiki/The_JOIN_operation

--4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
select team1, team2, player 
from game join goal on (id = matchid)
where player like 'Mario%'

--8. show the name of all players who scored a goal against Germany.
SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE teamid != 'GER' and (team1='GER' or team2='GER') 


--11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, count(*) 
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate

--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
select matchid, mdate, count(*)
from game join goal on matchid = id 
where teamid = 'GER'
group by matchid, mdate

--13. List every match involving the ENG team, show the number goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
select mdate, team1, 
sum(case when teamid =team1 then 1 else 0) as score1, 
team2, 
sum(case when teamid = team2 then 1 else 0) as score2
from game left join goal on matchid = id 
where team1 = 'ENG' or team2 = 'ENG'
group by mdate, matchid, team1, team2 