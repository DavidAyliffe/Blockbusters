/*	*******************************************************************************
	*** LEVEL 5 - ANBU															***
	***																			***
	*** Focus: 	joining to the same table many times							***
	***																			***
	***	Limits: 																***
	***																			***
	***																			***
	***	Estimated time: 2 lessons												***
	******************************************************************************* */


/*
4.0. Which film(s) star both "SUSAN DAVIS" and "HARVEY HOPE"?
(±8 lines, 5 tables)
Question: ??
Answer:
*/


select a1.first_name, a1.last_name, a2.first_name, a2.last_name, group_concat( fa1.film_id order by fa1.film_id )
from actor a1, actor a2, film_actor fa1, film_actor fa2
where a1.actor_id = fa1.actor_id
and  a2.actor_id = fa2.actor_id
and  fa1.film_id = fa2.film_id
and fa1.actor_id != fa2.actor_id
group by a1.first_name, a1.last_name, a2.first_name, a2.last_name
order by a1.first_name, a1.last_name, a2.first_name, a2.last_name;




select film.film_id, title
from film, film_actor as fa1, actor as a1, 
           film_actor as fa2, actor as a2
where a1.actor_id = fa1.actor_id
and film.film_id = fa1.film_id
and a1.first_name = 'WILL'
and a1.last_name = 'WILSON'

and a2.actor_id = fa2.actor_id
and film.film_id = fa2.film_id
and a2.first_name = 'MORGAN'
and a2.last_name = 'MCDORMAND'
order by title;


 
/*-
4.1. Which actor starred in both "SECRETARY ROUGE" and "ELIZABETH SHANE"?
(±8 lines, 5 tables)
Question: ??
Answer: Ben Willis
*/

select f1.title, f2.title, first_name, last_name
from actor, film_actor fa1, film f1, film_actor fa2, film f2
where actor.actor_id = fa1.actor_id
and actor.actor_id = fa2.actor_id

and fa1.film_id = f1.film_id
#and f1.title = 'SECRETARY ROUGE'
and f1.title = 'DEVIL DESIRE'

and fa2.film_id = f2.film_id
#and f2.title = 'ELIZABETH SHANE'
and f2.title = 'TREASURE COMMAND'

order by first_name, last_name;

/*
5.2. List the customers for each store.  Like this:
(±9 lines, 8 tables; hint: use the concat() function)
Answer: 
+----------+-----------------+------------+----------------+-------------+----------------+-------------+--------------------+
| store_id | name            | store_city | store_country  | customer_id | name           | cust_city   | cust_name          |
+----------+-----------------+------------+----------------+-------------+----------------+-------------+--------------------+
|        1 | Five Star Films | Edinburgh  | United Kingdom |          84 | SARA PERRY     | Atlixco     | Mexico             |
|        1 | Five Star Films | Edinburgh  | United Kingdom |         106 | CONNIE WALLACE | Ivanovo     | Russian Federation |
|        1 | Five Star Films | Edinburgh  | United Kingdom |         133 | PAULINE HENRY  | Torren      | Mexico             |
|        1 | Five Star Films | Edinburgh  | United Kingdom |         148 | ELEANOR HUNT   | Saint-Denis | Runion             |
|        1 | Five Star Films | Edinburgh  | United Kingdom |         152 | ALICIA MILLS   | Nagaon      | India              |
+----------+-----------------+------------+----------------+-------------+----------------+-------------+--------------------+
*/

select 	store.store_id as sid, 
		store.name,
		store_city.name as store_city,
		store_country.name as store_country, 
	   	customer_id as cid,
		concat(first_name, ' ', last_name) as name, 
		cust_city.name as cust_city, 
		cust_country.name as cust_country

from store, address as store_addr, city as store_city, country as store_country, 
	 customer, address as cust_addr, city as cust_city, country as cust_country

where store.address_id = store_addr.address_id
and store_addr.city_id = store_city.city_id
and store_city.country_id = store_country.country_id

and customer.address_id = cust_addr.address_id
and cust_addr.city_id = cust_city.city_id
and cust_city.country_id = cust_country.country_id

and store.store_id = customer.store_id
order by store.store_id, customer_id;


/*
5.3. For each member of staff, find out who she/he reports to.  Like this:
(±3 lines, 2 tables; hint: use the concat() function)
Question: ??
Answer: ??
+----------+----------------------+----------------------+
| store_id | staff_name           | manager_name         |
+----------+----------------------+----------------------+
|        1 | Jon Stephens         | Mike Hillyer         |
|        1 | Lajuana Borda        | Mike Hillyer         |
|        1 | Sherrell Mcanally    | Mike Hillyer         |
|        1 | Reyes Gwyn           | Mike Hillyer         |
+----------+----------------------+----------------------+
*/

