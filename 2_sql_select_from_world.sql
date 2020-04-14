/* 
1 .- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
*/
SELECT name, continent, population FROM world

/* 
2 .- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
*/
SELECT name FROM world
WHERE population > 200000000

/* 
3 .- Give the name and the per capita GDP for those countries with a population of at least 200 million.
*/
select name, gdp/population from world where population >= 200000000

/* 
4 .- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
*/
select name, population/1000000  from world where continent = 'South America' 

/* 
5 .- Show the name and population for France, Germany, Italy
*/
select name, population from world where name in ('france','germany','italy')

/* 
6 .- Show the countries which have a name that includes the word 'United'
*/
select name from world where name like 'United%'

/* 
7 .- Show the countries that are big by area or big by population. Show name, population and area.
*/
select name, population, area 
from world 
where area > 3000000 or population > 250000000

/* 
8 .- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.
*/
select name, population, area 
from world 
where area>3000000 xor population>250000000


/* 
9 .- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
*/

select name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) 
from world 
where continent = 'South America'