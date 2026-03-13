/*
SOURCE /Users/ydo/Google Drive/AGU/GD Docs/Blockbusters/Level 1 - Academy Ninga (answers).sql
*/

/* save as CRLF for windows */

use blockbusters;

/*
			SELECT STATEMENTS
Usage:
	select <the information I want>
	from <table/tables>
	where <criteria>;

For example:
	select customer_id, first_name, last_name
	from customer
	where active = 1;

*/

/*	***************************************************
	*** LEVEL 1 - Academy ninja						***
	***												***
	*** Focus: 	simple select statements			***
	***			simple aggregation of data			***
	***			using count(), sum(), min()			***
	***			and avg(), NULL and NOT NULL		***
	***												***
	***			ordering data						***
	***												***
	***	Limits: Joining not more than two tables	***
	***			Single clause WHERE statements		***
	***												***
	***	Estimated time: 1 hour						***
	*************************************************** */

/*
1.0.  How many active customers are there?
(±4 lines, 1 table)
Answer: 16
*/

select customer_id, first_name, last_name
from customer
where active = 1
order by customer_id;


/*
1.1. How many categories of films are there?
(±2 lines, 1 table)
Answer: 16
*/


select count(*)
from category;


/*
1.2. Which database table has the most records?  How many?
(±2 lines, 1 table)
Answer: rental & payment
*/


select count(*)
from rental;


/*
1.3. In which year was the film ‚"Gold River" released?
(±3 lines, 1 table)
Answer: 1998
*/


select title, release_year
from film
where title = 'GOLD RIVER';


/*
1.4. How many films are exactly 3 hours in length?
(±3 lines, 1 table)
Answer: 7
*/


select count(*) as exactly_180_mins
from film
where length = 180;


/*
1.5. Which are the THREE longest films?
(±3 lines, 1 table, hint: ORDER BY ???? desc )
Answer: POND SEATTLE (190), CRYSTAL BREAKING (188), WORST BANGER (186)
*/


select title, length
from film
order by length desc
limit 3;


/*
1.6. Which are the TWO most expensive films to replace?
(±4 lines, 1 table)
Answer: FANTASIA PARK, FLOATS GARDEN (both 34.99)
*/


select title, replacement_cost
from film
order by replacement_cost desc
limit 2;


/*
1.7. How many films does blockbusters have in all of their stores?
(±4 lines, 2 tables, hint: it's NOT 1000)
Answer: 71025
*/


select count(*) as total_film_count
from inventory;



/*
1.8. What is the oldest film?  What is the most recent film?
(±3 lines, 1 table)
Answer: MENAGERIE RUSHMORE (1959), ARMY FLINTSTONES (2017)
*/


select film_id, title, min(release_year) as oldest
from film
group by film_id
order by oldest
limit 10;

update film set release_year = 1954 where film_id = 475;

select title, max(release_year) as newest
from film
group by title
order by newest;



/*
1.9. What is the average price of a film rental?
(±2 lines, 1 table, hint: use the "avg()" function)
Answer: 2.98
*/


select round(avg(rental_rate), 2) as average_rental_price
from film;


/*
1.10. How many customers have not provided an email?
(±3 lines, 1 table, hint: use "IS NULL")
Answer: 10
*/


select count(*) as no_email
from customer
where email is null;


/*
1.11. Which store has the most films?
(±3 lines, 1 table, hint: use "GROUP BY" )
Answer: Store 2 has 6348 films
*/


select store_id, count(*) as count_of_films
from inventory
group by store_id
order by count_of_films;



/*
1.12 Which film can be rented for the shortest length of time?
(±3 lines, 1 table, hint: use MIN() and "GROUP BY" )
Answer: AGENT TRUMAN (two days)
*/

select title, min(rental_duration) as shortest_time_in_days
from film
group by title
order by shortest_time_in_days
limit 5;


/*
1.13. How many customers did not return the DVD they rented?
(±3 lines, 1 table, hint: use "IS NULL")
Answer: 1446
*/
select count(*) as not_returned
from rental
where returned_date is null
and due_date < now();


/*
1.14. How many films were returned late?
(±3 lines, 1 table, hint: use ">" )
Answer: 1147
*/

select count(*) as returned_late
from rental
where returned_date > due_date;


/*
1.15. How many films are out on rent now?
(±4 lines, 1 table, hint: use the "now()" function and ">" and "IS NULL" )
Answer: WILL VARY
*/

select count(*) as on_rent_now
from rental
where due_date > now()
and returned_date is null;