select 	staff.store_id, 
		concat(staff.first_name, " ", staff.last_name) as staff_name,  
	   	concat(manager.first_name, " ", manager.last_name) as manager_name
from staff, staff as manager
where staff.manager_id = manager.staff_id;

/*
5.4. For each member of film, if there is a sequel, list the details.  Like this:
(±3 lines, 2 tables; hint: use the concat() function)
Question: ??
Answer: ??
+---------+------------------------------------+---------+------------------------------------+
| film_id | title                              | film_id | title                              |
+---------+------------------------------------+---------+------------------------------------+
|       7 | AIRPLANE SIERRA - THE BEGINNING    |     329 | AIRPLANE SIERRA - THE CONTINUATION |
|     329 | AIRPLANE SIERRA - THE CONTINUATION |     603 | AIRPLANE SIERRA - THE CONCLUSION   |
+---------+------------------------------------+---------+------------------------------------+
*/

select film.film_id, film.title, sequel.film_id, sequel.title
from film, film as sequel
where film.sequel_id = sequel.film_id
order by film.title;


/*
4.5. Find parents of customers
(about 3 lines; 2 tables)
Answer: ??
+------------------+---------------------+---------------+---------------------+
| customer         | dob                 | parent        | dob                 |
+------------------+---------------------+---------------+---------------------+
| DUANE YEE        | 1988-12-16 00:00:00 | MARION YEE    | 1962-11-29 00:00:00 |
...
+------------------+---------------------+---------------+---------------------+
*/


select 	customer.customer_id,
		concat(customer.first_name, ' ', customer.last_name) as customer, 
		customer.dob,
		parent.customer_id,
        concat(parent.first_name, ' ', parent.last_name) as parent, 
		parent.dob
from customer, customer parent
where customer.parent_id = parent.customer_id
order by customer.last_name;


/*
5.5. How many Indonesian customers have rented "TOURIST PELICAN" *AND* "AIRPORT POLLOCK" *AND* "SPOILERS HELLFIGHTERS"?
(±24 lines, 13 tables)
Question: ??
Answer: 13
*/

select distinct customer.customer_id, first_name, last_name, city.name as city, country.name as country
from rental as R1, inventory as I1, film as F1,
	 rental as R2, inventory as I2, film as F2,
	 customer, address, city, country
where country.country_id = city.country_id
and city.city_id = address.city_id
and address.address_id = customer.address_id

and customer.customer_id = R1.customer_id
and R1.inventory_id = I1.inventory_id
and I1.film_id = F1.film_id
and F1.title = "SPOILERS HELLFIGHTERS"

and customer.customer_id = R2.customer_id
and R2.inventory_id = I2.inventory_id
and I2.film_id = F2.film_id
and F2.title = "AIRPORT POLLOCK"

and country.name = 'Indonesia'
order by customer.customer_id, first_name, last_name, city.name, country.name;


/*
4.5. How many customers have rented both "TEQUILA PAST" *AND* "POCUS PULP"?
(about 24 lines, 6 tables)
Answer: ??
*/

select count(*)
from film f1, inventory i1, rental r1,
	 film f2, inventory i2, rental r2, customer
where f1.film_id = i1.film_id
and i1.inventory_id = r1.inventory_id
and f2.film_id = i2.film_id
and i2.inventory_id = r2.inventory_id
and f1.title = 'SAINTS BRIDE'
and f2.title = 'VALLEY PACKER'
and r1.customer_id = customer.customer_id
and r2.customer_id = customer.customer_id
and customer.sex = 'M';


/*
4.9. Who has rented the the film 'VIETNAM SMOOCHY' FOUR times?
(±22 lines, 13 tables)
Question: ??
Answer: ??
*/

select distinct customer.customer_id as id, concat(first_name, ' ', last_name) as name, film.title
from customer, 	rental as r1, inventory as i1,
				rental as r2, inventory as i2,
				rental as r3, inventory as i3,
				rental as r4, inventory as i4,
				rental as r5, inventory as i5,
				rental as r6, inventory as i6,
				rental as r7, inventory as i7, film
where customer.customer_id = r1.customer_id
and r1.inventory_id = i1.inventory_id
and i1.film_id = film.film_id

and customer.customer_id = r2.customer_id
and r2.inventory_id = i2.inventory_id
and i2.film_id = film.film_id

and customer.customer_id = r3.customer_id
and r3.inventory_id = i3.inventory_id
and i3.film_id = film.film_id

and customer.customer_id = r4.customer_id
and r4.inventory_id = i4.inventory_id
and i4.film_id = film.film_id

