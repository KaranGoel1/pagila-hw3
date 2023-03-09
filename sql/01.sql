/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(*)
FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE country NOT LIKE 'United States';
