--link: https://sqlzoo.net/wiki/JOIN_Quiz

--3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
select player, teamid, count(*)
from goal join game on match = id
where (team1 = 'GRE' or team2 = 'GRE') and teamid <> 'GRE'
group by player, teamid


