#______________________________________________________________________QUESTION_1

#   A 

use sakila;

SELECT first_name, last_name 
FROM actor;

#   B 

SELECT UPPER(CONCAT(first_name," ",last_name)) as Actor_Name FROM actor;

#_______________________________________________________________________QUESTION_2

#	A

SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = "JOE";

#	B

SELECT last_name FROM actor
WHERE last_name LIKE '%GEN%';

#	C 

SELECT last_name, first_name FROM actor
WHERE last_name LIKE '%LI';

#	D 

 SELECT country_id, country FROM country
 WHERE country IN ('AFGHANISTAN' , 'BANGLADESH', 'CHINA');

#__________________________________________________________________________QUESTION_3	

#	A   

ALTER TABLE actor
ADD COLUMN description BLOB(120) AFTER Actor_Name;

#	B 

ALTER TABLE actor
DROP description;

#_________________________________________________________________________QUESTION_4

#	A 

SELECT last_name,
COUNT(last_name) AS Same_Last_Name
FROM actor
GROUP BY last_name;

#	B 

SELECT last_name,
COUNT(last_name) AS Same_Last_Name
FROM actor
GROUP BY last_name
HAVING Same_Last_Name = 2 OR Same_Last_Name > 2 ;

#	C 

SET SQL_SAFE_UPDATES = 0;
UPDATE actor
SET first_name = "HARPO", last_name = "WILLIAMS"
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

#	D 

UPDATE actor
SET first_name = "GROUCHO", last_name = "WILLIAMS"
WHERE first_name = "HARPO" AND last_name = "WILLIAMS";

#__________________________________________________________________________QUESTION_5

#	A  

CREATE TABLE address_recreated  SELECT * FROM address ;

#___________________________________________________________________________QUESTION_6

#	A	 

SELECT
      first_name, last_name, address
FROM 
	 staff a1 
		JOIN 
     address a2 ON a1.address_id = a2.address_id;   
     
#    B 

SELECT t1.staff_id, t1.first_name, t1.last_name, SUM(amount) AS total

FROM staff t1

JOIN payment t2

ON t1.staff_id = t2.staff_id

WHERE payment_date LIKE '2005-08%'

GROUP BY t1.staff_id;

#	C 

SELECT act1.title, act1.film_id , COUNT(act2.actor_id) AS Number_of_actors

FROM film act1

JOIN film_actor act2

ON act1.film_id = act2.film_id

GROUP BY act1.title;

#    D

SELECT cp2.title, COUNT(cp1.inventory_id) AS Number_of_Copies

FROM inventory cp1

JOIN film cp2

ON cp1.film_id = cp2.film_id

WHERE cp2.title = 'Hunchback Impossible'

GROUP BY cp2.title;


#    E 

SELECT pay2.last_name, pay2.first_name, SUM(pay1.amount) AS Total_paid_by_each_customer

FROM payment pay1

JOIN customer pay2

ON pay1.customer_id = pay2.customer_id

GROUP BY last_name ASC;

#_____________________________________________________________________QUESTION_7

#    A  

SELECT title FROM film

WHERE title LIKE 'K%' OR title LIKE 'Q%' 

AND language_id = (

SELECT language_id FROM language

WHERE name = 'English'

);

#    B 

SELECT first_name, last_name FROM actor

WHERE actor_id IN 

(
 SELECT actor_id FROM film_actor WHERE film_id = 
  (
    SELECT film_id FROM film WHERE title = 'Alone Trip'
  )
);

#    C 

SELECT email FROM customer 

JOIN(address) ON customer.address_id=address.address_id

JOIN(city) ON address.city_id=city.city_id

JOIN(country) ON city.country_id=country.country_id

WHERE country='Canada';
    
#    D

SELECT title FROM film

WHERE film_id IN 

(
 SELECT film_id FROM film_category WHERE category_id = 
  (
    SELECT category_id FROM category WHERE name = 'Family'
  )
);

#    E 

SELECT title, COUNT(inventory_id) as Most_rented_movies FROM film 

JOIN inventory ON film.film_id = inventory.film_id

GROUP BY title

ORDER BY Most_rented_movies DESC;

#    F

SELECT s.store_id, SUM(p.amount) FROM store s 

JOIN customer c ON s.store_id = c.store_id

JOIN payment p ON p.customer_id = c.customer_id 

GROUP BY s.store_id;

#    G

SELECT store_id, city, country from store s 

JOIN address a ON s.address_id = a.address_id 

JOIN city c ON a.city_id = c.city_id

JOIN country u ON c.country_id = u.country_id

GROUP BY s.store_id;

#    H

SELECT c.name, SUM(p.amount) AS TOP5_gross_revenue_by_genre FROM category c

JOIN film_category fc ON c.category_id = fc.category_id

JOIN inventory i ON i.film_id = fc.film_id

JOIN rental r ON r.inventory_id = i.inventory_id

JOIN payment p ON p.rental_id = r.rental_id

GROUP BY c.name 

ORDER BY p.amount DESC

LIMIT 5;

#______________________________________________________________QUESTION_8

#    A 

CREATE VIEW TOP5_genres as

SELECT c.name, SUM(p.amount) AS TOP5_genres FROM category c

JOIN film_category fc ON c.category_id = fc.category_id

JOIN inventory i ON i.film_id = fc.film_id

JOIN rental r ON r.inventory_id = i.inventory_id

JOIN payment p ON p.rental_id = r.rental_id

GROUP BY c.name 

ORDER BY p.amount DESC

LIMIT 5;

#    B 

SELECT * FROM TOP5_genres;

#    C 

DROP VIEW TOP5_genres;