/*
 * Compute the country with the most customers in it. 
 */

SELECT country.country
FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON country.country_id = city.country_id
GROUP BY country.country
ORDER BY COUNT(*) DESC
LIMIT 1;
