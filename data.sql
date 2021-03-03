-- SELECT Basics
/1
SELECT population FROM world
  WHERE name = 'Germany'

/2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Quiz

/1
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

/2
Table-E
Albania	3200000
Algeria	32900000

/3
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

/4
name	length(name)
Italy	5
Malta	5
Spain	5

/5
Andorra	936

/6
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

/7
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

-- SELECT from WORLD Tutorial
/1
SELECT name, continent, population FROM world
/2
SELECT name
  FROM world
 WHERE population > 200000000
/3
SELECT  name
       ,gdp/population
FROM world
WHERE population >= 200000000; 
/4
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';
/5
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
/6
SELECT name
  FROM world
 WHERE name like '%united%'
/7
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000
/8
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000) OR (area < 3000000 AND population > 250000000)
/9
SELECT name, round(population/1000000, 2), round(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';
/10
SELECT name, (round((gdp/population)/1000,0) * 1000)
from world
where gdp > 1000000000000;
/11
SELECT name,
       capital
  FROM world
 WHERE LEN(NAME) = LEN(capital)
/12
SELECT name, capital
FROM world
where (LEFT(name,1) = LEFT(capital,1)) AND name <> capital
/13
SELECT  name
FROM world
WHERE name LIKE '%a%' 
AND name LIKE '%e%' 
AND name LIKE '%i%' 
AND name LIKE '%o%' 
AND name LIKE '%u%' 
AND name NOT LIKE '% %' 

-- nobel 
SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE yr = 1950 
/2

SELECT  winner
FROM nobel
WHERE yr = 1962 
AND subject = 'literature' 
/3

SELECT  yr
       ,subject
FROM nobel
WHERE winner = 'albert einstein' 
/4

SELECT  winner
FROM nobel
WHERE yr >= 2000 
AND subject = 'peace' 
/5

SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE yr >= 1980 
AND yr <= 1989 
AND subject = 'literature' 
/6

SELECT  *
FROM nobel
WHERE winner = 'theodore roosevelt' or winner = 'woodrow wilson' or winner = 'jimmy carter' or winner = 'barack obama' 
/7


SELECT  winner
FROM nobel
WHERE winner like 'john%' 
/8


SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE (subject = 'physics' AND yr = 1980) or (subject = 'chemistry' AND yr = 1984) 
/9

SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE yr = 1980 
AND (subject <> 'chemistry' AND subject <> 'medicine') 
/10


SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE (yr < 1910 AND subject = 'medicine') or (yr >= 2004 AND subject = 'literature') 
/11

SELECT  *
FROM nobel
WHERE winner = 'peter grünberg' 
/12


SELECT  *
FROM nobel
WHERE winner = 'eugene o''neill' 
/13

SELECT  winner
       ,yr
       ,subject
FROM nobel
WHERE winner like 'sir%'
ORDER BY yr desc, winner 

--select-

SELECT  name
FROM world
WHERE population > ( 
SELECT  population
FROM world
WHERE name='Russia') 
/2

SELECT  name
FROM world
WHERE continent = 'europe' 
AND gdp/population > ( 
SELECT  gdp/population
FROM world
WHERE name ='united kingdom' ) 
/3

SELECT  name
       ,continent
FROM world
WHERE continent IN ( SELECT continent FROM world WHERE name IN ('argentina','australia'))
ORDER BY name 
/4

SELECT  name
       ,population
FROM world
WHERE population > ( 
SELECT  population
FROM world
WHERE name = 'canada') AND population < ( 
SELECT  population
FROM world
WHERE name = 'poland') 
/5

SELECT  name
       ,CONCAT(ROUND(100*population/(
SELECT  population
FROM world
WHERE name = 'germany'),0), '%') 
FROM world
WHERE continent = 'europe' 
/6

SELECT  name
FROM world
WHERE gdp > ALL( 
SELECT  gdp
FROM world
WHERE gdp>0 
AND continent = 'europe') 
/7

SELECT  continent
       ,name
       ,area
FROM world x
WHERE area >= ALL ( 
SELECT  area
FROM world y
WHERE y.continent=x.continent 
AND area>0) 
/8


SELECT  continent
       ,name
FROM world x
WHERE name <= all ( 
SELECT  name
FROM world y
WHERE y.continent=x.continent) 
/9

SELECT  name
       ,continent
       ,population
FROM world x
WHERE 25000000 > all( 
SELECT  population
FROM world y
WHERE x.continent = y.continent 
AND y.population > 0) 
/10

SELECT  name
       ,continent
FROM world x
WHERE population > all( 
SELECT  population*3
FROM world y
WHERE x.continent = y.continent 
AND population > 0 
AND y.name != x.name) 
-- SUM and COUNT -

SELECT  SUM(population)
FROM world

/ 2
SELECT  distinct continent
FROM world

/ 3

SELECT  SUM(gdp)
FROM world
WHERE continent = 'africa' 
/ 4

SELECT  COUNT(area)
FROM world
WHERE area > 1000000 
/ 5


SELECT  SUM(population)
FROM world
WHERE name IN ('estonia', 'latvia', 'lithuania') 
/ 6

SELECT  continent
       ,COUNT(name)
FROM world
GROUP BY  continent

/ 7

SELECT  continent
       ,COUNT(name)
FROM world
WHERE population > 10000000 
GROUP BY  continent

/ 8

SELECT  continent
FROM world
GROUP BY  continent
HAVING SUM(population) > 100000000
-- JOIN - 1

SELECT  matchid
       ,player
FROM goal
WHERE teamid = 'ger' 
/ 2

SELECT  id
       ,stadium
       ,team1
       ,team2
FROM game
WHERE id = 1012 
/ 3

SELECT  player
       ,teamid
       ,stadium
       ,mdate
FROM game
JOIN goal
ON (id=matchid)
WHERE teamid = 'ger' 
/ 4

SELECT  team1
       ,team2
       ,player
FROM game
JOIN goal
ON (id=matchid AND player like ('mario%'))
/ 5

SELECT  player
       ,teamid
       ,coach
       ,gtime
FROM goal
JOIN eteam on
(teamid=id
)
WHERE gtime<=10 
/ 6

SELECT  mdate
       ,teamname
FROM game
JOIN eteam
ON (team1=eteam.id)
WHERE coach like 'fernando%' 
/ 7

SELECT  player
FROM game
JOIN goal
ON (id = matchid)
WHERE stadium like '%warsaw' 
/ 8

SELECT  distinct player
FROM game
JOIN goal
ON matchid = id
WHERE (team1='GER'or team2='ger') 
AND teamid != 'ger' 
/ 9

SELECT  teamname
       ,COUNT(player)
FROM eteam
JOIN goal
ON id=teamid
GROUP BY  teamname
/ 10

SELECT  stadium
       ,COUNT(player)
FROM game
JOIN goal
ON id = matchid
GROUP BY  stadium
/ 11

SELECT  matchid
       ,mdate
       ,COUNT(player)
FROM game
JOIN goal
ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL') 
GROUP BY  matchid
         ,mdate
/ 12

SELECT  matchid
       ,mdate
       ,COUNT(player)
FROM goal
JOIN game
ON id = matchid
WHERE (team1 = 'ger' or team2 = 'ger') 
AND teamid = 'ger' 
GROUP BY  matchid
         ,mdate
/ 13

SELECT  DISTINCT mdate
       ,team1
       ,SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1
       ,team2
       ,SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal
ON game.id = goal.matchid
GROUP BY  id
         ,mdate
         ,team1
         ,team2
-- MORE JOIN - 1
SELECT  id
       ,title
FROM movie
WHERE yr=1962 
/ 2
SELECT  yr
FROM movie
WHERE title = 'citizen kane' 
/ 3

SELECT  id
       ,title
       ,yr
FROM movie
WHERE title like 'star trek%'
ORDER BY yr 
/ 4

SELECT  id
FROM actor
WHERE name = 'glenn close' 
/ 5

SELECT  id
FROM movie
WHERE title = 'casablanca' 
/ 6


SELECT  name
FROM actor, casting
WHERE id=actorid 
AND movieid = 27 
/ 7

SELECT  name
FROM actor, casting
WHERE id=actorid 
AND movieid = ( 
SELECT  id
FROM movie
WHERE title = 'alien') 
/ 8

SELECT  title
FROM movie
JOIN casting
ON (id=movieid AND actorid = (
SELECT  id
FROM actor
WHERE name = 'harrison ford')) 
/ 9

SELECT  title
FROM movie
JOIN casting
ON (id=movieid AND actorid = (
SELECT  id
FROM actor
WHERE name = 'harrison ford' 
AND ord != 1)) 
/ 10
SELECT  title
       ,name
FROM movie
JOIN casting
ON (id=movieid)
JOIN actor
ON (actor.id = actorid)
WHERE ord=1 
AND yr = 1962 
/ 11

SELECT  yr
       ,COUNT(title)
FROM movie
JOIN casting
ON movie.id=movieid
JOIN actor
ON actorid=actor.id
WHERE name='rock hudson' 
GROUP BY  yr
HAVING COUNT(title) > 2
/ 12
SELECT  title
       ,name
FROM movie
JOIN casting x
ON movie.id = movieid
JOIN actor
ON actor.id =actorid
WHERE ord=1 
AND movieid IN ( SELECT movieid FROM casting y JOIN actor ON actor.id=actorid WHERE name='julie andrews') 
/ 13

SELECT  name
FROM actor
JOIN casting
ON (id=actorid AND (
SELECT  COUNT(ord)
FROM casting
WHERE actorid = actor.id 
AND ord=1)>=15) 
GROUP BY  name

/ 14

SELECT  title
       ,COUNT(actorid)
FROM movie
JOIN casting
ON movie.id = movieid
WHERE yr = 1978 
GROUP BY  title
ORDER BY COUNT(actorid) desc
         ,title
/ 15

SELECT  distinct name
FROM actor
JOIN casting
ON id=actorid
WHERE movieid IN ( SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='art garfunkel')) 
AND name != 'art garfunkel' 
-- NULL - 1

