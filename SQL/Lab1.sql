--- Question 1 ---
SELECT *
FROM students;

--- Question 2 ---
SELECT first_name, last_name
FROM students;

--- Question 3 ---
SELECT first_name
FROM students
ORDER BY points;

--- Question 4 ---
SELECT first_name
FROM students
ORDER BY date_of_birth DESC;

--- Question 5 ---
SELECT DISTINCT hometown
FROM students;

--- Question 6 ---
SELECT first_name
FROM students
WHERE points >= 450;

--- Question 7 ---
SELECT first_name
FROM students
WHERE points = 525;