/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


SELECT DISTINCT actor.first_name || ' ' || actor.last_name AS "Actor Name"
FROM actor
INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.actor_id IN
(SELECT DISTINCT film_actor.actor_id
    FROM film_actor
WHERE film_actor.film_id IN
(SELECT film_actor.film_id
    FROM film_actor
   INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id IN
(SELECT actor.actor_id
FROM actor
INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name || ' ' || actor.last_name != 'RUSSELL BACALL' and film_actor.film_id IN
(SELECT film_actor.film_id
    FROM film_actor
   INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'))
EXCEPT
SELECT film_actor.film_id
    FROM film_actor
   INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL')
EXCEPT
SELECT actor.actor_id
FROM actor
INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name || ' ' || actor.last_name != 'RUSSELL BACALL' and film_actor.film_id IN
(SELECT film_actor.film_id
    FROM film_actor
   INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'))
ORDER BY "Actor Name" ASC;