and customer.customer_id = r5.customer_id
and r5.inventory_id = i5.inventory_id
and i5.film_id = film.film_id

and customer.customer_id = r6.customer_id
and r6.inventory_id = i6.inventory_id
and i6.film_id = film.film_id

and customer.customer_id = r7.customer_id
and r7.inventory_id = i7.inventory_id
and i7.film_id = film.film_id

#and film.title = "VIETNAM SMOOCHY" 
and film.title like "%VIETNAM%SMOOCHY%" 

order by customer.customer_id, name, title;



/*
4.7. Which Chinese customer(s) rented an action film *AND* a travel film *AND* a Music film in the first 7 days of October 2016?
(±30 lines, 19 tables; hint: '2016-04-01 00:00:00' & '2016-04-08 00:00:00')
Question: ??
Answer: ??
*/

select distinct customer.customer_id, first_name, last_name, city.name as city_name, country.name as country_name
from customer, 	rental as r1, inventory as i1, film as f1, film_category as fc1, category as c1,
				rental as r2, inventory as i2, film as f2, film_category as fc2, category as c2,
				rental as r3, inventory as i3, film as f3, film_category as fc3, category as c3,
				address, city, country
where r1.inventory_id = i1.inventory_id
and i1.film_id = f1.film_id
and f1.film_id = fc1.film_id
and fc1.category_id = c1.category_id
and r1.rental_date >= '2019-08-01 00:00:00'
and r1.rental_date < '2019-09-01 00:00:00'
and c1.name = 'Action'
and r2.inventory_id = i2.inventory_id
and i2.film_id = f2.film_id
and f2.film_id = fc2.film_id
and fc2.category_id = c2.category_id
and r2.rental_date >= '2019-06-01 00:00:00'
and r2.rental_date < '2019-07-01 00:00:00'
and c2.name = 'Travel'
and r3.inventory_id = i3.inventory_id
and i3.film_id = f3.film_id
and f3.film_id = fc3.film_id
and fc3.category_id = c3.category_id
and r3.rental_date >= '2019-06-01 00:00:00'
and r3.rental_date < '2019-07-01 00:00:00'
and c3.name = 'Music'
and customer.customer_id = r1.customer_id
and customer.customer_id = r2.customer_id
and customer.customer_id = r3.customer_id
and customer.address_id = address.address_id
and address.city_id = city.city_id
and city.country_id = country.country_id
#and country.name = 'China'
order by customer.customer_id;



/*
4.8. Which actors have worked together the most?
(±9 lines, 4 tables)
Answer: ??
*/


select 	a1.actor_id,
		a1.first_name, 
		a1.last_name,
		a2.actor_id,
		a2.first_name,
		a2.last_name,
		count(*) as times_together
from actor a1, actor a2,
	 film_actor fa1, film_actor fa2
where a1.actor_id = fa1.actor_id
and a2.actor_id = fa2.actor_id
and fa1.film_id = fa2.film_id
and fa1.actor_id != fa2.actor_id
and fa1.actor_id > fa2.actor_id
and a1.sex = 'M'
and a2.sex = 'F'
group by a1.actor_id, a2.actor_id
having times_together > 3
order by times_together desc, a1.actor_id, a2.actor_id;




/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */



/*
4.12. Do staff live close to their store?
*/


select store.name, ci2.name, co2.name, concat( staff.first_name, ' ', staff.last_name ) as staff_name, ci1.name, co1.name
from staff, address ad1, city ci1, country co1, store, address ad2, city ci2, country co2
where staff.address_id = ad1.address_id
and ad1.city_id = ci1.city_id
and ci1.country_id = co1.country_id
and store.address_id = ad2.address_id
and ad2.city_id = ci2.city_id
and ci2.country_id = co2.country_id
and staff.store_id = store.store_id;



select staff_id, first_name, last_name, store_id
from staff
order by store_id;



select * from actor_info;

drop view v_staff;



/*
4.13. Some time ago, some films changed in price.  Which films?  What was the old and new price?
*/

select distinct film.film_id, title, p1.amount as old_price, p2.amount as new_price
from film, inventory i1, inventory i2, rental r1, rental r2, payment p1, payment p2
where film.film_id = i1.film_id
and i1.inventory_id = r1.inventory_id
and r1.rental_id = p1.rental_id
and film.film_id = i2.film_id
and i2.inventory_id = r2.inventory_id
and r2.rental_id = p2.rental_id
and p1.amount != p2.amount;


select payment_id from payment p1, payment p2 where p1.



/*
4.14. Do any members of staff have the password 'password' for their staff account?
(very easy; 3 lines; hint: MD5() )
*/


select *
from staff
where password = MD5('password');





