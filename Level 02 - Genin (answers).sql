/*	*******************************************************************************
	*** LEVEL 2 - Genin															***
	***																			***
	*** Focus: 	Joining more than one table										***
	***			simple select statements										***
	***			simple aggregation of data using count()						***
	***			grouping data													***
	***																			***
	***	Limits: Joining not more than six tables								***
	***			Multi parameter WHERE clause									***
	***																			***
	***																			***
	***	Estimated time: 2 lessons												***
	******************************************************************************* */

/*
SOURCE /Users/davidayliffe/Google Drive/AGU/GD Docs/Blockbusters/Level 2 - Genin (answers).sql
*/


/*
2.0. Which staff member has rented the most films to customers?
(±4 lines, 2 tables)
*/

select staff.staff_id, count(*) as films_rented
from staff, payment
where staff.staff_id = payment.staff_id
group by staff.staff_id;


/*
2.1. How many Turkish cities are in the database?
(±4 lines, 2 tables)
Answer: 15
*/


select country.name, COUNT(*)
from city, country
where city.country_id = country.country_id
and country.name = 'TURKEY'
group by country.name;



/*
2.2. What is the most popular language of films?
(±4 lines, 2 tables)
Answer: Japanese
*/


select name, count(*) as no_of_films
from language, film
where language.language_id = film.language_id
group by name
order by no_of_films desc
limit 5;


/*
2.3. Which customer has rented the most films?
(±4 lines, 2 tables)
Answer: BOBBY BOUDREAU (381) has rented 399 films
*/
select first_name, last_name, count(*) as rented_count
from customer, rental
where customer.customer_id = rental.customer_id
and sex = 'M'
group by customer.customer_id
order by rented_count desc
limit 10;


/*
2.4. How many copies of the film 'WORKER TARZAN' does 'The Film Station' have?
(±4 lines, 3 tables)
Answer: 6 copies
*/

select store.name, title, count(*) as no_of_copies
from film, inventory, store
where film.film_id = inventory.film_id
and inventory.store_id = store.store_id
and film.title = 'AFRICAN EGG'
and store.name = 'Flicks'
group by store.name, title;


/*
2.5. Which is the busiest store?
(¬±6 lines, 3 tables)
Answer: |        5 | Video Paradiso      |        24420 |
*/


select store.store_id, name, count(*) as rental_count
from store, inventory, rental
where store.store_id = inventory.store_id
and inventory.inventory_id = rental.inventory_id
group by store.store_id
order by rental_count desc;


/*
2.6. List actors starred in the film 'Sky Miracle'?
(¬±7 lines, 3 tables)
Answer: 12 actors
*/


select title, first_name, last_name
from film, film_actor, actor
where film.film_id = film_actor.film_id
and film_actor.actor_id = actor.actor_id
and film.title = 'MOON BUNCH'
and sex = 'F'
order by title, first_name;



/*
2.7. In how many films was Jeff Silverstone an actor?
(¬±7 lines, 3 tables)
Answer: 25 films
*/


select actor.first_name, actor.last_name, count(*) as film_count
from film, film_actor, actor
where film.film_id = film_actor.film_id
and film_actor.actor_id = actor.actor_id
and actor.first_name = 'Jeff'
and actor.last_name = 'Silverstone'
group by actor.actor_id;



/*
2.8. Which country has the most customers? How many?
(¬±7 lines, 4 tables)
Answer: India has 60 customers
*/


select country.name, count(*) as no_of_customers
from customer, address, city, country
where customer.address_id = address.address_id
and address.city_id = city.city_id
and city.country_id = country.country_id
group by country.name
order by no_of_customers desc
limit 1;


/*
2.9. How many customers live in Turkey?
(±7 lines, 4 tables)
Answer: 15
*/


select country.name, city.name, count(country.country_id) AS NO_OF_CUSTOMERS
from customer, address, city, country
where customer.address_id = address.address_id
and address.city_id = city.city_id
and city.country_id = country.country_id
and country.name = 'TURKEY'
group by country.name, city.name
order by NO_OF_CUSTOMERS;


/*
2.10. What is the most popular comedy film?
(¬±9 lines; 5 tables)
Answer: STRICTLY SCARFACE
*/


select title, count(rental_date) as times_rented
from film, film_category, category, inventory, rental
where film.film_id = film_category.film_id
and film_category.category_id = category.category_id
and category.name = 'COMEDY'
and film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
group by title
order by times_rented desc limit 5;



/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
2.11. Which store has the most films?
(±5 lines, 2 tables )
Answer:
*/
select store_id, count(*)
from inventory
group by store_id
order by count(*) desc;



/*
2.12. Which is the most popular 'R' rated film?
*/

select title, count(*)
from film, inventory, rental
where film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
and film.rating = 'R'
group by title
order by count(*) desc
limit 5;



/*
2.13. In which month in which year has blockbusters rented the most films?
Hint: date_format( ???, '%Y-%m' )
*/

select date_format(rental_date, '%Y-%m'), count(*)
from rental
group by date_format(rental_date, '%Y-%m')
order by count(*) desc;


/*
2.14. Who was the first customer to join blockbusters and for how many days have they been a member?
(3 lines, 1 table )
Hint: datediff( ???, ??? )
*/

select first_name, last_name, created_date, datediff(now(), created_date) as days_joined
from customer
order by days_joined desc;



/*
2.15. Do any customers have their birthday today?  How old are they?
Hint: date_format( ???,'%m-%d' ); datediff( date1, date2 )
*/

select first_name, last_name, dob, date_format(dob,'%m-%d'), TIMESTAMPDIFF(YEAR, dob, now()) AS age
from customer
where date_format(dob,'%m-%d') = date_format(now(),'%m-%d')
limit 5;



select customer_id, first_name, last_name, dob, datediff( NOW(), dob ) / 365 as age
from customer
where date_format(dob,'%m-%d') = date_format(NOW(),'%m-%d');







/*
2.16. For each actor, list the languages of the films they have starred in?
Hint: group_concat()
+-------------+-----------+--------------------------------------------------------------------------------------+
| first_name  | last_name | languages                                                                            |
+-------------+-----------+--------------------------------------------------------------------------------------+
| PENELOPE    | GUINESS   | Arabic,Japanese,Khmer,Malay,Mandarin,Punjabi,Russian,Swahili,Thai,Turkish,Vietnamese                                                                       |
*/

select actor.actor_id, first_name, last_name, group_concat( distinct language.name order by language.name )
from actor, film_actor, film, language
where actor.actor_id = film_actor.actor_id
and film_actor.film_id = film.film_id
and film.language_id = language.language_id
group by actor.actor_id, first_name, last_name;
