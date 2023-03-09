/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT t.title
FROM
(SELECT DISTINCT film.title, count(DISTINCT film_actor.actor_id) as actor_count 
FROM film 
INNER JOIN film_actor ON film_actor.film_id = film.film_id
WHERE film_actor.actor_id IN 
(SELECT film_actor.actor_id 
   FROM film_actor
   INNER JOIN film ON film.film_id = film_actor.film_id
   WHERE film.title = 'AMERICAN CIRCUS')
GROUP BY film.title) as t
WHERE t.actor_count >= 2
ORDER BY t.title ASC;

