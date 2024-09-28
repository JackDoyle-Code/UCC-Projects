--- Question 1 ---
SELECT COUNT(DISTINCT movieid), COUNT(DISTINCT actorid)
FROM castings;

--- Question 2 ---
SELECT COUNT(DISTINCT title)
FROM movies
WHERE yr = 1975;

--- Question 3 ---
SELECT movieid
FROM actors JOIN castings
    ON actors.id = castings.actorid
WHERE name = 'Clint Eastwood';

--- Question 4 ---
SELECT movieid, yr, name
FROM actors JOIN castings JOIN movies
    ON actors.id = castings.actorid
    AND castings.movieid = movies.id
WHERE name = 'Clint Eastwood'
ORDER BY yr;

--- Question 5 ---
SELECT DISTINCT actorid 
FROM castings JOIN movies
    ON castings.movieid = movies.id
WHERE title = 'Citizen Kane';

--- Question 6 ---
SELECT DISTINCT actorid 
FROM castings JOIN movies
    ON castings.movieid = movies.id
WHERE title = 'Vertigo'
    OR title = 'Rear Window';

--- Question 7 ---
SELECT DISTINCT title
FROM movies
WHERE director = 28;

--- Question 8 ---
SELECT DISTINCT m2.title
FROM movies AS m1 JOIN movies AS m2
    ON m1.director = m2.director
WHERE m1.title = 'Godfather, The';

--- Question 9 ---
SELECT DISTINCT m1.title, m1.yr, m2.title, m2.yr
FROM movies AS m1 JOIN movies AS m2
    ON m1.id > m2.id
WHERE m1.title = m2.title;

--- Question 10 ---
SELECT title
FROM movies
WHERE title LIKE '%II'
    OR title LIKE '%IV'
    OR title LIKE '% V';

--- Question 11 ---
SELECT DISTINCT m1.title, m2.title
FROM movies AS m1 JOIN movies AS m2
    ON m1.id > m2.id
WHERE m1.title LIKE m2.title || '%II';

--- Question 12 ---
SELECT DISTINCT m1.title, m2.title
FROM movies AS m1 JOIN movies AS m2
    ON m1.director = m2.director
WHERE m1.score > 8 
    AND m2.score < 3;

--- Question 13 ---
SELECT DISTINCT movieid
FROM actors JOIN castings
    ON actors.id = castings.actorid
WHERE name = 'Clint Eastwood'
INTERSECT
SELECT DISTINCT movieid
FROM actors JOIN castings
    ON actors.id = castings.actorid
WHERE name = 'Richard Burton';

--- OR ---

SELECT DISTINCT movieid
FROM actors JOIN castings
    ON actors.id = castings.actorid
WHERE name IN ('Clint Eastwood', 'Richard Burton')
GROUP BY movieid
HAVING COUNT(movieid) > 1;

--- Question 14 ---
