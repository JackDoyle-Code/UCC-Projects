--- Question 1 ---
SELECT name, MAX(area)
FROM countries;

--- Question 2 ---
SELECT name, MAX(population)
FROM countries
WHERE region = 'Africa';

--- Question 3 ---
SELECT SUM(gdp)
FROM countries
WHERE region = 'Europe';

--- Question 4 ---
SELECT name, population
FROM countries
WHERE gdp ISNULL;

--- Question 5 ---
SELECT name, gdp
FROM countries
WHERE NOT gdp ISNULL;

--- Question 6 ---
SELECT name, AVG(gdp)
FROM countries
GROUP BY region;

--- Question 7 ---
SELECT name 
FROM countries
WHERE name LIKE '%' || region || '%';

--- Question 8 ---
SELECT region, MIN(gdp/population), MAX(gdp/population)
FROM countries
GROUP BY region;

--- Question 9 ---
SELECT COUNT(name), SUM(population), region
FROM countries
WHERE region IN ('Europe', 'Africa', 'Middle East')
GROUP BY region;

--- Question 10 ---
SELECT SUM(population), SUM(area), SUM(gdp)
FROM countries
WHERE name IN ('France', 'Germany', 'Spain');

--- Question 11 ---
SELECT COUNT(name), region
FROM countries
WHERE population > 100000000
GROUP BY region;

--- Question 12 ---
SELECT DISTINCT(SUBSTR(name, 1, 1)), COUNT(name), MAX(name), MIN(name)
FROM countries
GROUP BY SUBSTR(name, 1, 1);

--- Question 13 ---
SELECT name, region, population
FROM countries
ORDER BY region, population DESC;

--- Question 14 ---
SELECT COUNT(name), SUM(population/area), region
FROM countries
GROUP BY region
HAVING SUM(population) > 1000000000;

--- Question 15 ---
SELECT name, region
FROM countries
WHERE region = (SELECT region FROM countries WHERE name = 'Jordan');

--- Question 16 ---
SELECT count(name)
FROM countries
where region = (SELECT region FROM countries WHERE name = 'Jordan');

--- Question 17 ---
SELECT name, area
FROM countries
WHERE area > (SELECT area FROM countries WHERE name = 'Spain')
    AND region = (SELECT region FROM countries WHERE name = 'Spain');

--- Question 18 ---
SELECT name, area
FROM countries
WHERE area > (SELECT (0.1*SUM(area)) FROM countries GROUP BY region);

--- Question 19 ---
SELECT COUNT(name), Min(area), MAX(area)
FROM countries
GROUP BY population/100000000
ORDER BY population DESC;

--- Question 20 ---
SELECT MIN(population), name, region
FROM countries
WHERE region = (SELECT region FROM countries WHERE name = 'China');

--- Question 22 ---
SELECT name, gdp/population
FROM countries
WHERE gdp/population >= (SELECT gdp/population FROM countries WHERE name = 'China')
ORDER BY gdp/population DESC;