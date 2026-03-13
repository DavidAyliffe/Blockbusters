/*	*******************************************************************************
	*** LEVEL 3 - Chunin														***
	***																			***
	***	Focus:  Joining not more than six tables								***
	***			Multi parameter WHERE clause									***
	***			Functions beyond count(*) (having, now)							***
	***																			***
	***	Estimated time: 2 classes												***
	***************************************************************************** */

/*
SOURCE /Users/ydo/Google Drive/AGU/GD Docs/Blockbusters/Level 3 - Chunin (answers).sql
*/


/*
3.0. How many films are suitable for children at the Bangkok store?
(±8 lines, 5 tables)
Answer: 1162
*/

select city.name, film.rating, count(*) as kids_films_in_BKK
from film, inventory, store, address, city
where film.film_id = inventory.film_id
and inventory.store_id = store.store_id
and store.address_id = address.address_id
and address.city_id = city.city_id
and city.name = 'Bangkok'
and film.rating = 'PG'
group by city.name, film.rating;


/*
3.1. Which actor has starred in the most films?
(±7 lines; 3 tables)
Answer: ID:107 GINA DEGENERES has starred in 42 films
*/


select 	actor.actor_id, 
		first_name, last_name, 
		count(*) as no_of_films
from film, film_actor, actor
where film.film_id = film_actor.film_id
and film_actor.actor_id = actor.actor_id
group by actor.actor_id
order by count(*) desc
limit 10;


/*
3.2. Which DVD was most often returned late?
(±4 lines, 1 table, hint: use the now() function; is null)
Answer: ??? + ??? = ???
*/


select title, count(*) as late
from film, inventory, rental
where film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
and returned_date > due_date
group by title
order by late desc
limit 10;



/*
3.3. Who has lost/stolen the most DVD(s) they rented?
(±8 lines, 4 tables, hint: use the now() function; is null)
Answer:
*/


select customer.customer_id as cid, concat(first_name, ' ', last_name) as customer_name, count(*) as stolen_or_lost
from rental, customer
where rental.customer_id = customer.customer_id
and due_date <= now()
and returned_date is null 
group by customer.customer_id
order by stolen_or_lost desc, customer.customer_id
limit 5;



/*
3.4. Which is the most popular film to steal?
(±8 lines, 3 tables, hint: use the now() function; is null)
Answer: SUMMER SCARFACE (8 unreturned copies) 
*/


select title, count(*) as times_stolen
from rental, inventory, film
where rental.inventory_id = inventory.inventory_id
and inventory.film_id = film.film_id
and due_date <= now()
and returned_date is null 
group by title
order by times_stolen desc, title
limit 10;


/*
3.5. How many <language> films are <category>?
(±8 lines, 4 tables)
Answer: 11
*/


select language.name, category.name, count(category.name) as no_of_films
from film, film_category, category, language
where film.film_id = film_category.film_id
and film_category.category_id = category.category_id
and film.language_id = language.language_id
and category.name = 'Documentary'
and language.name = 'Arabic'
group by language.name, category.name;


/*
3.6. Which customers have spent more than $1200 on film rentals?
(±8 lines, 3 tables; hint:use the sum() function; use having() )
Answer: 6 customers
*/


select customer.customer_id, first_name, last_name, sum(amount) AS spent_on_rentals
from customer, rental, payment
where customer.customer_id = rental.customer_id
and customer.customer_id = payment.customer_id
and rental.rental_id = payment.rental_id
group by customer.customer_id, first_name, last_name
having spent_on_rentals > 15000
order by spent_on_rentals desc;




/*
3.7. Which category of film is the most popular?
(±8 lines, 5 tables)
Answer: Sports, 14873
*/


select name, count(*) AS number_rented
from category, film_category, inventory, rental, film
where category.category_id = film_category.category_id
and film_category.film_id = film.film_id
and film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
group by name
order by number_rented desc
limit 5;


