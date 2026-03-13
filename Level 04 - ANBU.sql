/*	*******************************************************************************
	*** LEVEL 4 - ANBU							                                ***
	***									                                        ***
	*** Focus: 	joining to the same table many times			                ***
	***									                                        ***
	***	Limits: 							                                    ***
	***									                                        ***
	***									                                        ***
	***	Estimated time: 2 lessons					                            ***
	******************************************************************************* */

use blockbusters;

/*
4.0. Which actor(s) starred in both "GORGEOUS BINGO" and "SONS INTERVIEW"?
(about 9 lines, 5 tables)
Answer:
*/
select 	first_name, last_name, 
		concat( first_name, ' ', last_name ) as full_name

from actor, film_actor as fa1, film as f1, 
			film_actor as fa2, film as f2
			
where actor.actor_id = fa1.actor_id
and actor.actor_id = fa2.actor_id

and fa1.film_id = f1.film_id
and f1.title = 'GORGEOUS BINGO'

and fa2.film_id = f2.film_id
and f2.title = 'SONS INTERVIEW'

order by first_name, last_name;



/*
4.1. Which film(s) star both "WILL WILSON" and "MORGAN MCDORMAND"?
(about 8 lines, 5 tables, maybe use GROUP_CONCAT())
Answer: ??
*/






/*
4.2. Which actresses have worked together the most?
(about 9 lines, 4 tables; hint: join the two film_actor tables TWICE)
Answer: ??
*/






/*
4.3. How many customers have rented both "TEQUILA PAST" *AND* "POCUS PULP"?
(about 10 lines, 7 tables)
Answer: ??
*/





/*
4.4. List the customers for each store.  Like this:
(about 9 lines, 8 tables; hint: use the concat() function to put the customer's name together)
Answer: 
+-----+-----------------+------------+----------------+-----+----------------+-------------+--------------------+
| sid | name            | store_city | store_country  | cid | name           | cust_city   | cust_country       |
+-----+-----------------+------------+----------------+-----+----------------+-------------+--------------------+
|   1 | Five Star Films | Edinburgh  | United Kingdom |  84 | SARA PERRY     | Atlixco     | Mexico             |
|   1 | Five Star Films | Edinburgh  | United Kingdom | 106 | CONNIE WALLACE | Ivanovo     | Russian Federation |
|   1 | Five Star Films | Edinburgh  | United Kingdom | 133 | PAULINE HENRY  | Torren      | Mexico             |
|   1 | Five Star Films | Edinburgh  | United Kingdom | 148 | ELEANOR HUNT   | Saint-Denis | Runion             |
|   1 | Five Star Films | Edinburgh  | United Kingdom | 152 | ALICIA MILLS   | Nagaon      | India              |
+-----+-----------------+------------+----------------+-----+----------------+-------------+--------------------+
*/






/*
4.5. How many Indonesian customers have rented "AIRPORT POLLOCK" *AND* "SPOILERS HELLFIGHTERS"?
(about 24 lines, 10 tables)
Answer: ??
*/






/*
4.6. Who has rented the the film 'VIETNAM SMOOCHY' FOUR times?
(about 22 lines, 13 tables)
Answer: ??
*/





/*
4.7. For each film, if there is a sequel, list the details.  Like this:
(about 3 lines, 2 tables)
Answer: ??
+---------+------------------------------------+---------+------------------------------------+
| film_id | title                              | film_id | title                              |
+---------+------------------------------------+---------+------------------------------------+
|       7 | AIRPLANE SIERRA - THE BEGINNING    |     329 | AIRPLANE SIERRA - THE CONTINUATION |
|     329 | AIRPLANE SIERRA - THE CONTINUATION |     603 | AIRPLANE SIERRA - THE CONCLUSION   |
+---------+------------------------------------+---------+------------------------------------+
*/




/*
4.8. For each member of staff, find out who she/he reports to.  Like this:
(about 3 lines, 2 tables; hint: use the concat() function)
Answer: 
+----------+----------------------+----------------------+
| store_id | staff_name           | manager_name         |
+----------+----------------------+----------------------+
|        1 | Jon Stephens         | Mike Hillyer         |
|        1 | Lajuana Borda        | Mike Hillyer         |
|        1 | Sherrell Mcanally    | Mike Hillyer         |
|        1 | Reyes Gwyn           | Mike Hillyer         |
+----------+----------------------+----------------------+
*/







/*
4.9. Find parents of customers
(about 4 lines; 2 tables; hint: look at 'dob')
Answer: ??
+------------------+---------------------+---------------+---------------------+
| customer         | dob                 | parent        | dob                 |
+------------------+---------------------+---------------+---------------------+
| DUANE YEE        | 1988-12-16 00:00:00 | MARION YEE    | 1962-11-29 00:00:00 |
...
+------------------+---------------------+---------------+---------------------+
*/












/*
4.10. Which customer(s) rented an action film *AND* a travel film *AND* a Music film last month?
(about 30 lines, 19 tables; hint: DATE_FORMAT() (or use DATE_SUB() )
Answer: ??
*/






/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
4.11. Which TWO MALE/FEMALE actors have worked together the most?
(about 9 lines, 4 tables; hint: see 4.2)
Answer: ??
*/




/*
4.12. Some time ago, some films changed in price.  Which films?  What was the old and new price?
*/




/*
4.13. Do any members of staff have the password 'password' for their staff account?
(hint: MD5() )
*/



/*
4.14. Find cases where customers rented more than one movie at the same time.  Which films did they rent?
(hint:  )
*/