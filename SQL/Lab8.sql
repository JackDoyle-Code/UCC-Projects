--- Question 2 ---
DROP TABLE exam;

--- Part 1 ---
CREATE TABLE exam 
(
code CHAR(9),
title VARCHAR(30),
start_date DATE,
start_time TIME,
duration FLOAT,
location VARCHAR(30),
total_students INTEGER,

PRIMARY KEY (code)  
);

--- Part 2 ---
INSERT INTO exam
VALUES ('123456789', 'biology', '2002-10-13', '12:00:00', 3, 'home', 6),
    ('234567891', 'chemistry', '2004-01-22', '09:00:00', 1.5, 'inside', 32),
    ('345678912', 'physics', '2016-12-01', '16:30:00', 2, 'outside', 60);

SELECT *
FROM exam;

--- Part 3 ---
UPDATE exam
SET duration = duration + 0.167
WHERE duration = 1.5;

--- Part 4 ---
DELETE 
FROM exam
WHERE total_students <= 6;

--- Part 5 ---
SELECT code, title, location
FROM exam
WHERE duration > 1.5
    AND start_date = '2016-12-01';

INSERT INTO exam
VALUES
    ('YourExamCode', 'Your Current Exam Title', '2023-12-16', '09:00:00', 2.5, 'Exam Hall A', 100),
    ('ExamCode1', 'Exam Title 1', '2023-12-17', '10:30:00', 3.0, 'Exam Hall B', 80),
    ('ExamCode2', 'Exam Title 2', '2023-12-18', '14:00:00', 2.0, 'inside', 120);

--- Part 6 ---
SELECT location, MAX(start_date), MIN(start_date), SUM(total_students)
FROM exam
GROUP BY location;


--- Question 3 ---

--- Part 1 ---
SELECT name
FROM actors JOIN castings JOIN movies
    ON actors.id = castings.actorid
    AND castings.movieid = movies.id
WHERE title = 'Gone with the Wind';

--- Part 2 ---
SELECT name, COUNT(actorid)
FROM actors JOIN castings
    ON actors.id = castings.actorid
GROUP BY name
HAVING COUNT(actorid) >= 10;
--- OR ---
SELECT name
FROM actors
WHERE id IN (SELECT actorid FROM castings GROUP BY actorid HAVING COUNT(actorid) >= 10);

--- Part 3 ---
SELECT title 
FROM movies
WHERE yr = (SELECT yr FROM movies WHERE title = 'Citizen Kane')
    AND score > (SELECT score FROM movies WHERE title = 'Citizen Kane');

--- Part 4 ---
SELECT a1.name AS actor1, a2.name AS actor2, a3.name AS actor3
FROM castings c1
JOIN castings c2 ON c1.movieid = c2.movieid AND c1.actorid < c2.actorid
JOIN castings c3 ON c1.movieid = c3.movieid AND c2.actorid < c3.actorid
JOIN actors a1 ON c1.actorid = a1.id
JOIN actors a2 ON c2.actorid = a2.id
JOIN actors a3 ON c3.actorid = a3.id
WHERE a1.id <> a2.id AND a1.id <> a3.id AND a2.id <> a3.id
GROUP BY actor1, actor2, actor3
HAVING COUNT(DISTINCT c1.movieid) >= 3;

SELECT a1.name, a2.name, a3.name
FROM actors AS a1 JOIN castings AS c1 JOIN actors AS a2 JOIN castings AS c2 JOIN actors AS a3
    ON a1.id < a2.id
    AND a2.id < a3.id
    AND a1.id = c1.actorid
    AND a2.id = c1.actorid
    AND a2.id = c2.actorid
    AND a3.id = c2.actorid
GROUP BY a1.name, a2.name, a3.name
HAVING COUNT(DISTINCT c1.movieid) >= 3;

SELECT a1.name AS actor1, a2.name AS actor2, a3.name AS actor3
FROM actors AS a1
JOIN castings AS c1 ON a1.id = c1.actorid
JOIN actors AS a2 ON a1.id < a2.id
JOIN castings AS c2 ON a2.id = c2.actorid AND c1.movieid = c2.movieid
JOIN actors AS a3 ON a2.id < a3.id AND c2.movieid = c1.movieid
GROUP BY actor1, actor2, actor3
HAVING COUNT(DISTINCT c1.movieid) >= 3;

--- Part 5 ---
SELECT yr, title, score
FROM movies as m1
WHERE score = (SELECT MIN(score) FROM movies AS m2 WHERE m2.yr = m1.yr)
ORDER BY yr ASC;

--- Part 6 ---
SELECT name, score
FROM actors JOIN castings JOIN movies
    ON actors.id = castings.actorid
    AND castings.movieid = movies.id
WHERE score > 5
GROUP BY name
HAVING COUNT(actorid) >= 6;

SELECT name
FROM actors
WHERE id IN (SELECT actorid FROM castings GROUP BY actorid HAVING COUNT(actorid) >=6)
    AND id IN (SELECT actorid FROM castings WHERE movieid IN (SELECT id FROM movies WHERE score > 5))
    ORDER BY name; --- Think this one is wrong ---


