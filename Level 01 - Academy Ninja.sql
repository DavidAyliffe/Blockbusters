/*
			SELECT STATEMENTS
Usage:
	select <the information I want>
	from <table/tables>
	where <criteria>;
*/

/*	*******************************************************************************
	*** LEVEL 1 - Academy ninja                                                 ***
	***                                                                         ***
	*** Focus: 	simple select statements                                        ***
	***         simple aggregation of data                                      ***
	***         using count(), sum(), min()                                     ***
	***         and avg(), NULL and NOT NULL                                    ***
	***                                                                         ***
	***         ordering data                                                   ***
	***                                                                         ***
	***	Limits: Joining not more than two tables                                ***
	***			Single clause WHERE statements                                  ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */

use blockbusters;


/*
1.0.  Who are the active customers?
(±3 lines, 1 table)
Answer: 16
*/

select customer_id, first_name, last_name
from customer
where active = 1
order by customer_id;


/*
1.0. How many categories of films are there?
(±2 lines, 1 table)
Answer:
*/

select count(*)
from category;


/*
1.1. In which year was the film "SAMURAI LION" released?
(±3 lines, 1 table)
Answer = 
*/





/*
1.2. How many customers have the first name "ROSS"?
(±3 lines, 1 table)
Answer = 
*/



/*
1.3. What is the name of the store whose ID is 6?
(±3 lines, 1 table)
Answer = 
*/




/*
1.4. How many films are exactly 1 1/2 hours in length?
(±3 lines, 1 table)
Answer:
*/




/*
1.5. Which are the longest films?
(±3 lines, 1 table, hint: ORDER BY ???? desc )
Answer:
*/





/*
1.6. What are the cheapest films to replace?
(±4 lines, 1 table)
Answer:
*/





/*
1.7 Which film can be rented for the shortest length of time?
(±3 lines, 1 table )
Answer:
*/





/*
1.8. What is the newest film?
(±3 lines, 1 table)
Answer:
*/






/*
1.9. What is the average price of a film rental?
(±2 lines, 1 table, hint: use the "avg()" function)
Answer:
*/





/*
1.10. How many customers have not provided an email?
(±3 lines, 1 table, hint: use "IS NULL")
Answer:
*/





/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
1.11. How many films does blockbusters have in all of their stores?
(2 lines, 1 table, hint: it's NOT 1000)
Answer:
*/





/*
1.12. How many customers did not return the DVD they rented?
(±3 lines, 1 table, hint: use "IS NULL"; use now())
Answer:
*/




/*
1.13. How many films can be rented for 10 or more days, but less than 20 days?
(±4 lines, 1 table)
Answer:
*/



/*
1.14. How many films were returned late?
(±3 lines, 1 table, hint: use ">" )
Answer:
*/





/*
1.15. How many films are out on rent now?
(±4 lines, 1 table, hint: use the "now()" function and ">" and "IS NULL" )
Answer:
*/