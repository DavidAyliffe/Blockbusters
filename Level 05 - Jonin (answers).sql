/*	*******************************************************************************
	*** LEVEL 5 - Jonin															***
	***																			***
	*** Focus: 	in()/not in()													***
	***																			***
	***	Limits: Joining not more than six tables								***
	***			Multi parameter WHERE clause									***
	***																			***
	***	Estimated time: 2 lessons												***
	******************************************************************************* */

/*
SOURCE /Users/ydo/Google Drive/AGU/GD Docs/Blockbusters/Level 5 - Jonin (answers).sql
*/

use blockbusters;



/*
5.0. How many customers have not rented a movie from:
     "Flicks" or "Cinefile" or "La Dolce Video"?
(±14 lines, 5 tables, hint: not in(); )
Answer: ??? customers
*/
select count(*) as cust_no_rental
from customer
where customer_id not in
(
	select distinct customer.customer_id
	from rental, customer, inventory, store
	where rental.customer_id = customer.customer_id
	and rental.inventory_id = inventory.inventory_id
	and inventory.store_id = store.store_id
	and store.name in ( 'Flicks', 'Cinefile', 'La Dolce Video' )
);


/*
5.1. Which country(ies) do(es) not have any customers?
(±10 lines, 4 tables, hint: not in)
Answer: ??
*/

select country.name
from country
where country.country_id not in
(
	select city.country_id
	from customer, address, city
	where customer.address_id = address.address_id
	and address.city_id = city.city_id
)
order by country.name;


/*
5.2. Which actresses have not acted in any Adult films or Dramas?
(±10 lines, 5 or 6 tables, hint: not in)
Answer: ??
*/

select actor_id, first_name, last_name, sex
from actor
where actor_id not in
(
	select actor.actor_id
	from actor, film_actor, film, film_category, category
	where actor.actor_id = film_actor.actor_id
	and film_actor.film_id = film.film_id
	and film.film_id = film_category.film_id
	and film_category.category_id = category.category_id
	and category.name in ('Adult', 'Drama')
)
and actor.sex = 'F'
order by actor_id, first_name, last_name;


/*
5.3. List the cities that have no customers.
(±7 lines, 3 tables, hint: not in)
Answer: ??
*/
select city.name
from city
where city_id not in
(
	select city_id
    from address, customer
    where address.address_id = customer.customer_id
);

/*
5.4. Which film(s) does "Rentertainment" not have any copies of?
(±10 lines, ±4 tables, hint: not in)
Answer: ??
*/

select film_id, title 
from film 
where film_id not in
(
	select film.film_id
	from film, inventory, store
	where film.film_id = inventory.film_id
	and inventory.store_id = store.store_id
	and store.name = 'Rentertainment'
)
order by film_id;




/*
5.5. Which film(s) is/are exclusive to "Mr. Video"?
(±10 lines, ±3 tables, hint: not in)
Answer: ??
*/

select distinct film.film_id, title
from film
where film.film_id not in
(
	select film_id
	from inventory, store
	where inventory.store_id = store.store_id
	and store.name != 'Mr. Video'
);


/*
5.6. Which rentals have not been paid for?
(±7 lines, 3 tables, hint: not in)
Answer: ??
*/
select *
from rental
where rental_id not in 
(
	select rental_id
    from payment
);


/*
5.7. Which store(s) doesn't have any customers from Egypt?
(±11 lines, 5 tables, hint: not in)
Answer: ??
*/

select store_id, name
from store
where store_id not in
(
	select distinct store_id
	from customer, address, city, country
	where customer.address_id = address.address_id
	and address.city_id = city.city_id
	and city.country_id = country.country_id
	and country.name = 'Egypt'
)
order by store_id, name;


/*
5.8. Per store, which films have not been rented yet?
(±9 lines, 6 tables (BONUS: only 4 tables is possible), hint: not in)
Answer: ??
*/

