--- Question 1 ---
SELECT *
FROM persons
WHERE first_name LIKE 'a%';

--- Question 2 ---
SELECT *
FROM persons
WHERE first_name LIKE '%a';

--- Question 3 ---
SELECT *
FROM persons
WHERE first_name LIKE '%a%';

--- Question 4 ---
SELECT first_name, SUBSTRING(first_name, 1, 5)
FROM persons
WHERE substring(first_name, 1, 5) = first_name;

SELECT first_name
FROM persons
WHERE LENGTH(first_name) = 5;

--- Question 5 ---
SELECT first_name
FROM persons
WHERE street LIKE '%street%';

--- Question 6 ---
SELECT DISTINCT food
FROM likes
WHERE food LIKE '% %';

--- Question 7 ---
SELECT DISTINCT food
FROM likes
WHERE food LIKE '%te%';




--- Question 1 ---
SELECT *
FROM persons JOIN likes
    ON persons.person_id = likes.person_id;

--- Question 3 ---
SELECT food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE first_name = 'Aoife';

--- Question 4 ---
SELECT first_name, food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE county = 'Cork';

--- Question 5 ---
SELECT DISTINCT food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE gender = 'F';

--- Question 6 ---
SELECT first_name
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE food = 'Pizza';

--- Question 7 ---
SELECT DISTINCT town
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE food = 'Beer';

--- Question 8 ---
SELECT *
FROM likes AS l1 JOIN likes As l2;

--- Question 10 ---
SELECT persons.person_id
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE food = 'Nutella'
    AND food = 'Pizza';

--- Question 11 ---
SELECT persons.person_id
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE food = 'Nutella'
    OR food = 'Pizza';

--- Question 12 ---
SELECT first_name
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE food = 'Beer'
    AND county = 'Cork';

--- Question 15 ---
SELECT *
FROM persons AS p1 JOIN persons AS p2; 

--- Question 17 ---
SELECT *
FROM persons AS p1 JOIN persons AS p2
    ON p1.person_id > p2.person_id
    AND p1.birth_date = p2.birth_date; 

--- Question 18 ---
SELECT p1.first_name
FROM persons AS p1 JOIN persons AS p2
    ON p1.person_id > p2.person_id
WHERE substring(p1.birth_date, 6, 5) = substring(p2.birth_date, 6, 5);

--- Question 19 ---
SELECT COUNT(first_name), food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
GROUP BY food;

--- Question 20 ---
SELECT DISTINCT first_name
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE NOT food = 'Beer';

--- Question 21 ---
SELECT first_name, food
FROM persons JOIN likes
    ON persons.person_id = likes.person_id
WHERE food IN ('Beer', 'Nutella', 'Pizza')
GROUP BY first_name
HAVING COUNT(first_name) >= 2;

--- Question 22 ---
SELECT DISTINCT l1.person_id, l2.person_id
FROM likes AS l1 JOIN likes AS l2
    ON l1.person_id > l2.person_id
WHERE l1.food = l2.food;

--- Question 23 ---
SELECT COUNT(first_name), county, food
FROM persons JOIN likes AS l1
    ON persons.person_id = l1.person_id
GROUP BY county, food;

--- Question 24 ---
SELECT COUNT(first_name), county, food
FROM persons JOIN likes AS l1
    ON persons.person_id = l1.person_id
WHERE food = 'Beer'
GROUP BY county
ORDER BY COUNT(first_name) DESC;

--- Question 25 ---
SELECT first_name, MAX(birth_date)
FROM persons;
