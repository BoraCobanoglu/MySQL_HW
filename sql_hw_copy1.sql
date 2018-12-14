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

