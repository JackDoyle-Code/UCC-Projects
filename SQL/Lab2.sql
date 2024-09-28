--- Question 1 ---
SELECT name
FROM countries
WHERE region = 'Europe'
ORDER BY population DESC;

--- Question 2 ---
SELECT DISTINCT region
FROM countries
ORDER BY region;

--- Question 3 ---
SELECT name, region
FROM countries
GROUP by name
ORDER BY region;

--- Question 4 ---
SELECT name
FROM countries
WHERE gdp ISNULL;

--- Question 5 ---
SELECT name, region
FROM countries
WHERE region LIKE '%Asia%';

--- Question 6 ---
SELECT name, region
FROM countries
WHERE region LIKE '%South%' 
    OR region LIKE '%North%';

--- Question 7 ---
SELECT name
FROM countries
WHERE name LIKE '%stan';

--- Question 8 ---
SELECT name
FROM countries
WHERE name LIKE '%x%'
    OR name LIKE '%y%'
    OR name LIKE '%z%';

--- Question 9 ---
SELECT name, gdp/population
FROM countries
WHERE gdp/population >= 25000;

--- Students Database is used from here on ---
--- Question 10 ---
SELECT *
FROM students;

UPDATE students
SET points = points + 50
WHERE first_name = 'Aoife';

--- Question 11 ---
UPDATE students
SET hometown = 'Tahiti', date_of_birth = '2000-01-01'
WHERE first_name = 'Fionn';

--- Question 12 ---
INSERT INTO students VALUES ('Grianne', 'Goggin', etc)
