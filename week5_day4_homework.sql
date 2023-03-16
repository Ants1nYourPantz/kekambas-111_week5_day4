-- QUESTION 1

CREATE OR REPLACE PROCEDURE new_film(title VARCHAR(255), description text, release_year INTEGER, language_id INTEGER, rental_duration INTEGER, rental_rate NUMERIC(4, 2), "length" INTEGER, replacement_cost NUMERIC(5, 2), rating mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT into film(title, description, release_year, language_id, rental_duration, rental_rate, "length", replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, "length", replacement_cost, rating);
END;
$$;

DROP PROCEDURE new_film;


CALL new_film('Yes', 'everyone said yes', 2023, 1, 5, 4.99, 120, 19.99, 'R')

SELECT *
FROM film 
ORDER BY release_year DESC;


-- QUESTION 2


CREATE OR REPLACE FUNCTION num_film(num_of_films INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE film_count INTEGER;
BEGIN 
	SELECT COUNT(*)
	INTO film_count
	FROM film_category
	WHERE category_id = num_of_films;
	RETURN film_count;
END;
$$;


SELECT *
FROM num_film(4);