SELECT  name
FROM teacher
WHERE dept is null 
/ 2
SELECT  teacher.name
       ,dept.name
FROM teacher
INNER JOIN dept
ON (teacher.dept = dept.id)
/ 3
SELECT  teacher.name
       ,dept.name
FROM teacher
LEFT JOIN dept
ON (teacher.dept=dept.id)

/ 4
SELECT  teacher.name
       ,dept.name
FROM teacher
RIGHT JOIN dept
ON (teacher.dept=dept.id)
/ 5

SELECT  name
       ,coalesce(mobile,'07986 444 2266')from teacher
/ 6
SELECT  coalesce(teacher.name,'none')
       ,coalesce(dept.name,'none')
FROM teacher
LEFT JOIN dept
ON (teacher.dept=dept.id)
/ 7
SELECT  COUNT(name)
       ,COUNT(mobile)
FROM teacher
/ 8
SELECT  dept.name
       ,COUNT(teacher.dept)
FROM teacher
RIGHT JOIN dept
ON dept.id = teacher.dept
GROUP BY  dept.name
/ 9
SELECT  name
       ,CASE WHEN dept IN (1,2) THEN 'Sci'  ELSE 'Art' END
FROM teacher
/ 10
SELECT  name
       ,CASE WHEN dept IN (1,2) THEN 'Sci' 
             WHEN dept = 3 THEN 'Art'  ELSE 'None' END
