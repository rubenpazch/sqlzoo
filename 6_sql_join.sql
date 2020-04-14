/* 
1 .- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
*/

SELECT matchid,player FROM goal 
  WHERE teamid = 'GER'
/* 
2 .- Show id, stadium, team1, team2 for just game 1012
*/
SELECT id,stadium,team1,team2
  FROM game
where id= '1012'
/* 
3 .- Modify it to show the player, teamid, stadium and mdate for every German goal.
*/
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
where teamid= 'GER'

/* 
4 .- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
*/
SELECT team1,team2,player
  FROM game JOIN goal ON (id=matchid)
where player like 'Mario%'
/* 
5 .- The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
*/
SELECT player, teamid,coach, gtime
  FROM goal G join game J on  (J.id=G.matchid) 
join eteam T  on  (T.id= G.teamid)
 WHERE gtime<=10

/* 
6 .- List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
*/
SELECT G.mdate, T.teamname
from game G join goal L on G.id = L.matchid
join eteam T on T.id=L.teamid
where T.coach ='Fernando Santos' 
and G.team1 = 'GRE'
/* 
7 .- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
*/
SELECT L.player
from game G join goal L on G.id = L.matchid
where G.stadium ='National Stadium, Warsaw' 


/* 
8 .- The example query shows all goals scored in the Germany-Greece quarterfinal.
Instead show the name of all players who scored a goal against Germany.
*/


SELECT distinct L.player
from game G join goal L on G.id = L.matchid
where (team1='GER' OR team2='GER')
and L.teamid <> 'GER'

/* 
9 .- Show teamname and the total number of goals scored.
*/

SELECT teamname, count(teamid)
  FROM eteam JOIN goal ON id=teamid
group by  teamname
 ORDER BY teamname



/* 
10 .- Show the stadium and the number of goals scored in each stadium.
*/

SELECT stadium, count(id)
FROM game JOIN goal ON id=matchid
group by stadium


/* 
11 .- For every match involving 'POL', show the matchid, date and the number of goals scored.
*/
SELECT matchid,mdate, count(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid



/* 
12 .- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
*/
SELECT matchid,mdate,count(teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER')
and teamid = 'GER'
group by matchid

/* 
13 .-Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2. 
*/

SELECT A.mdate,  A.team1,
sum(CASE WHEN B.teamid=A.team1 THEN 1 ELSE 0 END) score1,
A.team2,
sum(CASE WHEN B.teamid=A.team2 THEN 1 ELSE 0 END) score2
  FROM game A LEFT JOIN goal B ON B.matchid = A.id
group by A.mdate, A.team1, A.team2
order by A.mdate,B.matchid, A.team1, A.team2