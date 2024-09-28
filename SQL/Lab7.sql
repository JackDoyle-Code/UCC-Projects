--- Question 1 ---
SELECT name, population
FROM cities
ORDER BY population DESC
LIMIT 20;

--- Question 2 ---
SELECT countries.name, cities.population, COUNT(cities.name)
FROM countries JOIN cities
    ON countries.code = cities.country_code
WHERE cities.population >= 1000000
GROUP BY countries.name
HAVING COUNT(cities.name) >= 5;

--- Question 3 ---
SELECT name
FROM countries
WHERE indep_year > (SELECT indep_year FROM countries WHERE name = 'India');

--- Question 4 ---
SELECT language, COUNT(language)
FROM country_languages
WHERE percentage >= 25
GROUP BY language
HAVING COUNT(language) >= 6;

--- Question 5 ---
SELECT name, gnp/population, life_expectancy
FROM countries
WHERE gnp/population IN (SELECT gnp/population FROM countries WHERE NOT gnp/population ISNULL ORDER BY gnp/population ASC LIMIT 20)
    AND life_expectancy IN (SELECT life_expectancy FROM countries WHERE NOT life_expectancy ISNULL ORDER BY life_expectancy ASC LIMIT 20);

--- Question 6 ---
SELECT name, continent, surface_area
FROM countries
WHERE surface_area >= (SELECT (0.1*SUM(surface_area)) FROM countries GROUP BY continent);

--- Question 7 ---
SELECT 
FROM countries AS c1
WHERE gnp = (SELECT SUM(c2.gnp/c1.gnp) FROM countries AS c2 ORDER BY gnp DESC LIMIT 20);


SELECT SUM(c2.gnp) FROM countries AS c2 ORDER BY gnp DESC LIMIT 20; 

--- Can't do 7 ---

--- Question 8 ---
SELECT head_of_state
FROM countries
WHERE surface_area = (SELECT MAX(surface_area) FROM countries);

--- Question 9 ---
SELECT name, population, continent
FROM countries AS c1
WHERE population = (SELECT MAX(population) FROM countries AS c2 WHERE c2.continent = c1.continent)
    OR population = (SELECT MIN(population) FROM countries AS c3 WHERE c3.continent = c1.continent)
ORDER BY continent;

--- Question 10 ---
SELECT name, country_code, population
FROM cities AS c1
WHERE name IN (SELECT name FROM cities as c2 WHERE c1.country_code = c2.country_code AND
    c1.country_code IN (SELECT code FROM countries WHERE continent = "Europe"))
GROUP BY country_code
HAVING MAX(population);

--- Question 11 ---
SELECT name, population
FROM countries JOIN country_languages
    ON countries.code = country_languages.country_code
WHERE language IN ('English', 'Spanish', 'Chinese', 'Arabic', 'Hindi')
    AND percentage <= 25
GROUP BY name
ORDER BY population DESC;

--- Question 12 ---
SELECT language, percentage, COUNT(continent)
FROM countries JOIN country_languages
    ON countries.code = country_languages.country_code
WHERE percentage >= 75
GROUP BY language
HAVING COUNT(continent) > 2;