FROM teacher
-- self join - 1
SELECT  COUNT(name)
FROM stops

/ 2
SELECT  id
FROM stops
WHERE name = 'craiglockhart' 
/ 3
SELECT  id
       ,name
FROM stops
JOIN route
ON id = stop
WHERE num = '4' 
AND company = 'lrt'; 

/ 4
SELECT  company
       ,num
       ,COUNT(*)
FROM route
WHERE stop=149 OR stop=53 
GROUP BY  company
         ,num
HAVING COUNT(*) >1
/ 5
SELECT  a.company
       ,a.num
       ,a.stop
       ,b.stop
FROM route a
JOIN route b
ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 
AND b.stop=149 

/ 6
SELECT  a.company 
       ,a.num 
       ,stopa.name 
       ,stopb.name
FROM route a
JOIN route b
ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa
ON (a.stop=stopa.id)
JOIN stops stopb
ON (b.stop=stopb.id)
WHERE stopa.name='craiglockhart' 
AND stopb.name='london road'  

/ 7

SELECT  distinct a.company
       ,a.num
FROM route a
JOIN route b
ON (a.company =b.company AND a.num=b.num)
JOIN stops stopa
ON (a.stop=stopa.id)
JOIN stops stopb
ON (b.stop=stopb.id)
WHERE stopa.name='haymarket' 
AND stopb.name='leith' 
/ 8
SELECT  distinct a.company
       ,a.num
FROM route a
JOIN route b
ON (a.num=b.num AND a.company=b.company)
JOIN stops stopa
ON (a.stop=stopa.id)
JOIN stops stopb
ON (b.stop=stopb.id)
WHERE stopa.name = 'craiglockhart' 
AND stopb.name = 'tollcross' 