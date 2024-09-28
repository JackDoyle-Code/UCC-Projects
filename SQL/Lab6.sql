--- Question 1 ---
SELECT actorid
FROM castings
WHERE movieid = (SELECT id FROM movies WHERE title = 'Big Sleep, The');

--- Question 2 ---
SELECT DISTINCT title, yr, director
FROM movies
WHERE director = (SELECT director FROM movies WHERE title = 'Citizen Kane')
ORDER BY yr;

--- Question 3 ---
SELECT name
FROM actors
WHERE id = 
    (SELECT actorid FROM castings WHERE movieid = 
    (SELECT id FROM movies WHERE title = 'Big Sleep, The'));

--- Question 4 ---
SELECT movieid
FROM castings
WHERE actorid = (SELECT id FROM actors WHERE name = 'Elizabeth Taylor')
    OR movieid = (SELECT id FROM movies WHERE yr LIKE '%195%');

--- Question 5 ---
SELECT title, score
FROM movies
WHERE score = (SELECT MAX(score) FROM movies);

--- Question 6 ---
SELECT actorid
FROM castings
GROUP BY actorid
HAVING COUNT(actorid) >= 10;

--- Question 7 ---
SELECT name
FROM actors
WHERE id IN (SELECT actorid FROM castings GROUP BY actorid HAVING COUNT(actorid) >= 10);

--- Question 8 ---
SELECT title, score
FROM movies
WHERE score = (SELECT (0.9*MAX(score)) FROM movies);

--- Question 9 ---
SELECT name
FROM actors
WHERE id IN 
    (SELECT actorid FROM castings WHERE movieid IN 
    (SELECT id FROM movies WHERE score < 3));

--- Question 10 ---
SELECT title, score
FROM movies
WHERE score = (SELECT MAX(score) FROM movies)
    OR score = (SELECT MIN(score) FROM movies);

--- Question 11 ---
SELECT title, yr
FROM movies
WHERE yr < 
    (SELECT MIN(yr) FROM movies WHERE director = 
    (SELECT director FROM movies WHERE title = 'Citizen Kane'));

--- Question 12 ---
SELECT title, yr
FROM movies
WHERE yr > 
    (SELECT MIN(yr) FROM movies WHERE director = 
    (SELECT director FROM movies WHERE title = 'Citizen Kane'));

--- Question 13 ---
SELECT title, score
FROM movies 
WHERE score >= (SELECT MAX(score) FROM movies WHERE yr LIKE '%194%');

--- Question 14 ---
SELECT MAX(p)
FROM (SELECT COUNT(title) AS p FROM movies GROUP BY director);

--- Question 15 ---
SELECT director, MAX(p)
FROM (SELECT COUNT(title) AS p, director FROM movies GROUP BY director);

--- Question 16 ---
SELECT title, director
FROM movies 
WHERE director = (SELECT director FROM 
    (SELECT COUNT(title) AS p, director FROM movies GROUP BY director));

--- Question 17 ---
SELECT title
FROM movies
WHERE director = (SELECT director FROM movies WHERE title = 'Bananas')
    AND id  IN (SELECT movieid FROM castings WHERE actorid = 
        (SELECT id FROM actors WHERE name = 'Diane Keaton'));


