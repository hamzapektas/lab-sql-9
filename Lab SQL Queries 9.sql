USE sakila;

-- 1 How many distinct (different) actors' last names are there?

SELECT * FROM sakila.actor;
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- 2 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE WHEN dayname(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM rental;

-- 3 Get all films with ARMAGEDDON in the title.

SELECT *
FROM sakila.film
WHERE title LIKE '%armageddon%';
-- 4 Get 10 the longest films.

SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 5 How many films include Behind the Scenes content?

SELECT * FROM sakila.film;
SELECT count(*)
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';

-- 6 Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, (AVG(length)> 120) AS 'average_length'
FROM sakila.film
GROUP BY rating;

-- 7 Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT * FROM sakila.film;
SELECT title, length, length AS 'rank_length' 
FROM sakila.film
HAVING (rank_length IS NOT NULL)  AND (rank_length != '%00%')
ORDER BY rank_length desc;