/*
3.8. Which male customers have rented >= 100 horror movies?
(±10 lines; 6 tables)
Answer: 8 customers
+-------------+------------+-----------+---------------------+
| customer_id | first_name | last_name | HORROR_FILMS_RENTED |
+-------------+------------+-----------+---------------------+
|         374 | JEREMY     | HURTADO   |                  30 |
|         406 | NATHAN     | RUNYON    |                  30 |
|         508 | MILTON     | HOWLAND   |                  30 |
|         275 | CAROLE     | BARNETT   |                  31 |
|         578 | WILLARD    | LUMPKIN   |                  31 |
|         592 | TERRANCE   | ROUSH     |                  32 |
|          16 | SANDRA     | MARTIN    |                  35 |
|         346 | ARTHUR     | SIMPKINS  |                  38 |
+-------------+------------+-----------+---------------------+
*/

select customer.customer_id, first_name, last_name, count(name) AS films_rented
from category, film_category, film, inventory, rental, customer
where category.category_id = film_category.category_id
and film_category.film_id = film.film_id
and film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
and rental.customer_id = customer.customer_id
and sex = 'M'
and category.name = 'ADULT'
group by customer.customer_id, first_name, last_name
having films_rented >= 30
order by films_rented desc, customer.customer_id;




/*
3.9. Which film category generated the highest rental income?
(±9 lines, 6 tables)
Answer: Sports is the most profitable (47090.27)
*/


select category.name, sum(payment.amount) as total_income_generated
from category, film_category, film, inventory, rental, payment
where category.category_id = film_category.category_id
and film_category.film_id = film.film_id
and film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
and rental.rental_id = payment.rental_id
group by category.name
order by total_income_generated desc;


/*
3.10. Which actor has earned blockbusters the most money?
(±9 lines, 6 tables; hint use the 'sum()' function; see Question 3.1 for help)
Answer: 107 GINA DEGENERES 28360.98
*/


select actor.actor_id, first_name, last_name, sum(amount) as amount_earned
from actor, film_actor, film, inventory, rental, payment
where actor.actor_id = film_actor.actor_id
and film_actor.film_id = film.film_id
and film.film_id = inventory.film_id
and inventory.inventory_id = rental.inventory_id
and rental.rental_id = payment.rental_id
group by actor.actor_id
order by amount_earned desc
limit 10;






/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
3.11. Calculate the total rental revenue for each city.
*/

select city.name, sum(amount) as revenue
from city, address, customer, rental, payment
where city.city_id = address.city_id
and address.address_id = customer.address_id
and customer.customer_id = rental.customer_id
and rental.rental_id = payment.rental_id
group by city.name
order by revenue desc;




/*
3.13. Who has been the most active customer in the last 90 days?
(Hint: use DATE_SUB())
*/

select first_name, last_name
from customer, rental
where customer.customer_id = rental.customer_id
and rental_date >= date_sub(now() interval 90 day)


/*
3.12. Which store has the most XXX films?
*/

select store.name, category.name, count(*) as most_porn
from store, inventory, film, film_category, category
where store.store_id = inventory.store_id
and inventory.film_id = film.film_id
and film.film_id = film_category.film_id
and film_category.category_id = category.category_id
and category.name = 'Adult'
group by store.name, category.name
order by most_porn desc;



/*
3.12. Are there any actresses who have only appeared in adult films?
*/

select actor.actor_id, count(*)
from actor, film_actor
(
	select actor.actor_id, count(*)
	from actor, film_actor, film, film_category, category
	where actor.actor_id = film_actor.actor_id
	and film_actor.film_id = film.film_id
	and film.film_id = film_category.film_id
	and film_category.category_id = category.category_id
	and category.name = 'Adult'
	and actor.sex = 'F'
	group by actor.actor_id	
) myAdultTable
where actor.actor_id = film_actor.actor_id



/*
3.13. How many films does blockbuster have?
±5 lines, two tables
HINT: select count( distinct inventory.inventory_id )
*/

select count( distinct inventory.inventory_id )
from inventory, rental
where inventory.inventory_id = rental.inventory_id
and ( returned_date is not null and due_date < now() )
order by inventory.inventory_id;