select distinct store.store_id, name, title
from film, inventory, store
where film.film_id = inventory.film_id
and inventory.store_id = store.store_id
and ( store.store_id, film.film_id ) not in 
(
	select distinct store.store_id, inventory.film_id
	from store, inventory, rental
	where inventory.inventory_id = rental.inventory_id
	and inventory.store_id = store.store_id
)
order by store.store_id, name, title;




/*
5.9. Which actors have never worked together?
(±13 lines, 4 tables, hint: not in)
Answer: ??
*/

select distinct a1.actor_id, concat(a1.first_name, ' ', a1.last_name) as actor_1, 
				a2.actor_id, concat(a2.first_name, ' ', a2.last_name) as actor_2
from actor a1, actor a2
where ( a1.actor_id, a2.actor_id ) not in
(
	select distinct fa1.actor_id, fa2.actor_id
	from film_actor fa1, film_actor fa2
	where fa1.film_id = fa2.film_id
	and fa1.actor_id != fa2.actor_id	
)
and a1.actor_id != a2.actor_id
order by actor_1, actor_2;


/*
5.10. Which actresses have not worked with JOHN SUVARI or RUSSELL CLOSE or BURT PHOENIX?
(±11 lines, 4 tables, hint: not in; be careful with your () )
Answer: ??
*/

select actor_id, first_name, last_name
from actor
where actor_id not in
(
	select fa2.actor_id
	from actor, film_actor fa1, film_actor fa2
	where actor.actor_id = fa1.actor_id
	and fa1.film_id = fa2.film_id
	and ( ( actor.first_name, actor.last_name ) = ( 'JOHN', 'SUVARI' )
	   or ( actor.first_name, actor.last_name ) = ( 'RUSSELL', 'CLOSE' )
       or ( actor.first_name, actor.last_name ) = ( 'BURT', 'PHOENIX' ) )
)
and actor.sex = "F";



/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
5.11. Which customer(s) have never returned a film late?
(±11 lines, 2 tables, hint: not in)
Answer: ??
*/

select first_name, last_name
from customer
where customer_id not in 
(
	select distinct customer_id
	from rental
	where returned_date > due_date
)
order by customer_id;


/*
5.12. Which film(s) have never been lost/stolen?
(±11 lines, 5 tables, hint: not in)
Answer: ??
*/

select distinct film.film_id, title
from film, inventory
where film.film_id = inventory.film_id
and inventory_id not in
(
	select inventory_id
	from rental
	where returned_date is null
	and due_date < now()
);

/*
5.13. Which film(s) have not been rented so far this year?
(±? lines, ? tables, hint: DATE_FORMAT() or YEAR())
Answer: ??
*/

select distinct film.film_id, film.title
from film, inventory
where film.film_id = inventory.film_id
and inventory.film_id not in 
(
	select film_id
	from rental, inventory
	where rental.inventory_id = inventory.inventory_id
    and year(rental_date) = year(now())
);


/*
5.14. Which female customer(s) have never rented any Hindi War films or Turkish Comedies?
(±27 lines, ±15 tables, hint: not in x 2)
Answer: ??
*/

select distinct c.customer_id, c.first_name, c.last_name, c.sex
from customer c
where c.sex = 'F'
and c.customer_id not in
(
	select distinct customer.customer_id
	from customer, rental, inventory, film, film_category, category, language
	where customer.customer_id = rental.customer_id
	and rental.inventory_id = inventory.inventory_id
	and inventory.film_id = film.film_id
	and film.film_id = film_category.film_id
	and film_category.category_id = category.category_id
	and film.language_id = language.language_id
	and language.name = 'Hindi'
	and category.name = 'War'
)
and c.customer_id not in
(
	select distinct customer.customer_id
	from customer, rental, inventory, film, film_category, category, language
	where customer.customer_id = rental.customer_id
	and rental.inventory_id = inventory.inventory_id
	and inventory.film_id = film.film_id
	and film.film_id = film_category.film_id
	and film_category.category_id = category.category_id
	and film.language_id = language.language_id
	and language.name = 'Turkish'
	and category.name = 'Comedy'
);