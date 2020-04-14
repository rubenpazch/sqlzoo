/* 
1 .- Show the total population of the world.
*/

SELECT SUM(population)
FROM world

/* 
2 .- List all the continents - just once each.
*/
SELECT distinct continent
FROM world

/* 
3 .- Give the total GDP of Africa
*/
SELECT sum(gdp) continent
FROM world 
where continent = 'Africa'

/* 
4 .- How many countries have an area of at least 1000000
*/
SELECT count(name) 
FROM world 
where area > 1000000

/* 
5 .- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
*/
SELECT sum(population) 
FROM world 
where name in  ('Estonia', 'Latvia', 'Lithuania')

/* 
6 .- For each continent show the continent and number of countries.
*/
SELECT continent,count(name) 
FROM world 
group by continent

/* 
7 .- For each continent show the continent and number of countries with populations of at least 10 million.
*/
SELECT continent,count(name) 
FROM world 
where population > 10000000
group by continent


/* 
8 .- List the continents that have a total population of at least 100 million.
*/

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000