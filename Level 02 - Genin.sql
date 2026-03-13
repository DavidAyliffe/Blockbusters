/*	*******************************************************************************
	*** LEVEL 2 - Genin                                                         ***
	***                                                                         ***
	*** Focus: 	Joining more than one table                                     ***
	***			simple select statements                                        ***
	***			simple aggregation of data using 'count(*)'                     ***
	***			grouping data using 'group by'                                  ***
	***                                                                         ***
	***	Limits: Joining not more than six tables                                ***
	***			Multi parameter WHERE clause                                    ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons (excluding 'extra practice')                  ***
	******************************************************************************* */

use blockbusters;

/* save as CRLF for windows */

/*
2.0. What is the name of the male staff member 
	 who has rented the most films?
(±8 lines, 2 tables)
Answer: 
*/
select 	first_name,
		last_name,
		count(*) as films_rented
from staff, rental
where staff.staff_id = rental.staff_id
and sex = 'M'
group by staff.staff_id
order by films_rented desc;


/*
2.1. How many German cities are in the database?
(±5 lines, 2 tables)
Answer:
*/


/*
2.2. What is the most popular language of films?
(±5 lines, 2 tables)
Answer:
*/




/*
2.3. Which male customers have rented the most films?
(±5 lines, 2 tables)
Answer:
*/


/*
2.4. How many female actors were in the film 'MOON BUNCH'.
(±7 lines, 3 tables)
Answer:
*/



/*
2.5. In how many films was "ANGELINA ASTAIRE" an actor?
(±7 lines, 3 tables; (doing this with just two tables is also possible))
Answer:
*/


/*
2.6. Which is the busiest store?
(±6 lines, 3 tables)
Answer:
*/




/*
2.7. How many copies of the film 'TITANS JERK' does the store 'Flicks' have?
(±7 lines, 3 tables)
Answer: 
*/





/*
2.8. Which country has the most female customers?
(¬±7 lines, 4 tables)
Answer:
*/





/*
2.9. How many customers live in Turkey?
(±9 lines, 4 tables)
Answer:
*/





/*
2.10. What is the most popular musical?
(¬±9 lines; 5 tables)
Answer:
*/






/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
2.11. Which store has the most films?
(±5 lines, 2 tables )
Answer:
*/




/*
2.12. Which is the most popular 'R' rated film?
(±5 lines, 3 tables)
*/



/*
2.13. In which month in which year has blockbusters rented the most films?
(3 lines, 1 table )
Hint: date_format( ???, '%Y-%m' )  (https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format)
*/



/*
2.14. Who was the first customer to join blockbusters and for how many days have they been a member?
(3 lines, 1 table )
Hint: datediff( ???, ??? )
*/





/*
2.15. Do any customers have their birthday today?  If so, how old are they?
Hint: date_format( ???,'%m-%d' ); datediff( date1, date2 ) / 365
*/



/*
2.16. For each actor, list the languages of the films they have starred in?
Hint: group_concat()
+-------------+-----------+--------------------------------------------------------------------------------------+
| first_name  | last_name | languages                                                                            |
+-------------+-----------+--------------------------------------------------------------------------------------+
| PENELOPE    | GUINESS   | Arabic,Japanese,Khmer,Malay,Mandarin,Punjabi,Russian,Swahili,Thai,Turkish,Vietnamese |                                                                      |
...
+-------------+-----------+--------------------------------------------------------------------------------------+
*/

